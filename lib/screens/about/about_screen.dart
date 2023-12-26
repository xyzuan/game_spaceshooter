import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:space_shooter_workshop/screens/about/about_controller.dart';

class AboutScreen extends GetView<AboutController> {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
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
          Positioned.fill(
              top: 42,
              right: 18,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Text(
                      'About Us',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.pressStart2p(
                        fontSize: 32,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text(
                        'Jody Yuantoro',
                        style: GoogleFonts.pressStart2p(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text(
                        'Moch. Iqbal Arizki',
                        style: GoogleFonts.pressStart2p(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text(
                        'Rafidhiya Bagus Farizki',
                        style: GoogleFonts.pressStart2p(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
