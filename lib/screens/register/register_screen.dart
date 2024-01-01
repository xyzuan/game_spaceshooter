import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle:
                        TextStyle(color: Color(0xFFFFFFFF), fontSize: 10),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF24A19C)),
                        borderRadius: BorderRadius.circular(25)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF24A19C)),
                        borderRadius: BorderRadius.circular(25))),
                style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 11),
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
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(color: Color(0xFF24A19C))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF24A19C)),
                        borderRadius: BorderRadius.circular(25))),
                style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 11),
              ),

              SizedBox(height: 30),

              Obx(() {
                return SizedBox(
                  width: 100,
                  height: 60,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF24A19C),
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
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.normal),
                          ),
                  ),
                );
              }),

              const SizedBox(height: 20),

              //LOGIN
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
                    style: TextStyle(
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.off(LoginScreen());
                    },
                    child: Text(
                      "Login ",
                      style: TextStyle(
                        color: Color(0xFF24A19C),
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold,
                      ),
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
