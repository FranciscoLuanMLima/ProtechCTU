import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../app/router.dart';
import '../../core/widgets/app_button.dart';
import 'activities_cubit.dart';
import 'activity_model.dart';
import 'widgets/activity_card.dart';

class ActivitiesPage extends StatelessWidget {
  const ActivitiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Atividades')),
      body: BlocBuilder<ActivitiesCubit, List<ActivityModel>>(
        builder: (context, activities) {
          return ListView(
            padding: const EdgeInsets.all(24),
            children: [
              AppButton(
                label: 'Nova atividade',
                icon: Icons.add,
                onPressed: () => context.go(AppRoute.activityEditor.path),
              ),
              const SizedBox(height: 16),
              for (final activity in activities) ...[
                ActivityCard(activity: activity),
                const SizedBox(height: 12),
              ],
            ],
          );
        },
      ),
    );
  }
}
