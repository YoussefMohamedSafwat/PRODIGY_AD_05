import 'package:tictactoe/models/Player.dart';
import 'package:tictactoe/models/board.dart';

class GameManager {
  final List<Player> players;
  int _turn = 0;
  int _moves = 0;

  GameManager({required this.players});

  Player get_turn() {
    int temp = _turn;
    _turn = (_turn - 1).abs();
    _moves++;
    return players[temp];
  }

  bool checkHorizontal(List<String> board) {
    for (int index = 0; index < 9; index += 3) {
      if ((board[index] == board[index + 1]) &&
          (board[index] == board[index + 2]) &&
          board[index] != '') {
        return true;
      }
    }
    return false;
  }

  bool checkDiag(List<String> board) {
    if ((board[0] == board[4] && board[4] == board[8] && board[0] != '') ||
        (board[2] == board[4] && board[4] == board[6] && board[2] != '')) {
      return true;
    }
    return false;
  }

  bool checkVer(List<String> board) {
    for (int index = 0; index < 3; index++) {
      if (board[index] == board[index + 3] &&
          board[index + 3] == board[index + 6] &&
          board[index] != '') {
        return true;
      }
    }
    return false;
  }

  bool is_winner(List<String> board) {
    if (checkHorizontal(board) || checkDiag(board) || checkVer(board)) {
      return true;
    }
    return false;
  }

  bool is_draw() {
    return _moves == 9;
  }

  bool game_over(List<String> board) {
    return is_winner(board) || is_draw();
  }
}
