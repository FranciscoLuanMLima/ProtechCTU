import 'package:flutter/material.dart';

import 'widgets/code_editor.dart';

class ActivityEditorPage extends StatelessWidget {
  const ActivityEditorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Editor')),
      body: const SafeArea(
        child: Padding(padding: EdgeInsets.all(24), child: CodeEditor()),
      ),
    );
  }
}
