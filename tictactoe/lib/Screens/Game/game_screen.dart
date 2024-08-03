import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tictactoe/Screens/Game/widgets/board_container.dart';
import 'package:tictactoe/models/Player.dart';
import 'package:tictactoe/models/board.dart';
import 'package:tictactoe/models/game_manager.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  var player1;
  var player2;
  var currentPlayer;
  var board;
  var gm;

  void didChangeDependencies() {
    super.didChangeDependencies();

    if (ModalRoute.of(context)!.settings.arguments != null) {
      var args = ModalRoute.of(context)!.settings.arguments as Map;

      player1 = args["player1"];
      player2 = args["player2"];

      board = Board();
      gm = GameManager(players: [player1, player2]);
      currentPlayer = gm.get_turn();
    }
  }

  void updateBoard(int index, String symbol) {
    setState(() {
      if (board.insertAtBoard(index, symbol)) {
        if (gm.game_over(board.getBoard())) {
          String message;

          if (gm.is_draw()) {
            message = "game is Draw";
          } else {
            message = "Player ${currentPlayer.name} wins";
            currentPlayer.increaseScore();
          }

          showDialog(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                    title: Text(
                      message,
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    content: const Text(
                      "Do you want to play again ?",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pushReplacementNamed(
                                context, "game_screen", arguments: {
                              "player1": player1,
                              "player2": player2
                            });
                          },
                          child: const Text("Yes")),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("No"))
                    ],
                  ));
        } else {
          currentPlayer = gm.get_turn();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pushNamed(context, "/"),
            icon: const Icon(Icons.home)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "Score: ${(player1.getScore())} - ${(player2.getScore())}",
              style: const TextStyle(fontSize: 35),
            ),
          ),
          Text(
            "Player : ${currentPlayer.name} turn",
            style: const TextStyle(fontSize: 30),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: AspectRatio(
                aspectRatio: 1,
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, // Number of columns
                      childAspectRatio:
                          1.0, // Aspect ratio to make cells square
                      crossAxisSpacing: 5.0, // Horizontal spacing between cells
                      mainAxisSpacing: 5.0, // Vertical spacing between cells
                    ),
                    padding: const EdgeInsets.all(10),
                    itemCount: 9,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            updateBoard(index, currentPlayer.symbol);
                          },
                          child: BoardContainer(
                              symbol: board.getElementAt(index)));
                    }),
              ),
            ),
          ),
          CupertinoButton(
              child: Container(
                width: 300,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(30)),
                child: const Center(
                    child: Text(
                  "reset",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                )),
              ),
              onPressed: () {
                setState(() {
                  player1.resetScore();
                  player2.resetScore();
                  Navigator.pushReplacementNamed(context, "game_screen",
                      arguments: {"player1": player1, "player2": player2});
                });
              }),
        ],
      ),
    );
  }
}
