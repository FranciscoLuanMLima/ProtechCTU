import 'package:flutter/material.dart';

import '../../core/widgets/app_card.dart';
import 'concept_model.dart';
import 'concepts_repository.dart';

class ConceptDetailPage extends StatelessWidget {
  const ConceptDetailPage({required this.conceptId, super.key});

  final String conceptId;

  @override
  Widget build(BuildContext context) {
    final concept = ConceptsRepository.instance.findById(conceptId);
    if (concept == null) {
      return Scaffold(
        appBar: AppBar(title: Text('Assunto')),
        body: const Center(child: Text('Assunto não encontrado.')),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(concept.title)),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              Chip(label: Text(concept.difficulty)),
              Chip(label: Text('${concept.estimatedMinutes} minutos')),
            ],
          ),
          const SizedBox(height: 20),
          _SectionCard(
            title: 'O que você vai aprender',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (final objective in concept.objectives)
                  _Bullet(text: objective),
              ],
            ),
          ),
          const SizedBox(height: 12),
          _SectionCard(title: 'Explicação', child: Text(concept.explanation)),
          const SizedBox(height: 12),
          _SectionCard(
            title: 'Exemplo em Python',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _CodeBlock(code: concept.exampleCode),
                const SizedBox(height: 12),
                Text(concept.exampleExplanation),
              ],
            ),
          ),
          const SizedBox(height: 12),
          _SectionCard(
            title: 'Pratique passo a passo',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var index = 0; index < concept.guidedSteps.length; index++)
                  _NumberedStep(
                    number: index + 1,
                    text: concept.guidedSteps[index],
                  ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          _Checkpoint(concept: concept),
          if (concept.nextTopic != null) ...[
            const SizedBox(height: 12),
            AppCard(
              child: Text(
                'Próximo assunto recomendado: ${concept.nextTopic}',
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  const _SectionCard({required this.title, required this.child});

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

class _Bullet extends StatelessWidget {
  const _Bullet({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('-  '),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }
}

class _NumberedStep extends StatelessWidget {
  const _NumberedStep({required this.number, required this.text});

  final int number;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(radius: 12, child: Text(number.toString())),
          const SizedBox(width: 10),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }
}

class _CodeBlock extends StatelessWidget {
  const _CodeBlock({required this.code});

  final String code;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.25),
        borderRadius: BorderRadius.circular(8),
      ),
      child: SelectableText(
        code,
        style: const TextStyle(fontFamily: 'monospace', height: 1.5),
      ),
    );
  }
}

class _Checkpoint extends StatefulWidget {
  const _Checkpoint({required this.concept});

  final ConceptModel concept;

  @override
  State<_Checkpoint> createState() => _CheckpointState();
}

class _CheckpointState extends State<_Checkpoint> {
  bool _showAnswer = false;

  @override
  Widget build(BuildContext context) {
    return _SectionCard(
      title: 'Cheque seu entendimento',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.concept.checkpointQuestion),
          const SizedBox(height: 12),
          OutlinedButton(
            onPressed: () => setState(() => _showAnswer = !_showAnswer),
            child: Text(_showAnswer ? 'Ocultar resposta' : 'Ver resposta'),
          ),
          if (_showAnswer) ...[
            const SizedBox(height: 12),
            Text(widget.concept.checkpointAnswer),
          ],
        ],
      ),
    );
  }
}
