import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flappy_bird_flame/components/background.dart';
import 'package:flappy_bird_flame/components/bird.dart';
import 'package:flappy_bird_flame/components/ground.dart';
import 'package:flappy_bird_flame/components/pipe_group.dart';
import 'package:flappy_bird_flame/game/config.dart';
import 'package:flutter/painting.dart';

class FlappyBirdGame extends FlameGame with TapDetector, HasCollisionDetection {
  FlappyBirdGame();
  late Bird bird;
  late TextComponent score;
  bool isHit = false;
  Timer interval = Timer(
    Config.pipeInterval,
    repeat: true,
  );
  @override
  Future<void> onLoad() async {
    addAll([
      Background(),
      Ground(),
      bird = Bird(),
      score = buildScore(),
    ]);
    interval.onTick = () => add(
          PipeGroup(),
        );
  }

  TextComponent buildScore() {
    return TextComponent(
      text: "Score 0",
      position: Vector2(
        size.x / 2,
        size.y / 2 * 0.2,
      ),
      anchor: Anchor.center,
      textRenderer: TextPaint(
        style: const TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
          fontFamily: 'Game',
        ),
      ),
    );
  }

  @override
  void onTap() {
    super.onTap();
    bird.fly();
  }

  @override
  void update(double dt) {
    super.update(dt);
    interval.update(dt);
    score.text = "Score:${bird.score}";
  }
}
