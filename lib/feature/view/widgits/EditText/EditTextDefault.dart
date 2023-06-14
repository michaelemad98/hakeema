import 'package:flutter/material.dart';

class DefaultEdittxt extends StatelessWidget {
  final String ? hintText;
  final Icon ? sufixicon;
  final TextEditingController ?tec;
  const DefaultEdittxt({Key? key,this.hintText,this.sufixicon,this.tec}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: tec,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: sufixicon,
        border: InputBorder.none,
      ),
    );
  }
}
