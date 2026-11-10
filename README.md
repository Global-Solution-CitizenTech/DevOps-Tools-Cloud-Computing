# 🏙️ ZelaFix Backend — DevOps Tools & Cloud Computing

> **FIAP — Global Solution 2026/2 | CitizenTech: Tecnologia com o Cidadão no Centro da Inovação (ODS 11)**  
> **Disciplina:** DevOps Tools & Cloud Computing  
> **Professor:** Antonio Sergio Rodrigues Figueiredo

<p align="left">
  <img src="https://img.shields.io/badge/Cloud-Microsoft_Azure-0078D4?logo=microsoftazure&logoColor=white" alt="Azure" />
  <img src="https://img.shields.io/badge/Plan-F1_Free_Tier-0089D6?logo=azuredevops&logoColor=white" alt="F1 Free Tier" />
  <img src="https://img.shields.io/badge/CI%2FCD-Azure_Pipelines-0078D7?logo=azuredevops&logoColor=white" alt="Azure DevOps" />
  <img src="https://img.shields.io/badge/Java-21_LTS-007396?logo=openjdk&logoColor=white" alt="Java 21 LTS" />
  <img src="https://img.shields.io/badge/Spring_Boot-4.1.1-6DB33F?logo=springboot&logoColor=white" alt="Spring Boot 4.1.1" />
  <img src="https://img.shields.io/badge/Build-Gradle-02303A?logo=gradle&logoColor=white" alt="Gradle" />
  <img src="https://img.shields.io/badge/Database-Oracle_19c-F80000?logo=oracle&logoColor=white" alt="Oracle Database 19c" />
  <img src="https://img.shields.io/badge/IaC-Azure_CLI_Bash_%26_PowerShell-4EAA25?logo=gnubash&logoColor=white" alt="IaC" />
</p>

---

## 📌 Links Rápidos do Projeto

