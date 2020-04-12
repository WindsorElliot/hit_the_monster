import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';
import 'package:hit_the_monster/components/monsters/monster.dart';
import 'package:hit_the_monster/monster_game.dart';

class FlyMonster extends Monster {

  FlyMonster({ MonsterGame game, double x, double y }) : super(game: game) {
    super.rect = Rect.fromLTWH(x, y,  game.tileSize * 2.025, game.tileSize * 2.025);

    super.sprites.add(Sprite("monsters/monstre_volant_1.png"));
    super.sprites.add(Sprite("monsters/monstre_volant_2.png"));
    super.sprites.add(Sprite("monsters/monstre_volant_3.png"));

    // @override
    // double get speed => this.game.tileSize * 5;
  }
}