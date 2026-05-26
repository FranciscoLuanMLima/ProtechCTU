import 'package:flutter/material.dart';

class CodeEditor extends StatefulWidget {
  const CodeEditor({required this.initialCode, this.onChanged, super.key});

  final String initialCode;
  final ValueChanged<String>? onChanged;

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
      onChanged: widget.onChanged,
      minLines: 14,
      maxLines: null,
      decoration: const InputDecoration(
        alignLabelWithHint: true,
        labelText: 'Código',
      ),
      style: const TextStyle(fontFamily: 'monospace'),
    );
  }
}
