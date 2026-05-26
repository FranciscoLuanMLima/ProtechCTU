import 'package:flutter/material.dart';

import '../../core/widgets/app_card.dart';
import 'activities_repository.dart';
import 'activity_model.dart';
import 'widgets/code_editor.dart';

class ActivityEditorPage extends StatelessWidget {
  const ActivityEditorPage({this.activityId, super.key});

  final String? activityId;

  @override
  Widget build(BuildContext context) {
    final activity = activityId == null
        ? null
        : const ActivitiesRepository().findById(activityId!);
    if (activity == null) {
      return Scaffold(
        appBar: AppBar(title: Text('Pratica')),
        body: const Center(
          child: Text('Selecione uma atividade para iniciar.'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(activity.title)),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                Chip(label: Text(activity.concept)),
                Chip(label: Text(activity.difficulty)),
                Chip(label: Text('${activity.estimatedMinutes} minutos')),
              ],
            ),
            const SizedBox(height: 16),
            _ActivitySection(
              title: 'Objetivo',
              child: Text(activity.objective),
            ),
            const SizedBox(height: 12),
            _ActivitySection(
              title: 'Desafio',
              child: Text(activity.problemStatement),
            ),
            const SizedBox(height: 12),
            _ActivitySection(
              title: 'Etapas sugeridas',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (var index = 0; index < activity.steps.length; index++)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text('${index + 1}. ${activity.steps[index]}'),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            _ActivitySection(
              title: 'Exemplo',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Entrada:\n${activity.exampleInput}'),
                  const SizedBox(height: 10),
                  Text('Saida esperada:\n${activity.exampleOutput}'),
                ],
              ),
            ),
            const SizedBox(height: 12),
            _ActivitySection(
              title: 'Seu codigo',
              child: CodeEditor(initialCode: activity.starterCode),
            ),
            const SizedBox(height: 12),
            _HintsAndCriteria(activity: activity),
          ],
        ),
      ),
    );
  }
}

class _ActivitySection extends StatelessWidget {
  const _ActivitySection({required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }
}

class _HintsAndCriteria extends StatefulWidget {
  const _HintsAndCriteria({required this.activity});

  final ActivityModel activity;

  @override
  State<_HintsAndCriteria> createState() => _HintsAndCriteriaState();
}

class _HintsAndCriteriaState extends State<_HintsAndCriteria> {
  var _revealedHints = 0;

  @override
  Widget build(BuildContext context) {
    return _ActivitySection(
      title: 'Apoio e verificacao',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OutlinedButton.icon(
            onPressed: _revealedHints < widget.activity.hints.length
                ? () => setState(() => _revealedHints++)
                : null,
            icon: const Icon(Icons.lightbulb_outline),
            label: const Text('Revelar dica'),
          ),
          for (final hint
              in widget.activity.hints.take(_revealedHints).toList())
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text('- $hint'),
            ),
          const SizedBox(height: 16),
          Text(
            'Confira antes de concluir:',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(height: 8),
          for (final criterion in widget.activity.successCriteria)
            Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Text('[ ] $criterion'),
            ),
        ],
      ),
    );
  }
}
