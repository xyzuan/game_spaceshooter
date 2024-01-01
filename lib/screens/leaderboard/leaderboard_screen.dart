import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:space_shooter_workshop/screens/leaderboard/leaderboard_controller.dart';

class LeaderboardScreen extends GetView<LeaderboardController> {
  const LeaderboardScreen({super.key});

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
                      'Leaderboard',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.pressStart2p(
                        fontSize: 32,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    height: 150,
                    child: StreamBuilder<QuerySnapshot>(
                      stream: controller.firestore
                          .collection('leaderboard')
                          .orderBy('score', descending: true)
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Center(child: CircularProgressIndicator());
                        }

                        final documents = snapshot.data!.docs;

                        return ListView.builder(
                          itemCount: documents.length,
                          itemBuilder: (context, index) {
                            final doc = documents[index];
                            return Card(
                              child: Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Row(
                                  children: [
                                    Text(
                                      doc['user'].toString(),
                                      style: GoogleFonts.pressStart2p(
                                        fontSize: 16,
                                      ),
                                    ),
                                    Spacer(),
                                    Text(
                                      doc['score'].toString(),
                                      style: GoogleFonts.pressStart2p(
                                        fontSize: 16,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
