import 'package:flame/flame.dart';
import 'package:flame/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hit_the_monster/monster_game.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Util flameUtil = Util();
  await flameUtil.fullScreen();
  await flameUtil.setOrientation(DeviceOrientation.portraitUp);

  Flame.images.loadAll(
    [
      "monsters/monstre_volant_1.png",
      "monsters/monstre_volant_2.png",
      "monsters/monstre_volant_3.png",
    ]
  );

  MonsterGame game = MonsterGame();

  runApp(game.widget);
}