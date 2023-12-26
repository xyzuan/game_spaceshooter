import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:space_shooter_workshop/routes/pages_name.dart';
import 'package:space_shooter_workshop/routes/pages_route.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: PageName.title,
      getPages: PageRoutes.pages,
    );
  }
}
