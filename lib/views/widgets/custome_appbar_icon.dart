import 'package:flutter/material.dart';

class CustomeAppbarIcon extends StatelessWidget {
  final IconData icon;
  final void Function()? onPressed;

  const CustomeAppbarIcon({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: IconButton(onPressed: onPressed, icon: Icon(icon)),
    );
  }
}
