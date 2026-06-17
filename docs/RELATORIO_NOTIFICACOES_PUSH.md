# Relatorio - Sistema de Notificacoes Push

## Tecnologia utilizada

O app foi preparado para notificacoes push reais usando Firebase Cloud Messaging
(FCM), por meio dos pacotes `firebase_core` e `firebase_messaging`.

## Funcionalidades implementadas

- Tela autenticada em `Configuracoes -> Notificacoes`.
- Permissao de notificacoes solicitada no proprio aplicativo.
- Registro e persistencia do token FCM do dispositivo.
- Preferencias persistidas em `SharedPreferencesAsync`.
- Historico local das notificacoes push recebidas.
- Handler para mensagens em primeiro plano.
- Handler para mensagens em background.
- Inicializacao de push em background, sem bloquear Splash, Login ou Dashboard.
- Permissao Android `POST_NOTIFICATIONS` adicionada para Android 13+.

## Preferencias persistidas

- Receber notificacoes no celular.
- Lembrete diario de estudos.
- Lembrete de ofensiva diaria.
- Novos conteudos disponiveis.
- Novos quizzes disponiveis.
- Horario preferido para notificacoes.

## Arquivos alterados

- `pubspec.yaml`
- `pubspec.lock`
- `android/app/src/main/AndroidManifest.xml`
- `lib/main.dart`
- `lib/app/router.dart`
- `lib/features/profile/profile_page.dart`
- `lib/core/services/push_notification_service.dart`
- `lib/features/notifications/notification_settings_page.dart`

## Como enviar notificacoes futuras

1. Criar um projeto Firebase.
2. Registrar o app Android e, futuramente, o app Web/PWA.
3. Adicionar os arquivos de configuracao gerados pelo Firebase ao projeto:
   - `android/app/google-services.json`
   - configuracao web para PWA quando a versao web for ativada.
4. Configurar o plugin Gradle do Google Services no Android, se o projeto
   Firebase exigir essa integracao.
5. Enviar mensagens pelo Firebase Console ou por um backend academico usando o
   token salvo pelo app.
6. Usar as preferencias salvas para decidir quais mensagens cada aluno deve
   receber.

## Eventos recomendados para o backend

- Enviar lembrete diario no horario preferido do aluno.
- Enviar alerta prioritario quando a ofensiva estiver perto de expirar.
- Enviar notificacao de conquista ao concluir atividade.
- Enviar aviso quando houver novo conteudo ou novo quiz.
- Enviar revisao quando o aluno ficar muitas horas sem estudar.

## Limitacoes atuais

O cliente esta preparado para FCM, permissao, token e recebimento. O envio real
com app fechado depende da configuracao externa do Firebase e de um backend ou
Firebase Console para disparar mensagens. Sem `google-services.json` e projeto
Firebase configurado, o app mostra o estado "Firebase pendente de configuracao"
e continua funcionando normalmente.
