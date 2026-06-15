# Roteiro de falas para apresentacao dos slides - ProTech

> Objetivo do roteiro: orientar a apresentacao oral, destacando nao apenas o que aparece no slide, mas tambem os pontos do codigo que comprovam cada funcionalidade.

---

## Slide 1 - ProTech

Fala sugerida:

"Este projeto se chama ProTech. Ele e um aplicativo Flutter voltado ao apoio no aprendizado de programacao. A ideia principal e reunir conteudo teorico, atividades praticas, quizzes, gamificacao, dashboard de progresso e recursos nativos Android em uma unica experiencia."

Pontos do codigo para destacar:

- Entrada principal do app: `lib/main.dart`.
- Configuracao geral do app: `lib/app/app.dart`.
- Tema visual: `lib/app/theme.dart`.
- Rotas principais: `lib/app/router.dart`.

---

## Slide 2 - Problema e relevancia

Fala sugerida:

"O problema que motivou o projeto e a dificuldade comum que alunos iniciantes tem para consolidar logica de programacao. Muitas vezes o aluno ve a teoria, mas falta pratica guiada, feedback e acompanhamento. O ProTech tenta atacar isso com trilhas, atividades, quizzes e indicadores de evolucao."

Pontos do codigo para destacar:

- Conteudos conceituais: `lib/features/concepts/`.
- Atividades praticas: `lib/features/activities/`.
- Quizzes: `lib/features/quiz/`.
- Dashboard de acompanhamento: `lib/features/dashboard/teaching_dashboard_page.dart`.

---

## Slide 3 - Objetivo do projeto

Fala sugerida:

"O objetivo do ProTech e transformar o estudo de programacao em um fluxo continuo: o aluno aprende um conceito, pratica, responde quiz, recebe recompensa e acompanha sua evolucao no dashboard. O aplicativo tambem prepara revisoes para reforcar os assuntos com mais dificuldade."

Pontos do codigo para destacar:

- Conceitos: `ConceptsRepository`, `ConceptsPage` e `ConceptDetailPage`.
- Atividades: `ActivitiesRepository`, `ActivitiesPage` e `ActivityEditorPage`.
- Quizzes: `QuizCatalogDataSource`, `QuizRepositoryImpl` e `QuizPlayPage`.
- Dashboard: `LearningDashboardRepositoryImpl` e `DashboardAnalyticsService`.

---

## Slide 4 - Tecnologias utilizadas

Fala sugerida:

"Na parte tecnica, o projeto usa Flutter e Dart na interface, GoRouter para navegacao, BLoC/Cubit em algumas features e Riverpod nas areas mais arquitetadas, como usuario, quiz e turmas. Para persistencia local, usa Hive, Isar Community e SharedPreferences. O widget Android usa o pacote home_widget, alem de codigo nativo Kotlin."

Pontos do codigo para destacar:

- Dependencias no `pubspec.yaml`.
- Navegacao em `lib/app/router.dart`.
- Cubits em `lib/features/auth/auth_cubit.dart`, `lib/features/splash/splash_cubit.dart` e outros.
- Providers Riverpod em `lib/features/user/providers/user_providers.dart`.
- Banco Isar em `lib/core/database/database_service.dart`.
- Widget Android nativo em `android/app/src/main/kotlin/com/example/protechctu/ProTechReviewWidgetProvider.kt`.

---

## Slide 5 - Arquitetura

Fala sugerida:

"A arquitetura nao e apenas uma tela chamando banco diretamente. Em features como user, quiz e classes existe uma separacao parecida com Clean Architecture: entidades de dominio, use cases, repositories, datasources, mappers e providers. Isso facilita evolucao, testes e manutencao."

Pontos do codigo para destacar:

- Entidades de usuario: `lib/features/user/domain/entities/user_profile.dart`.
- Repositories de dominio: `lib/features/user/domain/repositories/`.
- Implementacoes de dados: `lib/features/user/data/repositories/`.
- Datasources locais: `lib/features/user/data/datasources/`.
- Mappers: `lib/features/user/data/mappers/`.
- Use cases: `lib/features/user/domain/usecases/`.
- Providers que montam as dependencias: `lib/features/user/providers/user_providers.dart`.

---

## Slide 6 - Funcionalidades implementadas

Fala sugerida:

"O app ja possui autenticacao local, catalogo de conceitos, atividades praticas, executor didatico de Python, quizzes gamificados, dashboard, perfil, turmas e ranking. A autenticacao usa Hive e a senha nao fica salva em texto puro, pois ha hash e salt no modelo de autenticacao."

Pontos do codigo para destacar:

