# {{PROJECT_NAME}}

> Breve descrição do objetivo do projeto e valor entregue.

---

## 🚀 Visão Geral

Explicação de alto nível sobre a aplicação, principais recursos e caso de uso.

## 🛠️ Tecnologias Principais

- **Linguagem / Runtime:** 
- **Framework / Core:** 
- **Banco de Dados:** 
- **Testes & Qualidade:** 

## 📋 Pré-requisitos

Certifique-se de ter instalado em sua máquina:
- Git
- Runtime adequado (Node.js / .NET / Python / Docker)

## ⚡ Começando Rápido

1. **Clone o repositório:**
   ```bash
   git clone <URL_DO_REPOSITORIO>
   cd {{PROJECT_NAME}}
   ```

2. **Configure as variáveis de ambiente:**
   ```bash
   cp .env.example .env
   ```

3. **Instale as dependências:**
   ```bash
   # Exemplo: npm install ou dotnet restore ou poetry install
   ```

4. **Inicie o ambiente de desenvolvimento:**
   ```bash
   # Exemplo: npm run dev
   ```

## 📂 Estrutura de Pastas

```text
├── .agents/             # Configurações, regras e skills do Antigravity
│   └── rules/           # Diretrizes de git, arquitetura e qualidade
├── docs/                # Documentações técnicas e especificações
├── src/                 # Código-fonte principal
├── tests/               # Testes automatizados (unitários e integração)
├── .env.example         # Exemplo de configuração de variáveis
├── .gitignore           # Filtros de arquivos ignorados no repositório
└── README.md            # Documentação principal
```

## 🤝 Padrões de Desenvolvimento

Este projeto utiliza diretrizes estabelecidas na pasta [`.agents/rules`](.agents/rules/):
- **Commits:** Padrão semântico em português (`tipo(escopo): descrição`).
- **Qualidade:** Padrão de produto com validações e testes obrigatórios antes de commits.
