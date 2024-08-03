class Player {
  final String name;
  final String symbol;
  int _score = 0;

  Player({required this.name, required this.symbol});

  void increaseScore() {
    _score++;
  }

  String getScore() {
    return _score.toString();
  }

  void resetScore() {
    _score = 0;
  }
}
