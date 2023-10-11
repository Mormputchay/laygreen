import 'package:flutter/material.dart';

class RoundButton1 extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  final Color color;
  const RoundButton1(
      {super.key,
      required this.child,
      required this.onPressed,
      required this.color});
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      minWidth: 50,
      height: 55,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: color,
      child: child,
    );
  }
}
