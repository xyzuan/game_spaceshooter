import 'package:flame_splash_screen/flame_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:space_shooter_workshop/routes/pages_name.dart';
// import 'package:space_shooter_workshop/screens/title/title_controller.dart';
import 'package:space_shooter_workshop/screens/login/login_controller.dart';

class SplashScreen extends GetView<LoginController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FlameSplashScreen(
        theme: FlameSplashTheme.dark,
        onFinish: (value) => Get.offAndToNamed(PageName.login));
  }
}
