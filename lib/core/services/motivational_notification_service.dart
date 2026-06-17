import '../../features/user/domain/entities/learning_dashboard.dart';

enum MotivationalNotificationType {
  practice,
  streak,
  progress,
  challenge,
  review,
}

final class MotivationalNotification {
  const MotivationalNotification({
    required this.id,
    required this.title,
    required this.message,
    required this.type,
  });

  final String id;
  final String title;
  final String message;
  final MotivationalNotificationType type;
}

final class MotivationalNotificationService {
  const MotivationalNotificationService();

  List<MotivationalNotification> buildForDashboard(
    LearningDashboardSnapshot snapshot,
  ) {
    final user = snapshot.user;
    final notifications = <MotivationalNotification>[
      const MotivationalNotification(
        id: 'daily-practice',
        title: 'Pratique hoje',
        message: 'Venha praticar programação hoje.',
        type: MotivationalNotificationType.practice,
      ),
      const MotivationalNotification(
        id: 'new-challenges',
        title: 'Novos desafios',
        message: 'Novos desafios estão esperando por você.',
        type: MotivationalNotificationType.challenge,
      ),
    ];

    final streakDays = user?.streak.currentOffenseDays ?? 0;
    if (streakDays == 0) {
      notifications.add(
        const MotivationalNotification(
          id: 'start-streak',
          title: 'Ofensiva diária',
          message: 'Atualize sua ofensiva diária.',
          type: MotivationalNotificationType.streak,
        ),
      );
    } else {
      notifications.add(
        MotivationalNotification(
          id: 'keep-streak',
          title: 'Mantenha sua sequência',
          message:
              'Continue seus estudos e mantenha sua sequência de $streakDays dia(s).',
          type: MotivationalNotificationType.streak,
        ),
      );
    }

    if (snapshot.overallProgress >= 0.7 && snapshot.overallProgress < 1) {
      notifications.add(
        const MotivationalNotification(
          id: 'near-completion',
          title: 'Quase lá',
          message: 'Você está perto de concluir mais uma atividade.',
          type: MotivationalNotificationType.progress,
        ),
      );
    }

    if (snapshot.reviewsDueToday.isNotEmpty ||
        snapshot.weakTopicIds.isNotEmpty) {
      notifications.add(
        const MotivationalNotification(
          id: 'review-topics',
          title: 'Revisão recomendada',
          message: 'Revise os assuntos mais importantes para evoluir hoje.',
          type: MotivationalNotificationType.review,
        ),
      );
    }

    return notifications;
  }
}
