class Board {
  List<String> _board = List.filled(9, '', growable: false);
 

  void ClearBoard() {
    _board = List.filled(9, '', growable: false);
  }

  bool insertAtBoard(int index, String symbol) {
    if (_board[index] == '') {
      _board[index] = symbol;
      return true;
    }
    return false;
  }

  String getElementAt(int index) {
    return _board[index];
  }

  List<String> getBoard() {
    return _board;
  }


  Board();
}
