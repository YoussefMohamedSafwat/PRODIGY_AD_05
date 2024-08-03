import 'package:flutter/material.dart';

class BoardContainer extends StatelessWidget {
  BoardContainer({super.key, this.symbol = ""});

  String? symbol;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration:
          BoxDecoration(border: Border.all(color: Colors.black, width: 3.0)),
      child: Center(
          child: Text(
        symbol!,
        style: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
          color: symbol == "x" ? Colors.blue : Colors.orange,
        ),
      )),
    );
  }
}
