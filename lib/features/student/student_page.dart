import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/widgets/app_card.dart';
import '../../core/widgets/loading.dart';
import 'student_cubit.dart';

class StudentPage extends StatelessWidget {
  const StudentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Estudante')),
      body: BlocBuilder<StudentCubit, dynamic>(
        builder: (context, student) {
          if (student == null) return const Loading();

          return ListView(
            padding: const EdgeInsets.all(24),
            children: [
              AppCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      student.name,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 8),
                    Text('Matricula: ${student.registration}'),
                    Text('Ano de entrada: ${student.entryYear}'),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
