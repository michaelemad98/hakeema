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

class DefaultEditTxtMuilti extends StatelessWidget {
  final String ? hintText;
  final Icon ? sufixicon;
  final TextEditingController ?tec;
  const DefaultEditTxtMuilti({super.key,this.hintText,this.sufixicon,this.tec});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.0,
      child: TextField(
        minLines: 3, // Set this
        maxLines: 6, // and this
        keyboardType: TextInputType.multiline,
        controller: tec,
        decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: sufixicon,
          border: InputBorder.none,
          hintMaxLines: 5
        ),
      ),
    );
  }
}
