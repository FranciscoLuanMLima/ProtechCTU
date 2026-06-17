import 'dart:async';
import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../firebase_options.dart';
import 'logger.dart';

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  try {
    await PushNotificationService.ensureFirebaseReady();
    await PushNotificationService.ensureLocalNotificationsReady();
    await PushNotificationService.recordRemoteMessage(
      message,
      source: 'background',
      showLocalNotification: true,
    );
  } catch (error, stackTrace) {
    AppLogger.info(
      '[PUSH] falha ao processar mensagem em background',
      error: error,
      stackTrace: stackTrace,
    );
  }
}

final class NotificationPreferences {
  const NotificationPreferences({
    required this.receivePush,
    required this.dailyStudyReminder,
    required this.streakReminder,
    required this.newContentAvailable,
    required this.newQuizzesAvailable,
    required this.preferredHour,
    required this.preferredMinute,
  });

  factory NotificationPreferences.defaults() {
    return const NotificationPreferences(
      receivePush: false,
      dailyStudyReminder: true,
      streakReminder: true,
      newContentAvailable: true,
      newQuizzesAvailable: true,
      preferredHour: 18,
      preferredMinute: 0,
    );
  }

  factory NotificationPreferences.fromJson(Map<String, dynamic> json) {
    return NotificationPreferences(
      receivePush: json['receivePush'] as bool? ?? false,
      dailyStudyReminder: json['dailyStudyReminder'] as bool? ?? true,
      streakReminder: json['streakReminder'] as bool? ?? true,
      newContentAvailable: json['newContentAvailable'] as bool? ?? true,
      newQuizzesAvailable: json['newQuizzesAvailable'] as bool? ?? true,
      preferredHour: json['preferredHour'] as int? ?? 18,
      preferredMinute: json['preferredMinute'] as int? ?? 0,
    );
  }

  final bool receivePush;
  final bool dailyStudyReminder;
  final bool streakReminder;
  final bool newContentAvailable;
  final bool newQuizzesAvailable;
  final int preferredHour;
  final int preferredMinute;

  NotificationPreferences copyWith({
    bool? receivePush,
    bool? dailyStudyReminder,
    bool? streakReminder,
    bool? newContentAvailable,
    bool? newQuizzesAvailable,
    int? preferredHour,
    int? preferredMinute,
  }) {
    return NotificationPreferences(
      receivePush: receivePush ?? this.receivePush,
      dailyStudyReminder: dailyStudyReminder ?? this.dailyStudyReminder,
      streakReminder: streakReminder ?? this.streakReminder,
      newContentAvailable: newContentAvailable ?? this.newContentAvailable,
      newQuizzesAvailable: newQuizzesAvailable ?? this.newQuizzesAvailable,
      preferredHour: preferredHour ?? this.preferredHour,
      preferredMinute: preferredMinute ?? this.preferredMinute,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'receivePush': receivePush,
      'dailyStudyReminder': dailyStudyReminder,
      'streakReminder': streakReminder,
      'newContentAvailable': newContentAvailable,
      'newQuizzesAvailable': newQuizzesAvailable,
      'preferredHour': preferredHour,
      'preferredMinute': preferredMinute,
    };
  }
}

final class NotificationHistoryItem {
  const NotificationHistoryItem({
    required this.id,
    required this.title,
    required this.body,
    required this.receivedAt,
    required this.source,
  });

  factory NotificationHistoryItem.fromJson(Map<String, dynamic> json) {
    return NotificationHistoryItem(
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? 'Notificacao',
      body: json['body'] as String? ?? '',
      receivedAt:
          DateTime.tryParse(json['receivedAt'] as String? ?? '') ??
          DateTime.now(),
      source: json['source'] as String? ?? 'foreground',
    );
  }

  final String id;
  final String title;
  final String body;
  final DateTime receivedAt;
  final String source;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'body': body,
      'receivedAt': receivedAt.toIso8601String(),
      'source': source,
    };
  }
}

