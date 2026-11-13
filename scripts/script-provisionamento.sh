#!/bin/bash
# =============================================================================
# FIAP - GLOBAL SOLUTION 2026/2 | CITIZENTECH & CIDADES SUSTENTÁVEIS (ODS 11)
# Disciplina: DevOps Tools & Cloud Computing
# Projeto: ZelaFix — Zeladoria Urbana Colaborativa
# Script de Provisionamento Declarativo de Infraestrutura (Azure CLI)
# =============================================================================

export MSYS_NO_PATHCONV=1

# -----------------------------------------------------------------------------
# Carregar Variáveis de Ambiente Seguras (.env)
# -----------------------------------------------------------------------------
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# O .env fica na raiz do repositório (pasta acima de /scripts)
for ENV_FILE in "$SCRIPT_DIR/../.env" "$SCRIPT_DIR/.env" ".env"; do
  if [ -f "$ENV_FILE" ]; then
    set -a
    source "$ENV_FILE"
    set +a
    echo "🔒 [DevSecOps] Variáveis carregadas com sucesso a partir de $ENV_FILE"
    break
  fi
done

# Configurações de infraestrutura (parametrizáveis via .env ou ambiente)
RESOURCE_GROUP="${RESOURCE_GROUP:-rg-zelafix}"
LOCATION="${LOCATION:-eastus}"
PLAN_NAME="${PLAN_NAME:-asp-zelafix}"
SKU="${SKU:-F1}"

# Nomes dos Azure Web Apps
WEB_APP_NAME="${WEB_APP_NAME:-app-zelafix-561432}"
WEB_APP_WORKER_NAME="${WEB_APP_WORKER_NAME:-app-zelafix-worker-561432}"

# Conexões e Parâmetros de Banco de Dados (Oracle FIAP - lidos do .env)
ORACLE_URL="${ORACLE_URL:-jdbc:oracle:thin:@//oracle.fiap.com.br:1521/orcl}"
ORACLE_USER="${ORACLE_USER:-}"
ORACLE_PASS="${ORACLE_PASSWORD:-}"
FLYWAY_ENABLED="${FLYWAY_ENABLED:-true}"
JPA_DDL_AUTO="${JPA_DDL_AUTO:-none}"

# RabbitMQ (CloudAMQP - plano gratuito Little Lemur). A URI amqps://USER:SENHA@HOST/VHOST
# carrega host, credenciais, vhost e TLS; o Spring a le via SPRING_RABBITMQ_ADDRESSES.
RABBITMQ_URI="${RABBITMQ_URI:-}"
RABBITMQ_CONCURRENCY="${RABBITMQ_CONCURRENCY:-1}"
if [ -z "$RABBITMQ_URI" ]; then
  echo "❌ RABBITMQ_URI não definida no .env (ex.: amqps://usuario:senha@host.cloudamqp.com/vhost)."
  exit 1
fi

# Spring AI (Groq API - lidos do .env)
GROQ_API_KEY="${GROQ_API_KEY:-}"
GROQ_BASE_URL="${GROQ_BASE_URL:-https://api.groq.com/openai/v1}"
GROQ_MODEL="${GROQ_MODEL:-qwen/qwen3.8-27b}"

# Configuração de Memória Otimizada para o Free Tier F1 (1 GB RAM compartilhado)
# -Xms256m -Xmx512m impede estouro de cgroup / OOMKilled no container Linux
JAVA_OPTS="-Xms256m -Xmx512m -XX:+UseG1GC -Djava.security.egd=file:/dev/./urandom"

echo ""
echo "================================================================="
echo "⚙️  INICIANDO PROVISIONAMENTO DA INFRAESTRUTURA — ZELAFIX"
echo "  Resource Group:   $RESOURCE_GROUP"
echo "  Região:           $LOCATION"
echo "  App Service Plan: $PLAN_NAME ($SKU Linux - Free Tier)"
echo "  Azure Web App:    $WEB_APP_NAME (Runtime Java 21 Java SE)"
echo "================================================================="

# -----------------------------------------------------------------------------
# 0. Limpeza Prévia (Opcional - apaga o RG anterior se passado --clean)
# -----------------------------------------------------------------------------
if [ "$1" = "--clean" ]; then
  echo ""
  echo "🧹 [LIMPEZA] Parâmetro --clean detectado. Verificando se $RESOURCE_GROUP existe..."
  if [ "$(az group exists --name "$RESOURCE_GROUP" 2>/dev/null)" = "true" ]; then
    echo "🗑️ Apagando Resource Group $RESOURCE_GROUP anterior..."
    az group delete --name "$RESOURCE_GROUP" --yes --no-wait
    echo "⏳ Exclusão assíncrona iniciada. Aguardando conclusão..."
    az group wait --deleted --name "$RESOURCE_GROUP"
    echo "✅ Resource Group anterior removido com sucesso."
  else
    echo "ℹ️ Resource Group $RESOURCE_GROUP não existe. Prosseguindo..."
  fi
fi

# -----------------------------------------------------------------------------
# 1. Criação do Resource Group
# -----------------------------------------------------------------------------
echo ""
echo "▶ [1/4] Verificando / Criando Resource Group ($RESOURCE_GROUP)..."
az group create \
  --name "$RESOURCE_GROUP" \
  --location "$LOCATION" \
  --output table

