---
trigger: always_on
---

# Diretrizes de Testes Automatizados

1. **Qualidade e Cobertura**:
   - Funcionalidades críticas e regras de negócio essenciais devem possuir testes automatizados cobrindo os cenários principais e casos de borda (edge cases).
   - Testes unitários para lógica pura e serviços; testes integrados para endpoints e fluxos de dados.

2. **Validação Antes de Commits**:
   - Antes de finalizar uma tarefa ou realizar commits, execute a suíte de testes relevante ou o build do projeto para garantir zero quebras de regressão.

3. **Mocks e Isolamento**:
   - APIs de terceiros, provedores externos e recursos pesados devem ser mockados nos testes para garantir rapidez, idempotência e independência de rede externa.
   - Testes não devem depender de ordem arbitrária de execução nem deixar efeitos colaterais em ambientes compartilhados.
