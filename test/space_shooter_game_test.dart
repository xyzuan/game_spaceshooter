import 'package:flutter_test/flutter_test.dart';
import 'package:space_shooter_workshop/game/components/components.dart';
import 'package:space_shooter_workshop/game/game_engine.dart';

void main() {
  late SpaceShooterGame spaceShooterGame;

  setUp(() {
    spaceShooterGame = SpaceShooterGame();
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  test('Initial score is zero', () {
    expect(spaceShooterGame.firstChild<ScoreCounter>()?.score, equals(0));
  });

  test('Increase score increments the score counter', () {
    final initialScore =
        spaceShooterGame.firstChild<ScoreCounter>()?.score ?? 0;
    spaceShooterGame.increaseScore();
    expect(spaceShooterGame.firstChild<ScoreCounter>()?.score,
        equals(initialScore + 2));
  });
}
