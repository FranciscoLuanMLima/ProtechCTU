import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../core/widgets/app_card.dart';
import 'concept_model.dart';
import 'concepts_cubit.dart';

class ConceptsPage extends StatelessWidget {
  const ConceptsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Conceitos')),
      body: BlocBuilder<ConceptsCubit, List<ConceptModel>>(
        builder: (context, concepts) {
          return ListView.separated(
            padding: const EdgeInsets.all(24),
            itemCount: concepts.length,
            separatorBuilder: (_, _) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final concept = concepts[index];
              return InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: () => context.push('/concepts/${concept.id}'),
                child: AppCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              concept.title,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                          Chip(label: Text(concept.difficulty)),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(concept.description),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          const Icon(Icons.schedule, size: 18),
                          const SizedBox(width: 6),
                          Text('${concept.estimatedMinutes} min'),
                          const Spacer(),
                          Text(
                            'Estudar assunto',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