# -----------------------------------------------------------------------------
# 2. Criação do App Service Plan (Linux - F1 Free Tier)
# -----------------------------------------------------------------------------
echo ""
echo "▶ [2/4] Criando App Service Plan ($PLAN_NAME) em Linux ($SKU)..."
# Cria o plano em Linux com o SKU solicitado (F1 Free ou B1 Basic)
az appservice plan create \
  --name "$PLAN_NAME" \
  --resource-group "$RESOURCE_GROUP" \
  --location "$LOCATION" \
  --is-linux \
  --sku "$SKU" \
  --output table

# -----------------------------------------------------------------------------
# 3. Criação dos Azure Web Apps (API + Worker) - Runtime Java 21
# -----------------------------------------------------------------------------
echo ""
echo "▶ [3/4] Criando Azure Web App da API ($WEB_APP_NAME) com Java 21..."
az webapp create \
  --name "$WEB_APP_NAME" \
  --resource-group "$RESOURCE_GROUP" \
  --plan "$PLAN_NAME" \
  --runtime "JAVA|21-java21" \
  --output table

echo ""
echo "▶ [3.1/4] Criando Azure Web App do Worker ($WEB_APP_WORKER_NAME) com Java 21..."
az webapp create \
  --name "$WEB_APP_WORKER_NAME" \
  --resource-group "$RESOURCE_GROUP" \
  --plan "$PLAN_NAME" \
  --runtime "JAVA|21-java21" \
  --output table

echo ""
echo "▶ [3.2/4] Configurando comandos de inicialização customizados..."
az webapp config set \
  --resource-group "$RESOURCE_GROUP" \
  --name "$WEB_APP_NAME" \
  --startup-file "java -Dserver.port=8080 -jar /home/site/wwwroot/zelafix-api.jar" \
  --output table

az webapp config set \
  --resource-group "$RESOURCE_GROUP" \
  --name "$WEB_APP_WORKER_NAME" \
  --startup-file "java -Dserver.port=8081 -jar /home/site/wwwroot/zelafix-worker.jar" \
  --output table

# -----------------------------------------------------------------------------
# 4. Configuração das Variáveis de Ambiente Seguras (App Settings)
# -----------------------------------------------------------------------------
echo ""
echo "▶ [4/4] Configurando Variáveis de Ambiente na API (Porta 8080)..."

az webapp config appsettings set \
  --resource-group "$RESOURCE_GROUP" \
  --name "$WEB_APP_NAME" \
  --settings \
    PORT="8080" \
    WEBSITES_PORT="8080" \
    ORACLE_URL="$ORACLE_URL" \
    ORACLE_USER="$ORACLE_USER" \
    ORACLE_PASSWORD="$ORACLE_PASS" \
    JPA_DDL_AUTO="$JPA_DDL_AUTO" \
    FLYWAY_ENABLED="$FLYWAY_ENABLED" \
    JAVA_OPTS="$JAVA_OPTS" \
    SPRING_RABBITMQ_ADDRESSES="$RABBITMQ_URI" \
    WORKER_URL="https://${WEB_APP_WORKER_NAME}.azurewebsites.net" \
  --output table

echo ""
echo "▶ [4.1/4] Configurando Variáveis de Ambiente no Worker (Porta 8081)..."

# Nota: O Worker é 100% desacoplado do banco relacional Oracle.
# Ele se comunica exclusivamente via RabbitMQ (consumo de triagem/votos e publicação do parecer).
az webapp config appsettings set \
  --resource-group "$RESOURCE_GROUP" \
  --name "$WEB_APP_WORKER_NAME" \
  --settings \
    WORKER_PORT="8081" \
    PORT="8081" \
    WEBSITES_PORT="8081" \
    JAVA_OPTS="$JAVA_OPTS" \
    RABBITMQ_CONCURRENCY="$RABBITMQ_CONCURRENCY" \
    SPRING_RABBITMQ_ADDRESSES="$RABBITMQ_URI" \
    GROQ_API_KEY="$GROQ_API_KEY" \
    GROQ_BASE_URL="$GROQ_BASE_URL" \
    GROQ_MODEL="$GROQ_MODEL" \
  --output table

# -----------------------------------------------------------------------------
# 5. Informações e Resumo de Entrega
# -----------------------------------------------------------------------------
WEB_APP_URL=$(az webapp show --resource-group "$RESOURCE_GROUP" --name "$WEB_APP_NAME" --query "defaultHostName" -o tsv)
WEB_APP_WORKER_URL=$(az webapp show --resource-group "$RESOURCE_GROUP" --name "$WEB_APP_WORKER_NAME" --query "defaultHostName" -o tsv)

echo ""
echo "================================================================="
echo "✅ INFRAESTRUTURA PROVISIONADA COM SUCESSO! (API + WORKER)"
echo "================================================================="
echo "🌐 API REST (Mobile / Web):  https://${WEB_APP_URL}"
echo "📖 Swagger UI (API):         https://${WEB_APP_URL}/swagger-ui.html"
echo "🩺 Health Check (API):       https://${WEB_APP_URL}/actuator/health"
echo "⚙️  Worker Assíncrono:       https://${WEB_APP_WORKER_URL}"
echo "🩺 Health Check (Worker):    https://${WEB_APP_WORKER_URL}/actuator/health"
echo "-----------------------------------------------------------------"
echo "🚀 INFORMAÇÕES PARA O AZURE DEVOPS (azure-pipelines.yml):"
echo "   Resource Group:               $RESOURCE_GROUP"
echo "   Plano / SKU:                  $PLAN_NAME ($SKU)"
echo "   Web App API (webAppName):     $WEB_APP_NAME"
echo "   Web App Worker (workerName):  $WEB_APP_WORKER_NAME"
echo "   Service Connection:           ZelaFix-Connection"
echo "================================================================="
