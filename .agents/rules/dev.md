---
trigger: always_on
---

# Diretrizes de Desenvolvimento e Arquitetura

1. **Mentalidade de Produto Real**:
   - Todo código deve ser desenvolvido com qualidade de nível profissional, foco em robustez, manutenibilidade e experiência do usuário (UX).
   - Evite soluções improvisadas ("hacks") ou código descartável quando estiver construindo funcionalidades de produção.

2. **Clean Code e Clareza**:
   - Nomes de variáveis, funções, classes e arquivos devem ser descritivos e autoexplicativos.
   - Mantenha funções pequenas e com responsabilidade única.
   - Evite comentários óbvios que apenas repetem o que o código faz. Mantenha comentários focados em decisões de negócio, premissas ou regras não triviais.

3. **Segurança e Tratamento de Erros**:
   - Valide todas as entradas de dados (inputs de formulários, parâmetros de requisições, variáveis de ambiente).
   - Implemente tratamento de exceções gracioso e log informativo, sem vazar stack traces ou detalhes sensíveis para os usuários finais.
   - Nunca hardcode senhas, URLs de banco com credenciais ou tokens em arquivos rastreados pelo Git.

4. **Consistência de Estrutura**:
   - Mantenha a separação clara de responsabilidades (ex: UI/Componentes, Serviços/Regras de Negócio, Camada de Dados/APIs).
   - Centralize configurações reutilizáveis e constantes no local apropriado em vez de duplicar valores literais.
