import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> addUserToFirestore(String? user, int score, double time) async {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  try {
    await _firestore.collection('leaderboard').add({
      'user': user,
      'score': score,
      'time': time,
    });
    print('User added to Firestore');
  } catch (e) {
    print('Error adding user to Firestore: $e');
  }
}
