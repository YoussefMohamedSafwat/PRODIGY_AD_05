import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tictactoe/models/Player.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

  
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: RichText(
                text: const TextSpan(children: [
              TextSpan(
                  text: "Tic",
                  style: TextStyle(fontSize: 60, color: Colors.redAccent)),
              TextSpan(
                  text: "Tac",
                  style: TextStyle(fontSize: 40, color: Colors.green)),
              TextSpan(
                  text: "Toe",
                  style: TextStyle(fontSize: 60, color: Colors.lightBlue))
            ])),
          ),
          CupertinoButton(
              child: Container(
                width: 300,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(30)),
                child: const Center(
                    child: Text(
                  "Play",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                )),
              ),
              onPressed: () {
                Navigator.pushNamed(context, "player_screen");
              }),
          CupertinoButton(
              child: Container(
                width: 300,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(30)),
                child: const Center(
                    child: Text(
                  "Exit",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                )),
              ),
              onPressed: () {})
        ],
      ),
    );
  }
}
