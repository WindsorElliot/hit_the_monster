import 'dart:math';
import 'dart:ui';

import 'package:flame/flame.dart';
import 'package:flame/game/game.dart';
import 'package:hit_the_monster/components/bg_component.dart';
import 'package:hit_the_monster/components/monsters/fly_monster.dart';
import 'package:hit_the_monster/components/monsters/monster.dart';

class MonsterGame extends Game {

  final Random rnd = Random();

  Size currentSize;
  BgComponent bgComponent;
  List<Monster> monsters;

  double tileSize;


  MonsterGame() {
    this._initialyse();
  }

  @override
  void render(Canvas canvas) {
    this.bgComponent.render(canvas);
    this.monsters.forEach((aMonster) => aMonster.render(canvas));
  }

  @override
  void update(double t) {
    this.monsters.forEach((aMonster) => aMonster.update(t));
  }

  @override
  void resize(Size size) {
    this.currentSize = size;
    this.tileSize = size.width/9;
    super.resize(size);
  }

  void spanMonster() {
    double x = this.rnd.nextDouble() * (this.currentSize.width - (tileSize * 3.025));
    double y = this.rnd.nextDouble() * (this.currentSize.height - (tileSize * 3.025));

    this.monsters.add(FlyMonster(game: this, x: x, y: y));
  }

  void _initialyse() async {
    resize(await Flame.util.initialDimensions());
    this.bgComponent = BgComponent(game: this);
    this.monsters = List<Monster>();
    this.spanMonster();
  }
}