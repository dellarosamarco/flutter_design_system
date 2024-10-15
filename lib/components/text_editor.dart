import 'package:flutter/material.dart';
import 'package:flutter_design_system/context.dart';

class TextEditorResponse {
  final String title;
  final String content;

  TextEditorResponse({required this.title, required this.content});
}

class TextEditor extends StatefulWidget {
  final String? title;
  final String? content;

  const TextEditor({super.key, this.title, this.content});

  @override
  State<TextEditor> createState() => _TextEditorState();
}

class _TextEditorState extends State<TextEditor> {
  final TextEditingController titleController = TextEditingController();

  final TextEditingController contentController = TextEditingController();

  @override
  void initState() {
    titleController.text = widget.title ?? "";
    contentController.text = widget.content ?? "";

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Context.backgroundColor,
      appBar: AppBar(
        backgroundColor: Context.backgroundColor,
        iconTheme: const IconThemeData(color: Colors.white),
        leading: BackButton(
          onPressed: () => Navigator.pop<TextEditorResponse>(
            context,
            TextEditorResponse(title: titleController.text, content: contentController.text),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                hintText: 'Title',
                hintStyle: TextStyle(color: Context.semiTransparentWhite, fontSize: 25, fontWeight: FontWeight.normal),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.only(left: 16),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            TextField(
              controller: contentController,
              decoration: InputDecoration(
                hintText: 'Note',
                hintStyle: TextStyle(color: Context.semiTransparentWhite, fontSize: 17.5, fontWeight: FontWeight.normal),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.only(left: 16),
              ),
              maxLines: 30,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}