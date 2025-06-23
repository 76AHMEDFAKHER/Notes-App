import 'package:flutter/material.dart';
import 'package:notes_app/constant.dart';

class CustomeTextField extends StatelessWidget {
  CustomeTextField({
    super.key,
    required this.hintTitle,
    required this.maxLines,
    required this.textHeight,
    this.onsaved,
  });
  final String hintTitle;
  final int maxLines;
  final double textHeight;
  void Function(String?)? onsaved;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onsaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Please enter a $hintTitle';
        } else {
          return null;
        }
      },
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintTitle,
        hintStyle: TextStyle(
          height: textHeight,
          color: const Color.fromARGB(233, 15, 146, 206),
          fontSize: 15,
        ),
        border: borderline(),
        focusedBorder: borderline(primaryColor),
      ),
    );
  }

  OutlineInputBorder borderline([color]) => OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: BorderSide(
      color: color ?? const Color.fromARGB(255, 15, 146, 206),
      width: 1,
    ),
  );
}
