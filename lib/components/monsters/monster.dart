import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';
import 'package:hit_the_monster/monster_game.dart';

class Monster {
  final MonsterGame game;

  List<Sprite> sprites = List<Sprite>();
  Rect rect;

  double monsterSpriteIndex = 0;
  Offset targetLocation;

  Monster({ @required this.game }) {
    this.setTargetLocation();
  }

  void render(Canvas c) {
    this.sprites[this.monsterSpriteIndex.toInt()].renderRect(c, this.rect);
  }

  void update(double t) {
    this.monsterSpriteIndex += (10 * t);
    if (this.monsterSpriteIndex >= 3) {
      this.monsterSpriteIndex -= 3;
    }
    double stepDistance = this.speed * t;
    Offset toTarget = this.targetLocation - Offset(this.rect.left, this.rect.top);
    if (stepDistance < toTarget.distance) {
      Offset stepToTarget = Offset.fromDirection(toTarget.direction, stepDistance);
      this.rect = this.rect.shift(stepToTarget);
    }
    else {
      this.rect = this.rect.shift(toTarget);
      this.setTargetLocation();
    }
  }

  void inTapDown(TapDownDetails d) {

  }

  void setTargetLocation() {
    double x = this.game.rnd.nextDouble() * (this.game.currentSize.width - (this.game.tileSize * 2.025));
    double y = this.game.rnd.nextDouble() * (this.game.currentSize.height - (this.game.tileSize * 2.025));
    this.targetLocation = Offset(x, y);
  }

  double get speed => this.game.tileSize * 5;
}