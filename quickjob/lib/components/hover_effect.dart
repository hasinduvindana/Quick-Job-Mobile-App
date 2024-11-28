import 'package:flutter/material.dart';

class HoverEffect extends StatelessWidget {
  final Widget child;

  const HoverEffect({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        // Add hover logic here
      },
      onExit: (_) {
        // Remove hover logic here
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        child: child,
      ),
    );
  }
}
