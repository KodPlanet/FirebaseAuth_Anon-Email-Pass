import 'package:flutter/material.dart';

class MyRaisedButton extends StatelessWidget {
  final Widget child;
  final Color color;
  final VoidCallback? onPressed;

  const MyRaisedButton(
      {required this.color, required this.onPressed, required this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 300,
      // ignore: deprecated_member_use
      child: RaisedButton(
          disabledColor: color.withOpacity(0.8),
          color: color,
          onPressed: onPressed,
          child: child,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)))),
    );
  }
}
