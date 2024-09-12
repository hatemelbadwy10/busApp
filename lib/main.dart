import 'package:flutter/material.dart';

import 'features/splash_view/presentation/views/splash_view.dart';

void main() {
  runApp(const MyBus());
}
class MyBus extends StatelessWidget {
  const MyBus({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'poppins',
        canvasColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white,
          surfaceContainerHigh: Colors.white,
        ),
      ),
      home: const SplashView(),
    );
  }
}
