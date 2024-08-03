import 'package:flutter/material.dart';
import 'package:tictactoe/Screens/Game/game_screen.dart';
import 'package:tictactoe/Screens/Home/home_screen.dart';
import 'package:tictactoe/Screens/Player/player_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'tic tac toe game',
      routes: {
        "/": (context) => const HomeScreen(),
        "game_screen": (context) => const GameScreen(),
        "player_screen": (context) => const PlayerScreen()
      },
    );
  }
}
