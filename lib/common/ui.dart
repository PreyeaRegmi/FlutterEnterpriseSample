import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class TextInputField extends StatefulWidget {
  final String _hint;
  final TextInputAction textInputAction;
  final TextEditingController textEditingController;
  int? minLine;
  int? maxLine;

  TextInputField(this.textEditingController ,this._hint, {this.minLine,this.maxLine=1,this.textInputAction=TextInputAction.next});

  @override
  State<StatefulWidget> createState() {
    return _TextInputFieldState();
  }
}

class _TextInputFieldState extends State<TextInputField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
        textInputAction: widget.textInputAction,
        minLines: widget.minLine,
        maxLines: widget.maxLine,
        controller: widget.textEditingController,
        decoration: InputDecoration(labelText: widget._hint));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
