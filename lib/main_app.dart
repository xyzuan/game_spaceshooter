import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:space_shooter_workshop/routes/pages_name.dart';
import 'package:space_shooter_workshop/routes/pages_route.dart';
import 'package:space_shooter_workshop/screens/login/login_controller.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:
          controller.isLoggedIn.value ? PageName.title : PageName.splash,
      getPages: PageRoutes.pages,
    );
  }
}
