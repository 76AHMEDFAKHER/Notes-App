import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/custome_appbar_icon.dart';

class CustomeAppbar extends StatelessWidget {
  const CustomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Notes', style: TextStyle(fontSize: 32)),
        CustomeAppbarIcon(icon: Icons.search, onPressed: () {}),
      ],
    );
  }
}
