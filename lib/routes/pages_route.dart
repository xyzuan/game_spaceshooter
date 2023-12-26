import 'package:get/get.dart';
import 'package:space_shooter_workshop/game/game_binding.dart';
import 'package:space_shooter_workshop/game/game_screen.dart';
import 'package:space_shooter_workshop/routes/pages_name.dart';
import 'package:space_shooter_workshop/screens/splash/splash_binding.dart';
import 'package:space_shooter_workshop/screens/splash/splash_screen.dart';
import 'package:space_shooter_workshop/screens/title/title_binding.dart';
import 'package:space_shooter_workshop/screens/title/title_screen.dart';

class PageRoutes {
  static final pages = [
    GetPage(
      name: PageName.splash,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: PageName.title,
      page: () => const TitleScreen(),
      binding: TitleBinding(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 250),
    ),
    GetPage(
      name: PageName.game,
      page: () => const GameScreen(),
      binding: GameBinding(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 250),
    ),
  ];
}
