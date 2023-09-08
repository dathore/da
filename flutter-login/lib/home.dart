import 'dart:math';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

void main() {
  runApp(GomokuGame());
}

class GomokuGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gomoku Game',
      home: GomokuBoard(),
    );
  }
}

class GomokuBoard extends StatefulWidget {
  @override
  _GomokuBoardState createState() => _GomokuBoardState();
}

class _GomokuBoardState extends State<GomokuBoard> {
  late List<List<int>> board;
  late int currentPlayer;
  late bool isGameOver;
  final Logger logger = Logger();
  String winMessage = '';

  @override
  void initState() {
    super.initState();
    // Initialize the board
    board = List.generate(15, (index) => List<int>.filled(15, 0));
    currentPlayer = 1;
    isGameOver = false;
  }

  void makeMove(int row, int col) {
    if (board[row][col] == 0 && !isGameOver) {
      setState(() {
        board[row][col] = currentPlayer;
        checkWinCondition(row, col);
        currentPlayer = currentPlayer == 1 ? 2 : 1;
      });
    }
  }

  void checkWinCondition(int row, int col) {
    // Check for horizontal win
    int count = 1;
    for (int i = col - 1; i >= 0; i--) {
      if (board[row][i] == currentPlayer) {
        count++;
      } else {
        break;
      }
    }
    for (int i = col + 1; i < 15; i++) {
      if (board[row][i] == currentPlayer) {
        count++;
      } else {
        break;
      }
    }
    if (count >= 5) {
      setState(() {
        isGameOver = true;
        winMessage = 'Player $currentPlayer wins horizontally!';
      });

      return;
    }

    // Check for vertical win
    count = 1;
    for (int i = row - 1; i >= 0; i--) {
      if (board[i][col] == currentPlayer) {
        count++;
      } else {
        break;
      }
    }
    for (int i = row + 1; i < 15; i++) {
      if (board[i][col] == currentPlayer) {
        count++;
      } else {
        break;
      }
    }
    if (count >= 5) {
      setState(() {
        isGameOver = true;
      });
      winMessage = 'Player $currentPlayer wins vertically!';
      return;
    }

    // Check for diagonal win (top-left to bottom-right)
    count = 1;
    for (int i = 1; row - i >= 0 && col - i >= 0; i++) {
      if (board[row - i][col - i] == currentPlayer) {
        count++;
      } else {
        break;
      }
    }
    for (int i = 1; row + i < 15 && col + i < 15; i++) {
      if (board[row + i][col + i] == currentPlayer) {
        count++;
      } else {
        break;
      }
    }
    if (count >= 5) {
      setState(() {
        isGameOver = true;
      });
      winMessage =
          'Player $currentPlayer wins diagonally (top-left to bottom-right)!';

      return;
    }

    // Check for diagonal win (top-right to bottom-left)
    count = 1;
    for (int i = 1; row - i >= 0 && col + i < 15; i++) {
      if (board[row - i][col + i] == currentPlayer) {
        count++;
      } else {
        break;
      }
    }
    for (int i = 1; row + i < 15 && col - i >= 0; i++) {
      if (board[row + i][col - i] == currentPlayer) {
        count++;
      } else {
        break;
      }
    }
    if (count >= 5) {
      setState(() {
        isGameOver = true;
      });
      winMessage =
          'Player $currentPlayer wins diagonally (top-right to bottom-left)!';
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gomoku Game'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                'Player $currentPlayer\'s turn',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 16.0),
              LayoutBuilder(
                builder: (context, constraints) {
                  final boardSize = constraints.maxWidth /
                      10; // Assuming 10 cells on each row

                  return GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 100, // Assuming a 10x10 grid
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:
                          10, // Adjust the number of columns as needed
                      childAspectRatio: 1,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      int row =
                          index ~/ 10; // Adjust the number of columns as needed
                      int col =
                          index % 10; // Adjust the number of columns as needed
                      return GestureDetector(
                        onTap: () {
                          makeMove(row, col);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                          ),
                          child: Center(
                            child: board[row][col] == 0
                                ? null
                                : Icon(
                                    board[row][col] == 1
                                        ? Icons.circle
                                        : Icons.close,
                                    size: boardSize *
                                        0.8, // Adjust the size as needed
                                  ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
              SizedBox(height: 16.0),
              if (isGameOver)
                Text(
                  winMessage,
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    // Reset game logic here
                    // Clear the board
                    board =
                        List.generate(15, (index) => List<int>.filled(15, 0));
                    currentPlayer = 1;
                    isGameOver = false;
                  });
                },
                child: Text('Reset'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
