import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  const CustomDrawer({
    super.key,
    required this.child,
    this.backgroundColor,
  });
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: backgroundColor ?? const Color(0xFFe7dece),
      width: MediaQuery.of(context).size.width * 0.8,
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: child,
      ),
    );
  }
}
