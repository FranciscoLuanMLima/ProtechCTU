import 'package:flutter/material.dart';

class ConceptDetailPage extends StatelessWidget {
  const ConceptDetailPage({required this.conceptId, super.key});

  final String conceptId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Conceito')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Text(
          'Conteudo do conceito: $conceptId',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
