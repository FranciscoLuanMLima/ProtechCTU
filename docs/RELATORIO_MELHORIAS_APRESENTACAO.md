# Relatorio de melhorias para versao de apresentacao

## Analise realizada

Foram revisados o GoRouter, Splash, Login, Dashboard, providers Riverpod, inicializacao do banco local, servicos de progresso, quizzes, atividades e modulo de Turmas.

Impactos identificados:

- O modulo de Turmas estava acoplado a `lib/app/router.dart`, ao `DatabaseConfig`, ao Dashboard e a `lib/features/classes`.
- O Dashboard carregava dados via `FutureProvider` e ja possuia fallback visual em caso de erro.
- A tela de detalhe de conceitos era o ponto correto para aplicar o cronometro obrigatorio de estudo.
- Nao havia sistema central de notificacoes motivacionais; o Dashboard era o local de menor risco para introduzir a primeira versao.

## Alteracoes realizadas

### Remocao de Turmas

- Removida a rota `/classes`.
- Removido o item "Turmas" das acoes rapidas do Dashboard.
- Removidos schemas exclusivos de Turmas do `DatabaseConfig`.
- Removida a pasta `lib/features/classes`.

### Notificacoes motivacionais

- Criado `MotivationalNotificationService`.
- Adicionado sino no Dashboard com contador de notificacoes nao lidas.
- Adicionado painel/lista de notificacoes no Dashboard.
- Adicionada acao para marcar notificacoes como lidas.
- Estrutura preparada para futura integracao com notificacoes automaticas.

### Cronometro obrigatorio de estudo

- Criada constante central `StudyRequirements.minimumStudyDuration`.
- Definido tempo minimo obrigatorio de 5 minutos.
- Adicionado cronometro na tela de detalhe de assunto/conteudo.
- Conteudo permanece disponivel durante a contagem.
- Botao "Entendi" fica bloqueado ate o fim do cronometro.

### Tempo minimo de estudo

- Tempo obrigatorio ajustado para 5 minutos.
- Indicador visual dos conceitos ajustado para "5 minutos obrigatorios".
- Estimativas dos conceitos ajustadas para 5 minutos.

## Funcionalidades preservadas

- Login.
- Dashboard adaptativo.
- Quizzes.
- Atividades.
- Perfil.
- Conceitos.
- Banco local Isar/Hive.
- Gamificacao e progresso.

## Validacao executada

- `flutter analyze`: sem issues.
- `flutter test`: todos os testes passaram.
- `flutter build apk --debug`: executado para validar build final.

