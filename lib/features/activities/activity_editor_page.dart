import 'package:flutter/material.dart';

import '../../core/widgets/app_card.dart';
import 'activities_repository.dart';
import 'activity_model.dart';
import 'widgets/code_editor.dart';

class ActivityEditorPage extends StatefulWidget {
  const ActivityEditorPage({this.activityId, super.key});

  final String? activityId;

  @override
  State<ActivityEditorPage> createState() => _ActivityEditorPageState();
}

class _ActivityEditorPageState extends State<ActivityEditorPage> {
  final _repository = const ActivitiesRepository();
  final _checkedCriteria = <int>{};
  late final ActivityModel? _activity;
  late String _code;
  late bool _completed;

  @override
  void initState() {
    super.initState();
    _activity = widget.activityId == null
        ? null
        : _repository.findById(widget.activityId!);
    _code = _activity?.starterCode ?? '';
    _completed = _activity != null && _repository.isCompleted(_activity.id);
  }

  Future<void> _completeActivity() async {
    final activity = _activity;
    if (activity == null) return;
    await _repository.complete(activity.id);
    if (!mounted) return;
    setState(() => _completed = true);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Atividade concluída e registrada.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final activity = _activity;
    if (activity == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Prática')),
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
                  Text('Saída esperada:\n${activity.exampleOutput}'),
                ],
              ),
            ),
            const SizedBox(height: 12),
            _ActivitySection(
              title: 'Seu código',
              child: CodeEditor(
                initialCode: activity.starterCode,
                onChanged: (value) => setState(() => _code = value),
              ),
            ),
            const SizedBox(height: 12),
            _HintsAndCriteria(
              activity: activity,
              completed: _completed,
              checkedCriteria: _checkedCriteria,
              codeWritten: _code.trim().isNotEmpty,
              onCriterionChanged: (index, checked) {
                setState(() {
                  if (checked) {
                    _checkedCriteria.add(index);
                  } else {
                    _checkedCriteria.remove(index);
                  }
                });
              },
              onComplete: _completeActivity,
            ),
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
  const _HintsAndCriteria({
    required this.activity,
    required this.completed,
    required this.checkedCriteria,
    required this.codeWritten,
    required this.onCriterionChanged,
    required this.onComplete,
  });

  final ActivityModel activity;
  final bool completed;
  final Set<int> checkedCriteria;
  final bool codeWritten;
  final void Function(int index, bool checked) onCriterionChanged;
  final VoidCallback onComplete;

  @override
  State<_HintsAndCriteria> createState() => _HintsAndCriteriaState();
}

class _HintsAndCriteriaState extends State<_HintsAndCriteria> {
  var _revealedHints = 0;

  @override
  Widget build(BuildContext context) {
    return _ActivitySection(
      title: 'Apoio e verificação',
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
            'Autoavaliação antes de concluir:',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(height: 8),
          for (
            var index = 0;
            index < widget.activity.successCriteria.length;
            index++
          )
            CheckboxListTile(
              contentPadding: EdgeInsets.zero,
              controlAffinity: ListTileControlAffinity.leading,
              value: widget.checkedCriteria.contains(index),
              onChanged: widget.completed
                  ? null
                  : (value) => widget.onCriterionChanged(index, value ?? false),
              title: Text(widget.activity.successCriteria[index]),
            ),
          const SizedBox(height: 8),
          if (widget.completed)
            const Text('Atividade concluída.')
          else
            FilledButton.icon(
              onPressed:
                  widget.codeWritten &&
                      widget.checkedCriteria.length ==
                          widget.activity.successCriteria.length
                  ? widget.onComplete
                  : null,
              icon: const Icon(Icons.check_circle_outline),
              label: const Text('Registrar conclusão'),
            ),
        ],
      ),
    );
  }
}
