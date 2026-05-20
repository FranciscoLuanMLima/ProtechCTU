import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../app/router.dart';
import '../../core/widgets/app_button.dart';
import '../../core/widgets/app_card.dart';
import 'questions_cubit.dart';

class QuestionsPage extends StatelessWidget {
  const QuestionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<QuestionsCubit>();

    return Scaffold(
      appBar: AppBar(title: const Text('Perguntas')),
      body: SafeArea(
        child: BlocBuilder<QuestionsCubit, Map<String, String>>(
          builder: (context, answers) {
            final completed = answers.length == cubit.questions.length;

            return ListView(
              padding: const EdgeInsets.all(24),
              children: [
                for (final question in cubit.questions) ...[
                  AppCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          question.title,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 12),
                        DropdownButtonFormField<String>(
                          initialValue: answers[question.id],
                          decoration: const InputDecoration(
                            labelText: 'Selecione uma opcao',
                          ),
                          items: question.options
                              .map(
                                (option) => DropdownMenuItem(
                                  value: option,
                                  child: Text(option),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            if (value != null) cubit.answer(question.id, value);
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
                AppButton(
                  label: 'Continuar',
                  icon: Icons.arrow_forward,
                  onPressed: completed
                      ? () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Respostas salvas.')),
                          );
                          context.go(AppRoute.auth.path);
                        }
                      : null,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
