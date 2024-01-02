import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:space_shooter_workshop/screens/login/login_screen.dart';
import 'package:space_shooter_workshop/screens/register/register_controller.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _authController = Get.put(RegisterController());

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

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
        Padding(
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
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(color: Colors.white)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(25))),
                style: GoogleFonts.pressStart2p(color: Colors.white),
              ),
              SizedBox(height: 30),
              Obx(() {
                return SizedBox(
                  width: 160,
                  height: 40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25))),
                    onPressed: _authController.isLoading.value
                        ? null
                        : () {
                            _authController.registerUser(
                              _emailController.text,
                              _passwordController.text,
                            );
                          },
                    child: _authController.isLoading.value
                        ? const CircularProgressIndicator()
                        : Text(
                            'Register',
                            style:
                                GoogleFonts.pressStart2p(color: Colors.black),
                          ),
                  ),
                );
              }),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
                    style: GoogleFonts.pressStart2p(color: Colors.white),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.off(LoginScreen());
                    },
                    child: Text(
                      "Login ",
                      style: GoogleFonts.pressStart2p(color: Colors.cyanAccent),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
