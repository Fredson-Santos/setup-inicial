---
trigger: always_on
---

# Regras de Commit Git

1. **Idioma**: Todos os commits devem ser escritos em **Português**.
2. **Estilo**: Simples, diretos, objetivos e em tempo verbal presente/infinitivo.
3. **Padrão de Mensagem**: Seguir o formato convencional `tipo(escopo): descrição` ou `tipo: descrição`.
   - A descrição deve começar com letra minúscula.
   - Não use ponto final ao término da mensagem.
4. **Atomicidade e Granularidade**:
   - **Commits Separados**: Não agrupar modificações massivas ou desconexas em um só commit.
   - **Divisão por Área**: Sempre que houver mudanças em áreas distintas (ex: `backend`, `frontend`, `db`, `docs`, `infra`), realize **commits separados** para cada área.
   - **Unidade Lógica**: Cada commit deve representar uma alteração completa e testável.
5. **Segurança e Prevenção de Vazamentos**:
   - **Verificação Obrigatória**: Antes de qualquer commit, é estritamente obrigatório verificar se não há credenciais, senhas, tokens JWT, chaves de API ou connection strings nos arquivos.
   - **Arquivos Sensíveis**: Nunca adicione arquivos `.env`, `.env.local` ou bancos SQLite de desenvolvimento (`.db`, `.sqlite`) ao tracking do Git. Certifique-se de que estão no `.gitignore`.
   - **Histórico**: Se identificar que um segredo foi adicionado acidentalmente, não faça um novo commit por cima — remova a credencial ou avise para reescrever o histórico.

## Tipos e Escopos Principais

- `feat`: Novas funcionalidades.
- `fix`: Correções de bugs.
- `docs`: Alterações em documentação ou especificações.
- `style`: Mudanças de formatação de código ou CSS que não alterem a lógica.
- `refactor`: Refatoração de código sem alteração de comportamento.
- `test`: Adição ou ajuste de testes automatizados.
- `infra`: Alterações em Docker, Docker Compose, CI/CD ou scripts de automação.
- `chore`: Atualizações de dependências, tarefas de manutenção ou setup de projeto.

### Exemplos Práticos

- `feat(auth): implementa autenticação via JWT com refresh token`
- `fix(checkout): corrige validação de CEP na finalização do pedido`
- `style(ui): ajusta padding e cores dos botões conforme design system`
- `chore: setup inicial do projeto com gitignore e regras de desenvolvimento`
