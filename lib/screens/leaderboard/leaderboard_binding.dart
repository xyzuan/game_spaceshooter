import 'package:get/get.dart';
import 'package:space_shooter_workshop/screens/leaderboard/leaderboard_controller.dart';

class LeaderboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<LeaderboardController>(
      LeaderboardController(),
    );
  }
}
