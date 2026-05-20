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
                onTap: () => context.go('/concepts/${concept.id}'),
                child: AppCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        concept.title,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 8),
                      Text(concept.description),
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
