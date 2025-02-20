import 'package:flutter/material.dart'; 

const brickColors = [ 
Color(0xffa7c957), // Verde oliva claro
Color(0xff6a994e), // Verde hierba
Color(0xff4f772d), // Verde musgo
Color(0xff3a5a40), // Verde bosque oscuro
Color(0xff31572c), // Verde pino
Color(0xff86a873), // Verde salvia
Color(0xffadc178), // Verde seco
Color(0xff52796f), // Verde grisáceo
Color(0xff354f52), // Verde oscuro azulado
Color(0xff2f3e46), // Verde petróleo
];

const gameWidth = 820.0;
const gameHeight = 1600.0;
const ballRadius = gameWidth * 0.02;
const batWidth = gameWidth * 0.2;
const batHeight = ballRadius * 2;
const batStep = gameWidth * 0.05;
const brickGutter = gameWidth * 0.015;
final brickWidth = (gameWidth - (brickGutter * (brickColors.length + 1)))/ brickColors.length;
const brickHeight = gameHeight * 0.03;
const difficultyModifier = 1.03;