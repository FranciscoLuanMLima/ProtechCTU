import 'package:flutter/material.dart';

class CodeEditor extends StatelessWidget {
  const CodeEditor({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      minLines: 14,
      maxLines: null,
      decoration: const InputDecoration(
        alignLabelWithHint: true,
        labelText: 'Codigo',
        hintText: 'print("Ola, ProTech!")',
      ),
      style: const TextStyle(fontFamily: 'monospace'),
    );
  }
}
