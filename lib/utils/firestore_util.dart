import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> addUserToFirestore(String? user, int score) async {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  try {
    await _firestore.collection('leaderboard').add({
      'user': user,
      'score': score,
    });
    print('User added to Firestore');
  } catch (e) {
    print('Error adding user to Firestore: $e');
  }
}
