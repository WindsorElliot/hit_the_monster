import 'dart:ui';

import 'package:flame/flame.dart';
import 'package:flame/game/game.dart';
import 'package:hit_the_monster/components/bg_component.dart';

class MonsterGame extends Game {

  Size currentSize;
  BgComponent bgComponent;


  MonsterGame() {
    this._initialyse();
  }

  @override
  void render(Canvas canvas) {
    this.bgComponent.render(canvas);
  }

  @override
  void update(double t) {

  }

  @override
  void resize(Size size) {
    this.currentSize = size;
    super.resize(size);
  }

  void _initialyse() async {
    resize(await Flame.util.initialDimensions());
    this.bgComponent = BgComponent(game: this);
  }
}