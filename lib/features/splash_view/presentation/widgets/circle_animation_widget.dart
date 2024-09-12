import 'package:busapp/constants.dart';
import 'package:flutter/material.dart';

class CircleAnimation extends StatefulWidget {
  final bool isShrunk;

  const CircleAnimation({super.key, required this.isShrunk});

  @override
  CircleAnimationState createState() => CircleAnimationState();
}

class CircleAnimationState extends State<CircleAnimation> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      width: widget.isShrunk ? 0 : 109,
      height: widget.isShrunk ? 0 : 37,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(circleImage),
          fit: BoxFit.contain,
        ),
      ),
      curve: Curves.easeInBack,
    );
  }
}
