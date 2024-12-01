# Convencional Workflow

[Convencional Commits](https://www.conventionalcommits.org/pt-br/v1.0.0/#especificação)
[SemVer](https://semver.org)

## Pattern for PR and TASK

(tipo)[escopo opcional] (! para quebra de compatibilidade): (descrição) #TASK

Mensagem de commit com escopo e ! para chamar a atenção para quebra a compatibilidade

feat(api)!: envia email para o cliente quando o produto é enviado

### Verbs

feat- Commits do tipo feat indicam que seu trecho de código está incluindo um novo recurso (se relaciona com o MINOR do versionamento semântico).

FIX deveriam vir com testes para garantir que o erro não se repita
fix - Commits do tipo fix indicam que seu trecho de código commitado está solucionando um problema (bug fix), (se relaciona com o PATCH do versionamento semântico).

docs - Commits do tipo docs indicam que houveram mudanças na documentação, como por exemplo no Readme do seu repositório. (Não inclui alterações em código).

FEATS já deveriam vir acompanhadas de test
test - Commits do tipo test são utilizados quando são realizadas alterações em testes, seja criando, alterando ou excluindo testes unitários. (Não inclui alterações em código)

build - Commits do tipo build são utilizados quando são realizadas modificações em arquivos de build e dependências.

perf - Commits do tipo perf servem para identificar quaisquer alterações de código que estejam relacionadas a performance.

style - Commits do tipo style indicam que houveram alterações referentes a formatações de código, semicolons, trailing spaces, lint... (Não inclui alterações em código).

refactor - Commits do tipo refactor referem-se a mudanças devido a refatorações que não alterem sua funcionalidade, como por exemplo, uma alteração no formato como é processada determinada parte da tela, mas que manteve a mesma funcionalidade, ou melhorias de performance devido a um code review.

chore - Commits do tipo chore indicam atualizações de tarefas de build, configurações de administrador, pacotes... como por exemplo adicionar um pacote no gitignore. (Não inclui alterações em código)

ci - Commits do tipo ci indicam mudanças relacionadas a integração contínua (continuous integration).

raw - Commits do tipo raw indicam mudanças relacionadas a arquivos de configurações, dados, features, parâmetros.

cleanup - Commits do tipo cleanup são utilizados para remover código comentado, trechos desnecessários ou qualquer outra forma de limpeza do código-fonte, visando aprimorar sua legibilidade e manutenibilidade.

remove - Commits do tipo remove indicam a exclusão de arquivos, diretórios ou funcionalidades obsoletas ou não utilizadas, reduzindo o tamanho e a complexidade do projeto e mantendo-o mais organizado.

## Assignments

### PR Templates

Useful to describe easily

### Summary of PR Size Strategy

- Small PRs (100–200 LOC):
  Ideal for bug fixes, small features, or incremental improvements.
  Improves review quality and reduces bottlenecks.
- Medium PRs (200–400 LOC):
  Suitable for medium-sized features or multiple related changes.
  Balances depth and speed.
- Large PRs (400+ LOC): EVICT
  Use sparingly for major changes or refactors.
  Implement strategies like chained PRs or feature toggles to unblock work.

### For code reviewers

| Area          | Review Focus                                | ✅  |
| ------------- | ------------------------------------------- | --- |
| Purpose       | Does the PR solve the problem it addresses? |     |
| Correctness   | Is the logic correct?                       |     |
| Tests         | Are there adequate tests? Do they pass?     |     |
| Readability   | Is the code easy to understand?             |     |
| Performance   | Is the code optimized for performance?      |     |
| Security      | Does the code avoid vulnerabilities?        |     |
| Style         | Does it follow the team’s style guide?      |     |
| Documentation | Is documentation updated if needed?         |     |
| Mergeability  | Will this PR merge cleanly?                 |     |

#### Redflags!

Hardcoded values that should be configuration-based.
Commented-out code that can be removed.
Missing tests for critical paths.
Excessive complexity in methods or functions.
Improper error handling (e.g., failing to catch or log exceptions).
