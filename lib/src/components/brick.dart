import 'package:audioplayers/audioplayers.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import '../brick_breaker.dart';
import '../config.dart';
import 'ball.dart';
import 'bat.dart';

class Brick extends RectangleComponent
with CollisionCallbacks, HasGameReference<BrickBreaker> {
  int resistence = 2;
  Brick({required super.position, required Color color,required this.resistence})
  : super(
    size: Vector2(brickWidth, brickHeight),
    anchor: Anchor.center,
    paint: Paint()
    ..color = color
    ..style = PaintingStyle.fill,
    children: [RectangleHitbox()],
  );
  final player = AudioPlayer();

  @override
  void onCollisionStart(
  Set<Vector2> intersectionPoints, PositionComponent other) {
    this.resistence -=1;
    paint.color = darkenColor(paint.color,0.15);
    super.onCollisionStart(intersectionPoints, other);
    if(this.resistence == 0){
      game.world.children.query<Ball>().first.paint.color = paint.color;
      playSound();
      removeFromParent();
      game.score.value++;
      if (game.world.children.query<Brick>().length == 1) {
        game.playState = PlayState.won; // Add this line
        game.world.removeAll(game.world.children.query<Ball>());
        game.world.removeAll(game.world.children.query<Bat>());
      }
      if((game.world.children.query<Brick>().length - 1)%5 == 0){
        game.world.children.query<Bat>().first.size *=0.90;
      }
    }else{
      playBrickSound();
    }
  }
  Color darkenColor(Color color, double factor) {
    final hslColor = HSLColor.fromColor(color);
    final newLightness = (hslColor.lightness * (1 - factor)).clamp(0.0, 1.0);
    return hslColor.withLightness(newLightness).toColor();
  }
  void playSound() async {
    await player.play(AssetSource('sounds/brickBroke.mp3'));
  }
  void playBrickSound() async {
    await player.play(AssetSource('sounds/ballHit.mp3'));
  }
}