# release/dashboard-restaurado

## Resumo

Restauração do fluxo Login -> Dashboard, estabilização dos providers do dashboard adaptativo e recomposição das rotas acadêmicas para apresentação.

## Correções

- Restaurado o dashboard adaptativo moderno com cards de resumo, XP, moedas, streak, tópicos, desempenho e ações rápidas.
- Restaurada a rota de turmas (`/classes`) e o módulo real de turmas/ranking.
- Restaurado o catálogo local de tópicos para o dashboard não abrir vazio após login.
- Mantido o fluxo de autenticação sem aguardar serviços secundários.
- Mantidos fallback visual e tratamento de erro no dashboard para evitar loading infinito.
- Atualizado o `DatabaseConfig` com schemas de turmas no Isar.

## Validação

- `flutter analyze`: sem issues.
- `flutter test`: todos os testes passaram.
- `flutter build apk --debug`: APK gerado com sucesso em `build/app/outputs/flutter-apk/app-debug.apk`.

## Observacoes

- O build ainda emite aviso futuro sobre migracao do Kotlin Gradle Plugin. Nao bloqueia a release atual.
- O Home Widget nativo nao foi reintroduzido no fluxo principal desta release porque a versao remota estavel removeu a dependencia `home_widget`; manter esse servico fora do login evita regressao de carregamento infinito.
