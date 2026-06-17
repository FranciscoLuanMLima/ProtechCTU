import 'package:flutter/material.dart';

import '../../core/services/push_notification_service.dart';
import '../../core/widgets/app_card.dart';

class NotificationSettingsPage extends StatefulWidget {
  const NotificationSettingsPage({super.key});

  @override
  State<NotificationSettingsPage> createState() =>
      _NotificationSettingsPageState();
}

class _NotificationSettingsPageState extends State<NotificationSettingsPage> {
  final PushNotificationService _service = PushNotificationService.instance;

  NotificationPreferences _preferences = NotificationPreferences.defaults();
  PushNotificationStatus? _status;
  List<NotificationHistoryItem> _history = const <NotificationHistoryItem>[];
  bool _loading = true;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() => _loading = true);
    final diagnostic = await _service.runDiagnostic();
    final preferences = await _service.loadPreferences();
    final history = await _service.loadHistory();
    if (!mounted) return;
    setState(() {
      _status = diagnostic.status;
      _preferences = preferences;
      _history = history;
      _loading = false;
    });
  }

  Future<void> _setReceivePush(bool value) async {
    setState(() => _saving = true);
    await _service.setNotificationsEnabled(value);
    final status = await _service.status();
    final preferences = await _service.loadPreferences();
    if (!mounted) return;
    setState(() {
      _status = status;
      _preferences = preferences;
      _saving = false;
    });
  }

  Future<void> _savePreferences(NotificationPreferences preferences) async {
    setState(() {
      _preferences = preferences;
      _saving = true;
    });
    await _service.savePreferences(preferences);
    final status = await _service.status();
    if (!mounted) return;
    setState(() {
      _status = status;
      _saving = false;
    });
  }

  Future<void> _pickTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(
        hour: _preferences.preferredHour,
        minute: _preferences.preferredMinute,
      ),
    );
    if (picked == null) return;
    await _savePreferences(
      _preferences.copyWith(
        preferredHour: picked.hour,
        preferredMinute: picked.minute,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final status = _status;
    return Scaffold(
      appBar: AppBar(title: const Text('Notificacoes')),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: _load,
              child: ListView(
                padding: const EdgeInsets.all(24),
                children: [
                  _StatusCard(status: status),
                  const SizedBox(height: 16),
                  _DiagnosticCard(status: status),
                  const SizedBox(height: 16),
                  AppCard(
                    child: Column(
                      children: [
                        SwitchListTile(
                          contentPadding: EdgeInsets.zero,
                          title: const Text('Receber notificacoes no celular'),
                          subtitle: const Text(
                            'Solicita permissao e registra o token do dispositivo.',
                          ),
                          value: _preferences.receivePush,
                          onChanged: _saving ? null : _setReceivePush,
                        ),
                        const Divider(height: 16),
                        _PreferenceSwitch(
                          title: 'Lembrete diario de estudos',
                          value: _preferences.dailyStudyReminder,
                          enabled: !_saving,
                          onChanged: (value) => _savePreferences(
                            _preferences.copyWith(dailyStudyReminder: value),
                          ),
                        ),
                        _PreferenceSwitch(
                          title: 'Lembrete de ofensiva diaria',
                          value: _preferences.streakReminder,
                          enabled: !_saving,
                          onChanged: (value) => _savePreferences(
                            _preferences.copyWith(streakReminder: value),
                          ),
                        ),
                        _PreferenceSwitch(
                          title: 'Novos conteudos disponiveis',
                          value: _preferences.newContentAvailable,
                          enabled: !_saving,
                          onChanged: (value) => _savePreferences(
                            _preferences.copyWith(newContentAvailable: value),
                          ),
                        ),
                        _PreferenceSwitch(
                          title: 'Novos quizzes disponiveis',
                          value: _preferences.newQuizzesAvailable,
                          enabled: !_saving,
                          onChanged: (value) => _savePreferences(
                            _preferences.copyWith(newQuizzesAvailable: value),
                          ),
                        ),
                        const Divider(height: 16),
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: const Icon(Icons.schedule_outlined),
                          title: const Text(
                            'Horario preferido para notificacoes',
                          ),
                          subtitle: Text(_formatTime(_preferences)),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: _saving ? null : _pickTime,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  _TokenCard(status: status),
                  const SizedBox(height: 16),
                  _HistoryCard(history: _history),
                ],
              ),
            ),
    );
  }

  String _formatTime(NotificationPreferences preferences) {
    final hour = preferences.preferredHour.toString().padLeft(2, '0');
    final minute = preferences.preferredMinute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }
}

class _StatusCard extends StatelessWidget {
  const _StatusCard({required this.status});

  final PushNotificationStatus? status;

  @override
  Widget build(BuildContext context) {
    final current = status;
    final available = current?.firebaseConnected ?? false;
    final colorScheme = Theme.of(context).colorScheme;
    return AppCard(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            available
                ? Icons.notifications_active_outlined
                : Icons.notifications_off_outlined,
            color: available ? colorScheme.primary : colorScheme.error,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  available
                      ? 'Push notifications configuradas'
                      : 'Firebase sem conexao ativa',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(height: 6),
                Text(
                  available
                      ? 'Firebase conectado. O recebimento depende da permissao e do token FCM abaixo.'
                      : current?.errorMessage ??
                            'Confira google-services.json, firebase_options.dart e conectividade do dispositivo.',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PreferenceSwitch extends StatelessWidget {
  const _PreferenceSwitch({
    required this.title,
    required this.value,
    required this.enabled,
    required this.onChanged,
  });

  final String title;
  final bool value;
  final bool enabled;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(title),
      value: value,
      onChanged: enabled ? onChanged : null,
    );
  }
}

class _DiagnosticCard extends StatelessWidget {
  const _DiagnosticCard({required this.status});

  final PushNotificationStatus? status;

  @override
  Widget build(BuildContext context) {
    final current = status;
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Diagnostico FCM',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(height: 12),
          _DiagnosticRow(
            label: 'Firebase conectado',
            value: _yesNo(current?.firebaseConnected ?? false),
          ),
          _DiagnosticRow(
            label: 'Permissao concedida',
            value: _yesNo(current?.permissionGranted ?? false),
          ),
          _DiagnosticRow(
            label: 'Token FCM gerado',
            value: _yesNo(current?.tokenGenerated ?? false),
          ),
          _DiagnosticRow(
            label: 'Notificacoes locais',
            value: _yesNo(current?.localNotificationsReady ?? false),
          ),
          _DiagnosticRow(
            label: 'Ultima sincronizacao',
            value: _formatDate(current?.lastSyncAttempt),
          ),
        ],
      ),
    );
  }

  String _yesNo(bool value) => value ? 'SIM' : 'NAO';

  String _formatDate(DateTime? value) {
    if (value == null) return '-';
    final day = value.day.toString().padLeft(2, '0');
    final month = value.month.toString().padLeft(2, '0');
    final year = value.year.toString().padLeft(4, '0');
    final hour = value.hour.toString().padLeft(2, '0');
    final minute = value.minute.toString().padLeft(2, '0');
    return '$day/$month/$year $hour:$minute';
  }
}

class _DiagnosticRow extends StatelessWidget {
  const _DiagnosticRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Expanded(child: Text(label)),
          Text(value, style: Theme.of(context).textTheme.labelLarge),
        ],
      ),
    );
  }
}

class _TokenCard extends StatelessWidget {
  const _TokenCard({required this.status});

  final PushNotificationStatus? status;

  @override
  Widget build(BuildContext context) {
    final token = status?.token;
    final visibleToken = token ?? 'Token ainda nao registrado.';
    return AppCard(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.vpn_key_outlined),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Token do dispositivo',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(height: 6),
                SelectableText(visibleToken),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _HistoryCard extends StatelessWidget {
  const _HistoryCard({required this.history});

  final List<NotificationHistoryItem> history;

  @override
  Widget build(BuildContext context) {
    if (history.isEmpty) {
      return const AppCard(
        child: Text('Nenhuma notificacao push recebida neste dispositivo.'),
      );
    }

    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Historico', style: Theme.of(context).textTheme.titleSmall),
          const SizedBox(height: 12),
          for (final item in history.take(8)) ...[
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.notifications_outlined),
              title: Text(item.title),
              subtitle: Text(item.body),
              trailing: Text(item.source),
            ),
          ],
        ],
      ),
    );
  }
}
