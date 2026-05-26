import 'package:flutter/material.dart';

import '../../../core/widgets/app_card.dart';
import '../activity_model.dart';

class ActivityCard extends StatelessWidget {
  const ActivityCard({
    required this.activity,
    required this.onStart,
    super.key,
  });

  final ActivityModel activity;
  final VoidCallback onStart;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  activity.title,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              Chip(label: Text(activity.language)),
            ],
          ),
          const SizedBox(height: 8),
          Text(activity.description),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              Chip(label: Text(activity.concept)),
              Chip(label: Text(activity.difficulty)),
              Chip(label: Text('${activity.estimatedMinutes} min')),
            ],
          ),
          const SizedBox(height: 12),
          FilledButton.icon(
            onPressed: onStart,
            icon: const Icon(Icons.play_arrow),
            label: const Text('Iniciar pratica'),
          ),
        ],
      ),
    );
  }
}
