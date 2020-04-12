import 'package:flutter/material.dart';
import 'package:hit_the_monster/monster_game.dart';

class BgComponent {
  final MonsterGame game;

  Rect rect;
  Paint paint;

  BgComponent({ @required this.game }) {
    this.paint = Paint()..color = Color(0xffffffff);
    this.rect = Rect.fromLTWH(0, 0, this.game.currentSize.width, this.game.currentSize.height);
  }

  void render(Canvas c) {
    c.drawRect(this.rect, this.paint);
  }

  void update(double t) {

  }
}