- Login e cadastro: `lib/features/auth/auth_page.dart`.
- Regra de login: `lib/features/auth/auth_repository.dart`.
- Hash de senha: `lib/features/auth/auth_model.dart`.
- Executor Python: `lib/features/activities/python_exercise_runner.dart`.
- Testes cobrindo comportamento: `test/widget_test.dart`.

---

## Slide 7 - Gamificacao

Fala sugerida:

"A gamificacao aparece quando o aluno responde quizzes. O sistema calcula acertos, XP, moedas, bonus por quiz perfeito, nivel, streak e conquistas. Isso e importante porque da feedback imediato e cria motivacao para continuar estudando."

Pontos do codigo para destacar:

- Servico de gamificacao: `lib/core/services/quiz_gamification_service.dart`.
- Entidades de quiz: `lib/features/quiz/domain/entities/programming_quiz.dart`.
- Submissao de quiz: `lib/features/quiz/data/repositories/quiz_repository_impl.dart`.
- Tela do quiz: `lib/features/quiz/quiz_play_page.dart`.
- Perfil gamificado: `UserProfile`, em `lib/features/user/domain/entities/user_profile.dart`.

---

## Slide 8 - Sistema adaptativo

Fala sugerida:

"O sistema adaptativo acompanha o desempenho por topico. Ele calcula taxa de conclusao, maestria, tentativas, acertos, dificuldade percebida e agenda revisoes espacadas. Assim, o dashboard consegue indicar quais assuntos precisam de reforco e quais estao mais consolidados."

Pontos do codigo para destacar:

- Logica adaptativa: `lib/core/services/adaptive_learning_service.dart`.
- Analise do dashboard: `lib/core/services/dashboard_analytics_service.dart`.
- Registro de atividades de estudo: `LearningDashboardRepositoryImpl.recordActivity`.
- Entidades de progresso e revisao: `lib/features/user/domain/entities/learning_dashboard.dart`.

---

## Slide 9 - Banco de dados local

Fala sugerida:

"Um diferencial tecnico e a estrategia offline-first. O app usa Isar como banco local principal para perfis, progresso, revisoes, tentativas de quiz e turmas. Hive fica para autenticacao e alguns dados simples. Tambem existe base para fila de sincronizacao e backup local."

Pontos do codigo para destacar:

- Abertura do Isar: `lib/core/database/database_service.dart`.
- Schemas do banco: `lib/core/database/database_config.dart`.
- Modelos Isar de usuario: `lib/features/user/data/models/user_profile_model.dart`.
- Modelos Isar de dashboard: `lib/features/user/data/models/learning_dashboard_model.dart`.
- Tentativas de quiz: `lib/features/quiz/data/models/quiz_attempt_model.dart`.
- Backup local: `lib/core/services/backup_service.dart`.
- Fila de sync: `lib/core/services/sync_service.dart`.

---

## Slide 10 - Widget Android

Fala sugerida:

"O widget Android permite revisao rapida direto na tela inicial do celular. Ele nao mostra dados falsos: ele busca perguntas reais do catalogo de quizzes e prioriza o que faz mais sentido para o aluno, como revisao vencida, baixa maestria, topico fraco ou erro recente."

Pontos do codigo para destacar:

- Servico principal: `lib/core/services/home_widget_review_service.dart`.
- Uso do `home_widget` para salvar dados e atualizar widget.
- Provider nativo Kotlin: `android/app/src/main/kotlin/com/example/protechctu/ProTechReviewWidgetProvider.kt`.
- Layouts Android: `android/app/src/main/res/layout/protech_quick_review_widget_small.xml` e `protech_quick_review_widget_medium.xml`.
- Deep link salvo pelo servico: `protechctu://review/quiz/...`.

Observacao tecnica importante:

"Nas ultimas correcoes, esse widget foi isolado para sincronizar em background. Assim, mesmo que o widget falhe ou demore, ele nao bloqueia o login nem o dashboard."

---

## Slide 11 - Dashboard e turmas

Fala sugerida:

"O dashboard apresenta uma visao consolidada do estudante: nivel, XP, moedas, streak, progresso por topico, desempenho geral e acoes rapidas. Alem disso, o projeto tem modulo de turmas, com perfil publico, ranking, estatisticas e comparacao entre estudantes."

Pontos do codigo para destacar:

- Tela do dashboard: `lib/features/dashboard/teaching_dashboard_page.dart`.
- Provider do dashboard: `lib/features/user/providers/user_providers.dart`.
- Caso de uso: `GetLearningDashboard`.
- Analise: `DashboardAnalyticsService`.
- Modulo de turmas: `lib/features/classes/`.
- Ranking: `lib/features/classes/domain/services/ranking_service.dart`.
- Estatisticas: `lib/features/classes/domain/services/class_analytics_service.dart`.

