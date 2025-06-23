import 'package:flutter/material.dart';
import 'package:notes_app/constant.dart';

class CustomeButton extends StatelessWidget {
  CustomeButton({super.key, required this.onTap});
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width * 0.7,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(child: Text('Add')),
      ),
    );
  }
}
