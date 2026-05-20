import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../app/constants.dart';
import '../../app/router.dart';
import 'splash_cubit.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _runSplash();
  }

  Future<void> _runSplash() async {
    await context.read<SplashCubit>().start();
    if (mounted) context.go(AppRoute.triage.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SplashCubit, bool>(
        builder: (context, visible) {
          return Center(
            child: AnimatedOpacity(
              opacity: visible ? 1 : 0,
              duration: const Duration(milliseconds: 650),
              curve: Curves.easeOut,
              child: Image.asset(
                AppConstants.logoPath,
                width: 150,
                fit: BoxFit.contain,
              ),
            ),
          );
        },
      ),
    );
  }
}
