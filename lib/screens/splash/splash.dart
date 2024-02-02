import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_editor_app/screens/splash/splash_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      builder: (_) {
        return const Scaffold(
          backgroundColor: Colors.white,
          body: Text("Image Editor"),
        );
      },
    );
  }
}