final class PushNotificationStatus {
  const PushNotificationStatus({
    required this.firebaseConnected,
    required this.permissionGranted,
    required this.localNotificationsReady,
    required this.tokenGenerated,
    this.token,
    this.authorizationStatus,
    this.lastSyncAttempt,
    this.errorMessage,
  });

  final bool firebaseConnected;
  final bool permissionGranted;
  final bool localNotificationsReady;
  final bool tokenGenerated;
  final String? token;
  final AuthorizationStatus? authorizationStatus;
  final DateTime? lastSyncAttempt;
  final String? errorMessage;

  bool get firebaseAvailable => firebaseConnected;
}

final class PushNotificationDiagnostic {
  const PushNotificationDiagnostic({required this.status});

  final PushNotificationStatus status;

  bool get firebaseConnected => status.firebaseConnected;
  bool get permissionGranted => status.permissionGranted;
  bool get tokenGenerated => status.tokenGenerated;
  String? get token => status.token;
  DateTime? get lastSyncAttempt => status.lastSyncAttempt;
}

final class PushNotificationService {
  PushNotificationService._();

  static final PushNotificationService instance = PushNotificationService._();

  static const _preferencesKey = 'pushNotification.preferences';
  static const _tokenKey = 'pushNotification.deviceToken';
  static const _historyKey = 'pushNotification.history';
  static const _lastSyncAttemptKey = 'pushNotification.lastSyncAttempt';
  static const _historyLimit = 30;
  static const _channelId = 'protech_push_channel';
  static const _channelName = 'ProTech Push';
  static const _channelDescription = 'Notificacoes de estudo do ProTech';

  static final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();
  static bool _localNotificationsReady = false;

  final SharedPreferencesAsync _preferences = SharedPreferencesAsync();
  StreamSubscription<RemoteMessage>? _foregroundSubscription;
  StreamSubscription<RemoteMessage>? _openedAppSubscription;
  StreamSubscription<String>? _tokenSubscription;
  bool _initialized = false;
  bool _firebaseConnected = false;
  bool _backgroundHandlerRegistered = false;
  AuthorizationStatus? _authorizationStatus;
  String? _startupError;

  static bool get _isMessagingPlatform {
    if (kIsWeb) return true;
    return defaultTargetPlatform == TargetPlatform.android ||
        defaultTargetPlatform == TargetPlatform.iOS ||
        defaultTargetPlatform == TargetPlatform.macOS;
  }

  static Future<void> ensureFirebaseReady() async {
    if (Firebase.apps.isNotEmpty) return;
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    AppLogger.info('[PUSH] Firebase inicializado');
  }

  static Future<void> ensureLocalNotificationsReady() async {
    if (_localNotificationsReady) return;

    const androidSettings = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );
    const darwinSettings = DarwinInitializationSettings();
    const settings = InitializationSettings(
      android: androidSettings,
      iOS: darwinSettings,
      macOS: darwinSettings,
    );

    await _localNotifications.initialize(settings);

    final androidPlugin = _localNotifications
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >();
    await androidPlugin?.createNotificationChannel(
      const AndroidNotificationChannel(
        _channelId,
        _channelName,
        description: _channelDescription,
        importance: Importance.high,
      ),
    );

