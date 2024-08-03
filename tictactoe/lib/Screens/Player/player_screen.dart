import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tictactoe/models/Player.dart';

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({super.key});

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  var player1Controller = TextEditingController();
  var player2Controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              "Enter your names",
              style: TextStyle(fontSize: 30),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
                width: 400,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(15)),
                child: TextField(
                  controller: player1Controller,
                  decoration: const InputDecoration(
                      label: Text(
                        "Player 1 name",
                        style: TextStyle(color: Colors.white),
                      ),
                      contentPadding: EdgeInsets.all(8),
                      labelStyle: TextStyle(color: Colors.black, fontSize: 25)),
                )),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
                width: 400,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(15)),
                child: TextField(
                  controller: player2Controller,
                  decoration: const InputDecoration(
                      label: Text(
                        "Player 2 name",
                        style: TextStyle(color: Colors.white),
                      ),
                      contentPadding: EdgeInsets.all(8),
                      labelStyle: TextStyle(color: Colors.black, fontSize: 25)),
                )),
          ),
          const SizedBox(
            height: 20,
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
                  "Start",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                )),
              ),
              onPressed: () {
                if (player1Controller.text.isEmpty ||
                    player2Controller.text.isEmpty) {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                            content: const Text(
                              "Please enter your names ",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text("Ok")),
                            ],
                          ));
                } else {
                  Navigator.pushNamed(context, "game_screen", arguments: {
                    "player1":
                        Player(name: player1Controller.text, symbol: 'x'),
                    "player2":
                        Player(name: player2Controller.text, symbol: 'o'),
                  });
                }
              })
        ],
      ),
    );
  }
}
