import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle:
                          TextStyle(color: Color(0xFFFFFFFF), fontSize: 10),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 153, 36, 161)),
                          borderRadius: BorderRadius.circular(25)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 153, 36, 161)),
                          borderRadius: BorderRadius.circular(25))),
                  style: TextStyle(fontSize: 11, color: Color(0xFFFFFFFF)),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle:
                          TextStyle(color: Color(0xFFFFFFFF), fontSize: 10),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 153, 36, 161)),
                          borderRadius: BorderRadius.circular(25)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 153, 36, 161)),
                          borderRadius: BorderRadius.circular(25))),
                  style: TextStyle(fontSize: 11, color: Color(0xFFFFFFFF)),
                ),

                SizedBox(height: 30),

                Obx(() {
                  return SizedBox(
                    width: 100,
                    height: 40,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 153, 36, 161),
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
                          : Text(
                              'Login',
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.normal),
                            ),
                    ),
                  );
                }),

                const SizedBox(height: 30),

                //SIGN UP
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Dont have an account? ",
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.off(RegisterScreen());
                      },
                      child: Text(
                        "Create ",
                        style: TextStyle(
                          color: Color.fromARGB(255, 153, 36, 161),
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                // SignInButton(
                //   Buttons.google,
                //   onPressed: () {
                //     _authController.handleGoogleSignIn();

                //     print("google onclicked");
                //   },
                // )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