---

## Slide 12 - Diferenciais academicos

Fala sugerida:

"O ProTech vai alem de um CRUD simples. Ele tem executor Python local, gamificacao, revisao espacada, dashboard analitico, offline-first, backup, fila de sincronizacao e widget Android nativo. Esses pontos mostram uso de arquitetura, persistencia, experiencia de usuario e integracao nativa."

Pontos do codigo para destacar:

- Executor Python seguro: `python_exercise_runner.dart`.
- Regras adaptativas: `adaptive_learning_service.dart`.
- Widget Android: `home_widget_review_service.dart` e Kotlin nativo.
- Persistencia offline: `database_service.dart`, `database_config.dart`, modelos Isar e Hive.
- Testes: `test/widget_test.dart`.

---

## Slide 13 - Participacao dos integrantes

Fala sugerida:

"A divisao pode ser explicada por areas tecnicas. O Sergio atuou fortemente na arquitetura Flutter, dashboard, gamificacao, sistema adaptativo, widget Android e integracao visual. O Luan contribuiu com a base inicial, modelagem, conteudos, autenticacao, executor Python, testes e integracoes de base."

Pontos do codigo para destacar:

- Usar o historico Git como referencia, se perguntarem.
- Evitar transformar a fala em disputa de autoria.
- Focar que o projeto final e integrado e depende das partes funcionando juntas.

---

## Slide 14 - Limitacoes identificadas

Fala sugerida:

"Como todo projeto academico em evolucao, existem limitacoes. Algumas strings ainda precisam de correcao de encoding. O backend remoto ou Firebase ainda nao esta ativado. As notificacoes locais tambem podem ser implementadas no futuro. O painel de turma pode evoluir para uma visao mais forte de professor."

Pontos do codigo para destacar:

- Provider remoto ainda nulo: `userRemoteDataSourceProvider` em `user_providers.dart`.
- Interface de datasource remoto existe: `lib/features/user/data/datasources/user_remote_datasource.dart`.
- Sync preparado: `lib/core/services/sync_service.dart`.
- Encoding aparece em textos de algumas telas e catalogos.

---

## Slide 15 - Conclusao

Fala sugerida:

"Concluindo, o ProTech apresenta uma proposta educacional consistente e tecnicamente relevante. Ele combina Flutter, arquitetura em camadas, banco local, gamificacao, aprendizagem adaptativa, dashboard, ranking e widget Android. O projeto ja funciona como base academica forte e ainda tem caminhos claros de evolucao."

Pontos do codigo para destacar:

- O app nao e apenas interface: possui regras de dominio, persistencia e testes.
- O fluxo principal e: autenticacao -> dashboard -> estudo -> quiz/atividade -> progresso -> revisao.
- A arquitetura permite evoluir para Firebase/backend sem reescrever tudo.

---

## Fala curta para demonstracao pratica

"Agora, na demonstracao, o fluxo esperado e simples: abrir o app, entrar com um usuario, ir para o dashboard, acessar um quiz ou atividade e observar que o progresso e a gamificacao sao atualizados. O widget Android fica como recurso secundario: ele sincroniza depois e nao bloqueia a navegacao principal."

Sequencia sugerida:

1. Abrir o aplicativo.
2. Entrar/cadastrar usuario.
3. Mostrar dashboard.
4. Abrir um quiz.
5. Concluir quiz e mostrar XP/moedas.
6. Voltar ao dashboard.
7. Comentar o widget Android e a estrategia offline-first.

---

## Perguntas provaveis da banca e respostas curtas

### Por que usar Hive e Isar?

"Hive foi usado para dados simples e autenticacao local. Isar foi usado para dados mais estruturados, como perfil, progresso, revisoes, quizzes e turmas."

### O app depende de internet?

"Nao para o fluxo principal. A arquitetura e offline-first. A sincronizacao remota esta preparada, mas o backend ainda nao foi ativado."

### O widget Android pode travar o login?

"Nao. Ele foi isolado para executar em background, com timeout e tratamento de erro. A navegacao para o dashboard nao depende dele."

### Onde esta a logica principal de progresso?

"Ela esta principalmente em `AdaptiveLearningService`, `DashboardAnalyticsService` e `LearningDashboardRepositoryImpl`."

### Como a senha e protegida?

"O modelo de autenticacao usa hash e salt, evitando salvar senha pura no Hive."

### Existe teste?

"Sim. A suite em `test/widget_test.dart` cobre autenticacao, gamificacao, executor Python, catalogo adaptativo, ranking e navegacao de telas."

