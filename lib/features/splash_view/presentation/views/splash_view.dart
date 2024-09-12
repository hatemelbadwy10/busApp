import 'package:busapp/core/utils/extentions.dart';
import 'package:busapp/features/auth/presentation/sign_in_view/view/sign_in_view.dart';
import 'package:flutter/material.dart';
import '../widgets/circle_animation_widget.dart';
import '../widgets/logo_animation_widget.dart';
import '../widgets/text_animation_widget.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  SplashViewState createState() => SplashViewState();
}

class SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  bool _isShrunk = false;
  bool _logoVisible = true;
  late AnimationController _verticalController;
  late AnimationController _horizontalController;
  late AnimationController _textController;
  late Animation<double> _logoVerticalAnimation;
  late Animation<double> _logoScaleAnimation;
  late Animation<double> _logoHorizontalAnimation;
  late Animation<double> _textVerticalAnimation;
  late Animation<double> _textOpacityAnimation;

  @override
  void initState() {
    super.initState();

    _verticalController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _horizontalController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _textController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _logoVerticalAnimation = Tween<double>(begin: 50, end: -40).animate(
      CurvedAnimation(parent: _verticalController, curve: Curves.easeOut),
    );

    _logoScaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _verticalController, curve: Curves.easeIn),
    );

    _logoHorizontalAnimation = Tween<double>(begin: 50, end: -25).animate(
      CurvedAnimation(parent: _horizontalController, curve: Curves.easeIn),
    );

    _textVerticalAnimation = Tween<double>(begin: 50, end: -40).animate(
      CurvedAnimation(parent: _verticalController, curve: Curves.easeOut),
    );

    _textOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _textController, curve: Curves.easeIn),
    );

    _startAnimations();
  }

  void _startAnimations() {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _isShrunk = true;
      });

      Future.delayed(const Duration(milliseconds: 200), () {
        setState(() {
          _logoVisible = true;
        });
        _verticalController.forward().then((_) {
          Future.delayed(const Duration(milliseconds: 100), () {
            _horizontalController.forward().then((_) {
              Future.delayed(const Duration(milliseconds: 100), () {
                _textController.forward().then((_) {
                  Future.delayed(const Duration(milliseconds: 300), () {
                    context.pushReplacement(const SignInView());
                  });
                });
              });
            });
          });
        });
      });
    });
  }

  @override
  void dispose() {
    _verticalController.dispose();
    _horizontalController.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            CircleAnimation(isShrunk: _isShrunk),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LogoAnimation(
                  logoVisible: _logoVisible,
                  verticalAnimation: _logoVerticalAnimation,
                  horizontalAnimation: _logoHorizontalAnimation,
                  scaleAnimation: _logoScaleAnimation,
                ),
                const SizedBox(width: 5),
                TextAnimation(
                  verticalAnimation: _textVerticalAnimation,
                  opacityAnimation: _textOpacityAnimation,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
