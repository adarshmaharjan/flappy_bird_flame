import 'package:flame/game.dart';
import 'package:flappy_bird_flame/components/background.dart';
import 'package:flappy_bird_flame/components/bird.dart';
import 'package:flappy_bird_flame/components/ground.dart';
import 'package:flappy_bird_flame/components/pipe_group.dart';

class FlappyBirdGame extends FlameGame {
  FlappyBirdGame();
  late Bird bird;
  @override
  Future<void> onLoad() async {
    addAll([
      Background(),
      Ground(),
      bird = Bird(),
      PipeGroup(),
    ]);
  }
}
