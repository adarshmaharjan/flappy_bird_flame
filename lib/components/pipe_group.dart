import 'package:flame/components.dart';
import 'package:flappy_bird_flame/game/config.dart';
import 'package:flappy_bird_flame/game/pipe_position.dart';

import 'pipe.dart';

class PipeGroup extends PositionComponent {
  PipeGroup();
  @override
  Future<void> onLoad() async {
    addAll(
      [
        Pipe(
          pipePosition: PipePosition.top,
          height: 100,
        ),
        Pipe(
          pipePosition: PipePosition.bottom,
          height: 200,
        )
      ],
    );
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.x -= Config.gameSpeed - dt;
  }
}
