import 'package:flutter/material.dart';

class CodeEditor extends StatefulWidget {
  const CodeEditor({required this.initialCode, super.key});

  final String initialCode;

  @override
  State<CodeEditor> createState() => _CodeEditorState();
}

class _CodeEditorState extends State<CodeEditor> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialCode);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      minLines: 14,
      maxLines: null,
      decoration: const InputDecoration(
        alignLabelWithHint: true,
        labelText: 'Codigo',
      ),
      style: const TextStyle(fontFamily: 'monospace'),
    );
  }
}