| Recurso | Descrição | Link |
|---|---|---|
| 🌐 **API em Produção (Azure Web App)** | Endpoint base do App Service da API REST (Plano F1 Linux - Porta 8080) | `https://app-zelafix-561432.azurewebsites.net` |
| 📖 **Swagger UI Interativo (Produção)** | Console OpenAPI interativo com documentação dos endpoints da API | `https://app-zelafix-561432.azurewebsites.net/swagger-ui.html` |
| 🩺 **Actuator Health (API)** | Healthcheck em tempo real da API (Oracle DB + Liveness) | `https://app-zelafix-561432.azurewebsites.net/actuator/health` |
| ⚙️ **Worker em Produção (Azure Web App)** | Host do Heavy Worker de Triagem Inteligente e Votos (Porta 8081) | `https://app-zelafix-worker-561432.azurewebsites.net` |
| 🩺 **Actuator Health (Worker)** | Healthcheck em tempo real do Worker (RabbitMQ + Groq AI + DB) | `https://app-zelafix-worker-561432.azurewebsites.net/actuator/health` |
| 📊 **OpenAPI Spec (JSON)** | Especificação OpenAPI 3.0 para consumo do app Mobile | `https://app-zelafix-561432.azurewebsites.net/v3/api-docs` |
| 🚀 **Projeto no Azure DevOps** | Organização e Projeto Privado com Boards, Repos e Pipelines | `https://dev.azure.com/GlobalSolution-CitizenTech/ZelaFix` |
| 💻 **Repositório GitHub (DevOps)** | Repositório de IaC, Dockerfile e Esteiras YAML de CI/CD | [DevOps-Tools-Cloud-Computing](https://github.com/Global-Solution-CitizenTech/DevOps-Tools-Cloud-Computing) |
| ☕ **Repositório GitHub (Java Advanced)** | Código-fonte da aplicação Spring Boot e suíte de testes | [Java-Advanced](https://github.com/Global-Solution-CitizenTech/Java-Advanced) |
| 🎥 **Vídeo de Demonstração (YouTube)** | Demonstração narrada por voz com esteira completa e CRUD | *(Link YouTube a ser inserido após gravação)* |

---

## 👥 Integrantes do Grupo (Ordem Alfabética Estrita)

| RM | Nome Completo | Turma | Papel / GitHub |
| :---: | :--- | :---: | :--- |
| **RM561432** | Enzo Okuizumi Miranda de Souza | 2TDSPG | [EnzoOkuizumiFiap](https://github.com/EnzoOkuizumiFiap) |
| **RM563428** | Gustavo Keiji Okada | 2TDSPG | [Gdev3356](https://github.com/Gdev3356) |
| **RM566422** | Lucas Barros Gouveia | 2TDSPG | [LuzBGouveia](https://github.com/LuzBGouveia) |
| **RM562290** | Luna de Carvalho Guimarães | 2TDSPG | [lunaguima](https://github.com/lunaguima) |
| **RM564836** | Milton Jakson de Sousa Marcelino | 2TDSPG | [MiltonMarcelino](https://github.com/MiltonMarcelino) |

---

## 1. 📖 Descrição da Solução (Tema CitizenTech — ODS 11)

O **ZelaFix** é uma plataforma corporativa de **zeladoria urbana colaborativa** desenvolvida sob o paradigma **CitizenTech**, colocando o munícipe como agente ativo na fiscalização e melhoria contínua da infraestrutura urbana (buracos no asfalto, iluminação defeituosa, vazamentos e descarte irregular de lixo).

### Principais Pilares da Solução:
* **Canal Cidadão:** Abertura simplificada de ocorrências georreferenciadas com fotos e descrição detalhada.
* **Engajamento Comunitário:** Sistema de apoio e votos por munícipes da mesma região para priorização coletiva de chamados perante a administração pública.
* **Painel da Gestão Municipal:** Rastreabilidade do ciclo de vida dos chamados (`ABERTO`, `EM_ANALISE`, `EM_ANDAMENTO`, `CONCLUIDO`, `CANCELADO`) com histórico cronológico auditável.
* **Triagem Inteligente:** Assistência de IA para classificação de criticidade e direcionamento automático para a secretaria responsável.

### 🛠️ Stack Tecnológica

| Componente | Tecnologia | Finalidade |
|---|---|---|
| **Linguagem & Runtime** | Java 21 LTS | Runtime corporativo oficial (LTS) |
| **Framework Base** | Spring Boot 4.1.1 | Framework RESTful com Spring Data JPA, Security e Actuator |
| **Gerenciador de Build** | Gradle Wrapper (8.x) | Automação determinística de compilação, testes e geração de chaves RSA |
| **Banco de Dados Relacional** | Oracle Database 19c (FIAP Cloud) | Persistência estrita em 3ª Forma Normal (3FN) conforme `citizenTech.ddl` |
| **Nuvem de Hospedagem** | Microsoft Azure App Service (Linux) | Host PaaS com plano **F1 (Free Tier)** para execução contínua sem custos |
| **Esteira de CI/CD** | Azure DevOps Pipelines | Automação completa: compilação, testes unitários, publicação de artefato e deploy |
| **Agente de Execução** | Self-Hosted Agent (Windows) / Microsoft-Hosted | Pool `Default` dedicado para build e testes sem restrições de concorrência ou cotas |
| **Infraestrutura como Código (IaC)** | Azure CLI / Bash & PowerShell | Provisionamento declarativo e idempotente do Resource Group, Plan e Web App |

---

## 2. 🏛️ Arquitetura da Solução & Diagrama do Fluxo CI/CD

```
+-----------------------------------------------------------------------------------------------------------------+
|                              ARQUITETURA EM NUVEM MICROSOFT AZURE & ESTEIRA CI/CD                               |
+-----------------------------------------------------------------------------------------------------------------+

 [🧑‍💻 Desenvolvedor] 
         │
         │ [1] git push origin feature/tarefa-boards
         ▼
 ┌────────────────────────────────────────────────────────────┐
 │  Azure Repos / GitHub (Branch Feature -> Pull Request)     │
 │  • Política de Branch: Revisor Obrigatório + Work Item     │
 └─────────────────────────────┬──────────────────────────────┘
                               │ [2] Merge aprovado na branch 'main'
                               ▼
 ┌─────────────────────────────────────────────────────────────────────────────────┐
 │ AZURE DEVOPS PIPELINES (ZelaFix CI/CD — Multi-Service)                          │
 │                                                                                 │
 │   ┌─────────────────────────────────────────────────────────────────────────┐   │
 │   │ ETAPA 1: CI (Continuous Integration) — Agente Pool 'Default'            │   │
 │   │                                                                         │   │
 │   │   [3] Compilação Gradle Wrapper:                                        │   │
 │   │       `call gradlew.bat clean test bootJar --no-daemon`                 │   │
 │   │                                                                         │   │
 │   │   [4] Execução da Suíte de Testes Automatizados (JUnit 5 + Mockito)     │   │
 │   │                                                                         │   │
 │   │   [5] Publicação de Resultados de Testes XML:                           │   │
 │   │       `PublishTestResults@2` -> Relatório nativo no Azure DevOps        │   │
 │   │                                                                         │   │
 │   │   [6] Empacotamento e Publicação de Artefatos:                          │   │
 │   │       • zelafix-api.jar (Porta 8080)                                    │   │
 │   │       • zelafix-worker.jar (Porta 8081)                                 │   │
 │   │       `PublishBuildArtifacts@1` -> Container de artefato: drop/         │   │
 │   └────────────────────────────────────┬────────────────────────────────────┘   │
 │                                        │                                        │
 │                                        │ [7] Disparo Automático de Release (CD) │
 │                                        ▼                                        │
 │   ┌─────────────────────────────────────────────────────────────────────────┐   │
 │   │ ETAPA 2: CD (Continuous Deployment) — Deploy nos Azure Web Apps         │   │
 │   │                                                                         │   │
 │   │   [8] Task `AzureWebApp@1` (API):                                       │   │
 │   │       Deploy atômico de `zelafix-api.jar` no Web App `app-zelafix`      │   │
 │   │   [9] Task `AzureWebApp@1` (Worker):                                    │   │
 │   │       Deploy atômico de `zelafix-worker.jar` no Web App `app-worker`    │   │
 │   └────────────────────────────────────┬────────────────────────────────────┘   │
 └────────────────────────────────────────┼────────────────────────────────────────┘
                                          │
                                          │ Deploy dos Binários JAR Executáveis
                                          ▼
 ┌─────────────────────────────────────────────────────────────────────────────────┐
 │ MICROSOFT AZURE CLOUD (Resource Group: rg-zelafix | Região: East US)            │
 │                                                                                 │
 │   ┌───────────────────────────────────┐ ┌───────────────────────────────────┐   │
 │   │ Web App: `app-zelafix-561432`     │ │ Web App: `app-zelafix-worker`     │   │
 │   │ Runtime: Java 21 (API REST 8080)  │ │ Runtime: Java 21 (Worker 8081)    │   │
 │   │ Produtor RabbitMQ & Auth JWT      │ │ Consumidor RabbitMQ & Spring AI   │   │
 │   └─────────────────┬─────────────────┘ └─────────────────┬─────────────────┘   │
 └─────────────────────┼─────────────────────────────────────┼─────────────────────┘
                       │                                     │
                       │ Publica Mensagem                    │ Consome Mensagem
                       ▼                                     ▼
       ┌─────────────────────────────────────────────────────────────┐
       │ RabbitMQ Message Broker (CloudAMQP / AMQPS TLS 5671)        │
       │ • Exchange: `zelafix.direct`                                │
       │ • Filas: `chamado.triagem.queue` e `chamado.voto.queue`     │
       └─────────────────────────────────────────────────────────────┘
                       │                                     │
                       ▼                                     ▼
               ┌─────────────────────────────────────────────────────┐
               │ Oracle Database 19c (FIAP Cloud: oracle.fiap.com)   │
               │ • 11 Tabelas Relacionais 3FN                        │
               │ • Migrations Flyway aplicadas no boot               │
               │ • CRUD & Persistência em Nuvem                      │
               └─────────────────────────────────────────────────────┘
                                       ▲
                                       │ HTTPS (Porta 443) / REST / Swagger UI
                                       │
                         [📱 Munícipe (Mobile React Native)]
```

### 🔢 Descrição Detalhada das 8 Etapas da Esteira:

1. **Gatilho de Código & Pull Request:** O desenvolvedor realiza commits em uma branch de trabalho vinculada a uma tarefa do **Azure Boards**. A branch principal `main` é estritamente protegida por políticas de branch.
2. **Merge Aprovado na `main`:** Ao aprovar e completar o Pull Request na `main`, o gatilho (`trigger`) da pipeline é acionado automaticamente.
3. **Inicialização do Agente:** O agente aloca o job de build em ambiente com JDK 21 e Gradle Wrapper.
4. **Execução de Build e Testes Automatizados:** O comando Gradle compila os módulos, gera os pares de chaves criptográficas RSA 2048-bit dinamicamente e executa os testes unitários e de integração JUnit.
5. **Publicação dos Testes:** A tarefa `PublishTestResults@2` lê os relatórios gerados em `**/zelafix-api/build/test-results/test/TEST-*.xml` e publica a aba interativa de testes no Azure DevOps.
6. **Publicação do Artefato:** O arquivo `zelafix-api-*.jar` é copiado e padronizado como `app.jar` na pasta de staging e publicado no container de artefatos `drop` via `PublishBuildArtifacts@1`.
7. **Disparo do Estágio CD:** Após 100% de sucesso nas etapas de CI, a etapa de CD é iniciada automaticamente.
8. **Deploy Atômico no Azure App Service:** A tarefa `AzureWebApp@1` autentica via Service Connection (`ZelaFix-Connection`) e realiza o deploy do `app.jar` no Azure Web App Linux no plano **F1 Free Tier**, reiniciando o serviço com as variáveis de ambiente configuradas.

---

## 3. ☁️ Banco de Dados em Nuvem (Requisito 08 & 10)

O backend utiliza o banco de dados corporativo **Oracle Database 19c** hospedado na infraestrutura da FIAP:

* **Host / Conexão:** `jdbc:oracle:thin:@//oracle.fiap.com.br:1521/orcl`
* **Schema / Usuário:** `RM561432`
* **Script DDL Oficial:** [`scripts/script-bd.sql`](./scripts/script-bd.sql) (DDL integral contendo 11 tabelas em 3ª Forma Normal, sequences e constraints conforme o Data Modeler `citizenTech.ddl`).
* **Migrations Automatizadas:** Gerenciadas pelo **Flyway** no boot da aplicação, aplicando schemas e dados iniciais idempotentes.

---

## 4. ⚙️ Configuração do Projeto no Azure DevOps (Requisitos 01 a 06)

* **Visibilidade:** Projeto Privado (`Private`).
* **Processo de Trabalho:** `Agile` (Azure Boards integrado a Repos e Pipelines).
* **Políticas de Branch na `main` (Branch Policies):**
  - Número mínimo de revisores: 1 (com permissão para o autor aprovar seu próprio PR para fins acadêmicos).
  - Vinculação obrigatória de Work Item (nenhum código entra na `main` sem tarefa rastreada).
  - Revisor padrão configurado (RM do aluno responsável).
* **Acesso do Professor:**
  - *Nível da Organização:* **Basic**
  - *Nível do Projeto:* **Project Administrators**
* **Segurança e DevSecOps (Variáveis Protegidas):**
  - As credenciais de banco de dados (`ORACLE_PASSWORD`, `ORACLE_URL`, `ORACLE_USER`) são cadastradas como **Secrets** mascarados nas variáveis da pipeline (Azure DevOps Library) e no Application Settings do Web App, sem exposição de texto puro no repositório Git.

---

## 5. 📜 Script de Provisionamento de Infraestrutura (Azure CLI)

O repositório disponibiliza o script automatizado [`script-provisionamento.sh`](./script-provisionamento.sh) em Bash utilizando o **Azure CLI** para criação e configuração declarativa e idempotente de toda a infraestrutura em nuvem:

```bash
# Execução no terminal com Azure CLI autenticado:
chmod +x script-provisionamento.sh
./script-provisionamento.sh
```

### Limpeza e Reconstrução (--clean):
```bash
./script-provisionamento.sh --clean
```

### 💡 Por que o Plano F1 (Free Tier) e como ele é configurado?
* **Custo Zero:** O plano `F1` (Free Tier) Linux do Azure App Service oferece 60 minutos de computação por dia e 1 GB de memória RAM compartilhada, sendo 100% gratuito e ideal para avaliações acadêmicas.
* **Otimização de JVM para F1:** Para evitar que o container Linux seja derrubado por limite de memória (*OOMKilled*), o script de provisionamento injeta automaticamente a configuração:
  ```bash
  JAVA_OPTS="-Xms256m -Xmx512m -XX:+UseG1GC -Djava.security.egd=file:/dev/./urandom"
  ```
* **Escalabilidade Imediata:** Caso seja necessário manter a aplicação com *Always On* contínuo durante a banca avaliadora, basta alternar para o SKU `B1` com um único comando:
  ```bash
  az appservice plan update --name asp-zelafix --resource-group rg-zelafix --sku B1
  ```

---

## 6. 🧪 Payloads JSON de Exemplo para Teste de CRUD

Abaixo constam os payloads representativos para execução das operações de **CRUD** nas entidades principais:

### A. Autenticação (`POST /auth/login`)
```json
{
  "email": "admin@zelafix.sp.gov.br",
  "senha": "admin"
}
```
*Retorna o token `Bearer eyJhbGciOiJSUzI1NiIsIn...` utilizado no header `Authorization` das requisições subsequentes.*

### B. CRUD de Usuários (`/usuarios`)
* **Create (`POST /usuarios`):**
  ```json
  {
    "nome": "Mariana Souza Santos",
    "email": "mariana.santos@email.com",
    "senha": "SenhaForte@2026",
    "cpf": "12345678909",
    "cargo": "CIDADAO",
    "telefone": {
      "ddd": 11,
      "numero": 987654321
    }
  }
  ```
* **Read (`GET /usuarios?page=0&size=10`):** Retorna lista paginada de usuários.
* **Update (`PUT /usuarios/1`):**
  ```json
  {
    "nome": "Mariana Souza Santos Atualizada",
    "email": "mariana.atualizada@email.com",
    "senha": "SenhaForte@2026",
    "cpf": "12345678909",
    "cargo": "CIDADAO",
    "telefone": {
      "ddd": 11,
      "numero": 999887766
    }
  }
  ```
* **Delete (`DELETE /usuarios/1`):** Remove o registro indicado.

### C. CRUD de Chamados de Zeladoria (`/chamados`)
* **Create (`POST /chamados`):**
  ```json
  {
    "titulo": "Buraco profundo na via pública",
    "descricao": "Buraco de grandes proporções no asfalto próximo ao cruzamento, causando risco iminente de acidentes para carros e motociclistas.",
    "idCategoria": 1,
    "latitude": -23.55052,
    "longitude": -46.633308,
    "logradouro": "Avenida Paulista",
    "numero": "1106",
    "bairro": "Bela Vista",
    "cidade": "São Paulo",
    "uf": "SP",
    "cep": "01311000",
    "urlFoto": "https://zelafix.storage/fotos/buraco_paulista_01.jpg"
  }
  ```
* **Read (`GET /chamados?page=0&size=10&sort=dtAbertura,desc`):** Retorna ocorrências paginadas e ordenadas.
* **Update (`PUT /chamados/1`):**
  ```json
  {
    "titulo": "Buraco profundo na via pública (Risco Elevado)",
    "descricao": "Buraco aumentou de tamanho após as chuvas recentes, requer intervenção urgente da subprefeitura.",
    "idCategoria": 1,
    "latitude": -23.55052,
    "longitude": -46.633308,
    "logradouro": "Avenida Paulista",
    "numero": "1106",
    "bairro": "Bela Vista",
    "cidade": "São Paulo",
    "uf": "SP",
    "cep": "01311000",
    "urlFoto": "https://zelafix.storage/fotos/buraco_paulista_02.jpg"
  }
  ```
* **Apoiar / Votar (`POST /chamados/1/apoiar`):** Registra o apoio da comunidade para priorização.
* **Delete (`DELETE /chamados/1`):** Cancela ou remove o chamado.

---

## 7. 🎥 Roteiro Sequencial para Gravação do Vídeo de Demonstração

Para atender estritamente aos 10 passos obrigatórios exigidos pelo edital da Global Solution 2 e garantir pontuação máxima (sem sofrer penalidades de 20 a 30 pontos), a gravação do vídeo narrado por voz deve seguir esta ordem cronológica:

| Passo | Tela / Ferramenta | O que Fazer e Narrar | Requisito do Edital Atendido |
|:---:|:---|:---|:---|
| **1** | Navegador (README) | Apresentar o `README.md`, contextualizar a proposta CitizenTech (ZelaFix), os integrantes e explicar o desenho macro da arquitetura em nuvem. | *Roteiro Passo 1* |
| **2** | Portal Microsoft Azure | Exibir o Resource Group `rg-zelafix`, o App Service Plan `asp-zelafix` (F1 Free) e o Web App criados pelos scripts Azure CLI. | *Roteiro Passo 2* |
| **3** | Azure Boards | Acessar o Azure Boards e criar uma nova Tarefa (ex: *"Ajuste descritivo da API ZelaFix no endpoint info"*). | *Roteiro Passo 3* |
| **4** | IDE / Terminal Git | Criar uma nova branch a partir da tarefa no Boards, realizar uma alteração visível no **código-fonte** da aplicação Java (ex: adicionar mensagem em um controller ou no actuator), commitar e enviar para o repositório. *(Atenção: NÃO alterar apenas README)*. | *Roteiro Passo 4* |
| **5** | Azure Repos | Abrir o Pull Request vinculando a Tarefa do Boards, aprovar a PR e concluir o Merge para a branch principal `main`. Mostrar o gatilho automático disparando a pipeline de CI. | *Roteiro Passo 5* |
| **6** | Azure Pipelines (CI) | Acompanhar a execução da esteira de CI: destacar a compilação Gradle, a execução dos testes JUnit com 100% de sucesso e a geração do artefato `drop/app.jar`. | *Roteiro Passo 6* |
| **7** | Azure Pipelines (CD) | Demonstrar o início automático do estágio de Release (CD) publicando o binário no Azure App Service. | *Roteiro Passo 7* |
| **8** | Portal Azure / Navegador | Acessar a URL do Web App em nuvem (`https://app-zelafix-561432.azurewebsites.net`) e evidenciar que a alteração realizada no código já está online e ativa. | *Roteiro Passo 8* |
| **9** | Swagger UI + Cliente SQL (DBeaver/SQL Developer) | **Gravação contínua sem cortes:** Executar operações completas de CRUD (Create, Read, Update, Delete) em pelo menos duas tabelas distintas (`USUARIO` e `CHAMADO`). Imediatamente após cada operação, rodar comandos `SELECT * FROM ...` diretamente no banco Oracle da FIAP provando a persistência real dos dados em nuvem. | *Roteiro Passo 9 (Penalidade grave se ausente)* |
| **10** | Azure Boards | Retornar ao Azure Boards e exibir a Tarefa concluída com todo o histórico de vínculos associados (Branch, Commits e Pull Request rastreados). | *Roteiro Passo 10* |

---

## 8. ✅ Matriz de Conformidade com os Requisitos Técnicos

| Requisito | Descrição Oficial | Status | Evidência no Repositório |
|:---:|:---|:---:|:---|
| **01** | Repositório Git privado e versionado | ✅ Atendido | Repositório privado com controle de versão Git |
| **02** | Azure Boards vinculado ao Repos com rastreabilidade | ✅ Atendido | Work Items vinculados a branches, commits e PRs |
| **03** | Branch `main` protegida por políticas (revisor e work item) | ✅ Atendido | Políticas de branch configuradas com revisor e restrição de push direto |
| **04** | Pipeline de CI disparada apenas após Merge via PR na `main` | ✅ Atendido | Configurado no gatilho do `azure-pipelines.yml` |
| **05** | Aluno autorizado a aprovar a própria PR (simulação acadêmica) | ✅ Atendido | Habilitado nas permissões de branch policies |
| **06** | Pipeline de Release executa automaticamente após CI | ✅ Atendido | Estágio `Deploy` condicionado ao sucesso do estágio `Build` |
| **07** | Deploy da aplicação via PaaS (App Service) | ✅ Atendido | Azure App Service Linux (PaaS) |
| **08** | Banco de dados hospedado em nuvem (Oracle FIAP Cloud) | ✅ Atendido | Oracle Database 19c Corporativo FIAP Cloud |
| **09** | Scripts de infraestrutura versionados no repositório | ✅ Atendido | [`script-provisionamento.sh`](./script-provisionamento.sh) |
| **10** | DDL dos objetos de banco de dados documentados | ✅ Atendido | Schema corporativo 3FN Oracle |
| **11** | Scripts de automação Azure CLI | ✅ Atendido | [`script-provisionamento.sh`](./script-provisionamento.sh) |
| **12** | Arquivo de pipeline CI/CD na raiz do repositório | ✅ Atendido | [`azure-pipelines.yml`](./azure-pipelines.yml) |
| **13** | Payloads JSON de exemplo para teste de CRUD no README | ✅ Atendido | Documentados na Seção 6 |
| **14** | Utilização de variáveis de ambiente sem senhas em texto puro | ✅ Atendido | Parametrização via secrets no Azure DevOps e Application Settings |
| **15** | Desenho macro da arquitetura em nuvem (diagrama e fluxo) | ✅ Atendido | Diagramas ASCII e descrições documentadas na Seção 2 |
| **16** | Execução de testes 100% automática na esteira de CI | ✅ Atendido | Execução de testes JUnit e publicação via `PublishTestResults@2` |

---

## 9. 📁 Estrutura de Arquivos deste Repositório

```
DevOps-Tools-Cloud-Computing/
├── docs/                               # Diagramas e documentações complementares em PDF/PNG
├── azure-pipelines.yml                 # Definição oficial da esteira CI/CD (Build, Testes, Artefato e Deploy)
├── script-provisionamento.sh           # Script Bash (Azure CLI) para criação do RG, App Service Plan e Web App
└── README.md                           # Documentação técnica consolidada da disciplina
```

---

> **ZelaFix** — Tecnologia com o Cidadão no Centro da Inovação Urbana.
