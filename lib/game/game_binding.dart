import 'package:get/get.dart';
import 'package:space_shooter_workshop/game/game_controller.dart';

class GameBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<GameController>(
      GameController(),
    );
  }
}
