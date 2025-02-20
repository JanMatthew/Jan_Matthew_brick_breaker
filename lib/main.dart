import 'package:brick_breaker/src/widgets/game_app.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';

import 'src/brick_breaker.dart';

void main() {
  runApp(const GameApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