    _localNotificationsReady = true;
    AppLogger.info('[PUSH] notificacoes locais inicializadas');
  }

  Future<PushNotificationStatus> initialize() async {
    if (_initialized) return synchronize();
    _initialized = true;

    await _saveLastSyncAttempt();

    try {
      await ensureFirebaseReady();
      _firebaseConnected = true;
      _startupError = null;
      AppLogger.info('[PUSH] Firebase conectado');
    } on FirebaseException catch (error, stackTrace) {
      _firebaseConnected = false;
      _startupError = _firebaseErrorMessage(error);
      AppLogger.info(
        '[PUSH] falha de configuracao/autenticacao Firebase',
        error: error,
        stackTrace: stackTrace,
      );
      return status();
    } catch (error, stackTrace) {
      _firebaseConnected = false;
      _startupError = 'Firebase indisponivel nesta plataforma/dispositivo.';
      AppLogger.info(
        '[PUSH] falha de conexao/configuracao Firebase',
        error: error,
        stackTrace: stackTrace,
      );
      return status();
    }

    if (!_isMessagingPlatform) {
      _startupError = 'FCM nao e suportado nesta plataforma.';
      AppLogger.info('[PUSH] plataforma sem suporte a Firebase Messaging');
      return status();
    }

    try {
      await ensureLocalNotificationsReady();
      if (!_backgroundHandlerRegistered) {
        FirebaseMessaging.onBackgroundMessage(
          firebaseMessagingBackgroundHandler,
        );
        _backgroundHandlerRegistered = true;
      }

      _foregroundSubscription = FirebaseMessaging.onMessage.listen((message) {
        unawaited(
          recordRemoteMessage(
            message,
            source: 'foreground',
            showLocalNotification: true,
          ),
        );
      });
      _openedAppSubscription = FirebaseMessaging.onMessageOpenedApp.listen((
        message,
      ) {
        unawaited(recordRemoteMessage(message, source: 'opened-app'));
      });
      _tokenSubscription = FirebaseMessaging.instance.onTokenRefresh.listen(
        (token) => unawaited(_storeToken(token, source: 'refresh')),
        onError: (Object error, StackTrace stackTrace) {
          _startupError = 'Falha ao atualizar token FCM.';
          AppLogger.info(
            '[PUSH] falha ao atualizar token FCM',
            error: error,
            stackTrace: stackTrace,
          );
        },
      );

      final initialMessage = await FirebaseMessaging.instance
          .getInitialMessage();
      if (initialMessage != null) {
        await recordRemoteMessage(initialMessage, source: 'terminated-open');
      }

      AppLogger.info('[PUSH] Firebase Messaging registrado');
    } catch (error, stackTrace) {
      _startupError = 'Falha ao configurar Firebase Messaging.';
      AppLogger.info(
        '[PUSH] falha de configuracao do Firebase Messaging',
        error: error,
        stackTrace: stackTrace,
      );
    }

    return synchronize();
  }

  Future<PushNotificationStatus> requestPermissionAndRegister() {
    return synchronize(requestPermission: true);
  }

  Future<PushNotificationStatus> synchronize({
    bool requestPermission = false,
  }) async {
    await _saveLastSyncAttempt();

    if (!_initialized) {
      return initialize();
    }

    if (!_firebaseConnected || !_isMessagingPlatform) {
      return status();
    }

    try {
      await ensureLocalNotificationsReady();
      final settings = requestPermission
          ? await FirebaseMessaging.instance.requestPermission(
              alert: true,
              announcement: false,
              badge: true,
              carPlay: false,
              criticalAlert: false,
              provisional: false,
              sound: true,
            )
          : await FirebaseMessaging.instance.getNotificationSettings();
      _authorizationStatus = settings.authorizationStatus;

      if (requestPermission) {
        final androidPlugin = _localNotifications
            .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin
            >();
        final androidGranted = await androidPlugin
            ?.requestNotificationsPermission();
        AppLogger.info(
          '[PUSH] permissao Android local: ${androidGranted == true ? 'SIM' : 'NAO'}',
        );
      }

      final permissionGranted = _isPermissionGranted(_authorizationStatus);
      final current = await loadPreferences();
      await savePreferences(current.copyWith(receivePush: permissionGranted));
      AppLogger.info(
        '[PUSH] permissao FCM: ${permissionGranted ? 'concedida' : 'negada'}',
      );

      final token = await FirebaseMessaging.instance.getToken();
      if (token == null || token.isEmpty) {
        _startupError = 'Token FCM ainda nao gerado pelo dispositivo.';
        AppLogger.info('[PUSH] token FCM ausente');
      } else {
        await _storeToken(token, source: 'sync');
        _startupError = null;
      }
    } on FirebaseException catch (error, stackTrace) {
      _startupError = _firebaseErrorMessage(error);
      AppLogger.info(
        '[PUSH] falha Firebase ao sincronizar FCM',
        error: error,
        stackTrace: stackTrace,
      );
    } catch (error, stackTrace) {
      _startupError = 'Falha de conexao ao sincronizar notificacoes.';
      AppLogger.info(
        '[PUSH] falha de conexao ao sincronizar notificacoes',
        error: error,
        stackTrace: stackTrace,
      );
    }

    return status();
  }

  Future<PushNotificationDiagnostic> runDiagnostic() async {
    final current = await synchronize();
    AppLogger.info(
      '[PUSH][DIAGNOSTICO] Firebase conectado: ${current.firebaseConnected ? 'SIM' : 'NAO'}',
    );
    AppLogger.info(
      '[PUSH][DIAGNOSTICO] Permissao concedida: ${current.permissionGranted ? 'SIM' : 'NAO'}',
    );
    AppLogger.info(
      '[PUSH][DIAGNOSTICO] Token FCM gerado: ${current.tokenGenerated ? 'SIM' : 'NAO'}',
    );
    AppLogger.info('[PUSH][DIAGNOSTICO] Token atual: ${current.token ?? '-'}');
    AppLogger.info(
      '[PUSH][DIAGNOSTICO] Ultima tentativa de sincronizacao: ${current.lastSyncAttempt?.toIso8601String() ?? '-'}',
    );
    return PushNotificationDiagnostic(status: current);
  }

  Future<void> setNotificationsEnabled(bool enabled) async {
    if (!enabled) {
      final current = await loadPreferences();
      await savePreferences(current.copyWith(receivePush: false));
      AppLogger.info('[PUSH] notificacoes desativadas pelo usuario');
      return;
    }
    await requestPermissionAndRegister();
  }

  Future<NotificationPreferences> loadPreferences() async {
    final raw = await _preferences.getString(_preferencesKey);
    if (raw == null || raw.isEmpty) return NotificationPreferences.defaults();
    try {
      return NotificationPreferences.fromJson(
        (jsonDecode(raw) as Map<Object?, Object?>).cast<String, dynamic>(),
      );
    } catch (error, stackTrace) {
      AppLogger.info(
        '[PUSH] preferencias corrompidas, usando padrao',
        error: error,
        stackTrace: stackTrace,
      );
      return NotificationPreferences.defaults();
    }
  }

  Future<void> savePreferences(NotificationPreferences preferences) {
    return _preferences.setString(_preferencesKey, jsonEncode(preferences));
  }

  Future<PushNotificationStatus> status() async {
    final preferences = await loadPreferences();
    final token = await _preferences.getString(_tokenKey);
    final lastSyncRaw = await _preferences.getString(_lastSyncAttemptKey);
    final lastSync = lastSyncRaw == null
        ? null
        : DateTime.tryParse(lastSyncRaw);
    final permissionGranted =
        _isPermissionGranted(_authorizationStatus) || preferences.receivePush;
    return PushNotificationStatus(
      firebaseConnected: _firebaseConnected,
      permissionGranted: permissionGranted,
      localNotificationsReady: _localNotificationsReady,
      tokenGenerated: token != null && token.isNotEmpty,
      token: token,
      authorizationStatus: _authorizationStatus,
      lastSyncAttempt: lastSync,
      errorMessage: _startupError,
    );
  }

  Future<List<NotificationHistoryItem>> loadHistory() async {
    final raw = await _preferences.getString(_historyKey);
    if (raw == null || raw.isEmpty) return const <NotificationHistoryItem>[];
    try {
      final decoded = jsonDecode(raw) as List;
      return decoded
          .map(
            (item) => NotificationHistoryItem.fromJson(
              (item as Map<Object?, Object?>).cast<String, dynamic>(),
            ),
          )
          .toList(growable: false);
    } catch (error, stackTrace) {
      AppLogger.info(
        '[PUSH] historico corrompido, limpando leitura',
        error: error,
        stackTrace: stackTrace,
      );
      return const <NotificationHistoryItem>[];
    }
  }

  Future<void> dispose() async {
    await _foregroundSubscription?.cancel();
    await _openedAppSubscription?.cancel();
    await _tokenSubscription?.cancel();
  }

  static Future<void> recordRemoteMessage(
    RemoteMessage message, {
    required String source,
    bool showLocalNotification = false,
  }) async {
    final notification = message.notification;
    final title =
        notification?.title ??
        message.data['title']?.toString() ??
        'Notificacao ProTech';
    final body =
        notification?.body ??
        message.data['body']?.toString() ??
        'Nova mensagem recebida.';

    await recordNotification(title: title, body: body, source: source);
    AppLogger.info('[PUSH] notificacao recebida ($source): $title');

    if (showLocalNotification) {
      await _showLocalNotification(
        title: title,
        body: body,
        payload: jsonEncode(message.data),
      );
    }
  }

  static Future<void> recordNotification({
    required String title,
    required String body,
    required String source,
  }) async {
    final item = NotificationHistoryItem(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      title: title,
      body: body,
      receivedAt: DateTime.now(),
      source: source,
    );

    final preferences = SharedPreferencesAsync();
    final raw = await preferences.getString(_historyKey);
    final current = raw == null || raw.isEmpty
        ? <NotificationHistoryItem>[]
        : (jsonDecode(raw) as List)
              .map(
                (entry) => NotificationHistoryItem.fromJson(
                  (entry as Map<Object?, Object?>).cast<String, dynamic>(),
                ),
              )
              .toList();
    final updated = <NotificationHistoryItem>[
      item,
      ...current.where((entry) => entry.id != item.id),
    ].take(_historyLimit).map((entry) => entry.toJson()).toList();
    await preferences.setString(_historyKey, jsonEncode(updated));
  }

  static bool _isPermissionGranted(AuthorizationStatus? status) {
    return status == AuthorizationStatus.authorized ||
        status == AuthorizationStatus.provisional;
  }

  static String _firebaseErrorMessage(FirebaseException error) {
    return switch (error.code) {
      'app/no-app' => 'Firebase nao foi inicializado para o aplicativo.',
      'app/duplicate-app' => 'Firebase ja estava inicializado.',
      'messaging/permission-blocked' =>
        'Permissao de notificacao bloqueada pelo sistema.',
      'messaging/invalid-sender' =>
        'Falha de configuracao: senderId do Firebase invalido.',
      'messaging/registration-token-not-registered' =>
        'Falha de autenticacao: token FCM nao registrado.',
      _ =>
        'Falha Firebase (${error.code}): ${error.message ?? 'sem detalhes'}.',
    };
  }

  static Future<void> _showLocalNotification({
    required String title,
    required String body,
    String? payload,
  }) async {
    try {
      await ensureLocalNotificationsReady();
      await _localNotifications.show(
        DateTime.now().millisecondsSinceEpoch ~/ 1000,
        title,
        body,
        const NotificationDetails(
          android: AndroidNotificationDetails(
            _channelId,
            _channelName,
            channelDescription: _channelDescription,
            importance: Importance.high,
            priority: Priority.high,
            icon: '@mipmap/ic_launcher',
          ),
          iOS: DarwinNotificationDetails(),
          macOS: DarwinNotificationDetails(),
        ),
        payload: payload,
      );
      AppLogger.info('[PUSH] notificacao local exibida');
    } catch (error, stackTrace) {
      AppLogger.info(
        '[PUSH] falha ao exibir notificacao local',
        error: error,
        stackTrace: stackTrace,
      );
    }
  }

  Future<void> _storeToken(String token, {required String source}) async {
    await _preferences.setString(_tokenKey, token);
    AppLogger.info('[PUSH] token FCM gerado/atualizado ($source): $token');
  }

  Future<void> _saveLastSyncAttempt() {
    final now = DateTime.now().toIso8601String();
    return _preferences.setString(_lastSyncAttemptKey, now);
  }
}
