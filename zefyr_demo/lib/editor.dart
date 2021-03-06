import 'package:flutter/material.dart';
import 'package:zefyr/zefyr.dart';

class Editor extends StatefulWidget {
  @override
  EditorState createState() => EditorState();
}

class EditorState extends State<Editor> {
  ZefyrController _controller;
  FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    // Create an empty document or load existing if you have one.
    // Here we create an empty document:
    final document = new NotusDocument();
    _controller = new ZefyrController(document);
    _focusNode = new FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return ZefyrScaffold(
      child: ZefyrEditor(
        controller: _controller,
        focusNode: _focusNode,
      ),
    );
  }
}