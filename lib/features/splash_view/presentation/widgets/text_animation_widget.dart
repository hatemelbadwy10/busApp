import 'package:flutter/material.dart';

class TextAnimation extends StatelessWidget {
  final Animation<double> verticalAnimation;
  final Animation<double> opacityAnimation;

  const TextAnimation({
    super.key,
    required this.verticalAnimation,
    required this.opacityAnimation,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: verticalAnimation,
      builder: (BuildContext context, Widget? child) {
        return Transform.translate(
          offset: Offset(0, verticalAnimation.value),
          child: FadeTransition(
            opacity: opacityAnimation,
            child: const Text(
              'My Bus',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }
}
