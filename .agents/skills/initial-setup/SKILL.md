---
name: initial-setup
description: >-
  Inicializa e padroniza novos projetos com Git (git init, .gitignore abrangente, .gitattributes, .env.example, README.md), estrutura base de pastas e regras do Antigravity (.agents/rules com git.md, dev.md, tests.md). Ative esta skill sempre que o usuário pedir para fazer o setup inicial, inicializar um projeto, configurar repositório ou preparar a base de um novo projeto.
---

# Initial Setup Skill

Esta skill automatiza a preparação e padronização completa de um novo projeto no Antigravity, garantindo que o repositório possua Git configurado, arquivos base essenciais e as regras de desenvolvimento padronizadas.

## Procedimento de Execução

Ao ser ativada, siga os passos abaixo para configurar o projeto:

### 1. Diagnóstico do Ambiente
- Verifique o diretório de trabalho atual (CWD) e obtenha o nome da pasta do projeto.
- Verifique se o Git já foi inicializado (`Test-Path .git`).
- Verifique quais arquivos base (`.gitignore`, `.gitattributes`, `.env.example`, `README.md`) e regras (`.agents/rules/`) já existem.

### 2. Execução Automatizada
Você pode executar o script auxiliar PowerShell embutido na skill:
```powershell
powershell -ExecutionPolicy Bypass -File .agents/skills/initial-setup/scripts/setup.ps1
```
*(Se a skill estiver instalada globalmente em `~/.gemini/config/skills/initial-setup/`, utilize o caminho correspondente ou execute os passos manuais abaixo).*

### 3. Procedimento Direto (Passo a Passo)
Caso execute diretamente via ferramentas do agente:

1. **Inicialização do Git:**
   - Se a pasta `.git` não existir, execute `git init -b main` (ou `git init`).
2. **Criação dos Arquivos Base a partir dos Templates em `resources/templates/`:**
   - `.gitignore`: Crie a partir de [`gitignore.template`](./resources/templates/gitignore.template) (caso não exista).
   - `.gitattributes`: Crie a partir de [`gitattributes.template`](./resources/templates/gitattributes.template) (caso não exista).
   - `.env.example`: Crie a partir de [`env.example.template`](./resources/templates/env.example.template) (caso não exista).
   - `README.md`: Crie a partir de [`README.template.md`](./resources/templates/README.template.md), substituindo `{{PROJECT_NAME}}` pelo nome da pasta do projeto.
3. **Instalação das Regras do Agente em `.agents/rules/`:**
   - Garanta que o diretório `.agents/rules/` exista.
   - Copie [`git.md`](./resources/rules/git.md) (regras de commit semântico em português e segurança).
   - Copie [`dev.md`](./resources/rules/dev.md) (diretrizes de desenvolvimento e código limpo).
   - Copie [`tests.md`](./resources/rules/tests.md) (política de testes e regressão).
4. **Commit Inicial:**
   - Verifique o `git status`.
   - Adicione os arquivos criados e realize o primeiro commit:
     `git commit -m "chore: setup inicial do projeto com gitignore e regras do agente"`

### 4. Validação e Feedback ao Usuário
Apresente um resumo claro contendo:
- Repositório Git e branch configurada.
- Arquivos de configuração gerados (`.gitignore`, `.gitattributes`, `.env.example`, `README.md`).
- Regras de desenvolvimento ativas em `.agents/rules/`.
- Dica de comando para transformar a skill em global (`scripts/install-global.ps1`) quando o usuário desejar utilizá-la em todos os projetos futuros.
