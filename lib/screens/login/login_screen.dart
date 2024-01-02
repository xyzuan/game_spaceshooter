import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:space_shooter_workshop/screens/login/login_controller.dart';
import 'package:space_shooter_workshop/screens/register/register_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _authController = Get.put(LoginController());
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final SharedPreferences _prefs = Get.find<SharedPreferences>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Positioned.fill(
          child: ColoredBox(
            color: Colors.black,
            child: Image.asset(
              'assets/images/background_stars_1.png',
              fit: BoxFit.cover,
              repeat: ImageRepeat.repeat,
              filterQuality: FilterQuality.none,
            ),
          ),
        ),
        Positioned(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 180,
                  child: Image.asset(
                    'assets/images/banner.png',
                    fit: BoxFit.contain,
                    filterQuality: FilterQuality.none,
                  ),
                ),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: GoogleFonts.pressStart2p(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(25)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(25))),
                  style: GoogleFonts.pressStart2p(color: Colors.white),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: GoogleFonts.pressStart2p(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(25)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(25))),
                  style: GoogleFonts.pressStart2p(color: Colors.white),
                ),
                SizedBox(height: 30),
                Obx(() {
                  return SizedBox(
                    width: 100,
                    height: 40,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25))),
                      onPressed: _authController.isLoading.value
                          ? null
                          : () {
                              _authController.loginUser(
                                _emailController.text,
                                _passwordController.text,
                              );
                            },
                      child: _authController.isLoading.value
                          ? const CircularProgressIndicator()
                          : Text('Login',
                              style: GoogleFonts.pressStart2p(
                                  color: Colors.black)),
                    ),
                  );
                }),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Dont have an account? ",
                      style: GoogleFonts.pressStart2p(color: Colors.white),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.off(RegisterScreen());
                      },
                      child: Text("Create ",
                          style: GoogleFonts.pressStart2p(
                              color: Colors.cyanAccent)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
