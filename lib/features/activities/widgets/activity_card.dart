import 'package:flutter/material.dart';

import '../../../core/widgets/app_card.dart';
import '../activity_model.dart';

class ActivityCard extends StatelessWidget {
  const ActivityCard({required this.activity, super.key});

  final ActivityModel activity;

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
        ],
      ),
    );
  }
}
