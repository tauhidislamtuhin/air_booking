import 'package:flutter/material.dart';

class CommonHeader extends StatelessWidget {
  final double height;
  final Widget? child;

  const CommonHeader({
    super.key,
    this.height = 300, this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF2F6BFF),
            Color(0xFF1E5BFF),
          ],
        ),
        image: DecorationImage(
          image: AssetImage("assets/images/dots_pattern.png"),
          fit: BoxFit.cover,
          opacity: .12,
        ),
      ),
      child: child,
    );
  }
}