// ignore_for_file: constant_identifier_names
import 'package:awesome_dialog/awesome_dialog.dart';
import 'dart:async';
import 'dart:math';
import '../widgets/game_over.dart';

import 'package:flutter/material.dart';

class SnakeGame extends StatefulWidget {
  const SnakeGame({super.key});

  @override
  State<SnakeGame> createState() => _SnakeGameState();
}

class _SnakeGameState extends State<SnakeGame> {
  int score = 0;
  bool isGameRunning = false;
  bool isGameOver = false;
  late Timer timer;
  SnakeDirection snakeDirection = SnakeDirection.Down;
  int foodPosition = 200;
  List<int> snakePosition = [];
  void initializeSnake() {
    for (int i = 0; i < 3; i++) {
      snakePosition.add(i);
    }
  }

  void startGame() {
    isGameRunning = true;
    timer = Timer.periodic(
      const Duration(milliseconds: 300),
      (timer) {
        moveSnake();
        gameOver();
      },
    );
  }

  void moveSnake() {
    if (snakeDirection == SnakeDirection.Right) {
      if (snakePosition.last % 15 == 14) {
        snakePosition.add(snakePosition.last + 1 - 15);
      } else {
        snakePosition.add(snakePosition.last + 1);
      }
      // snakePosition.removeAt(0);
    } else if (snakeDirection == SnakeDirection.Left) {
      if (snakePosition.last % 15 == 0) {
        snakePosition.add(snakePosition.last - 1 + 15);
      } else {
        snakePosition.add(snakePosition.last - 1);
      }

      // snakePosition.removeAt(0);
    } else if (snakeDirection == SnakeDirection.Up) {
      if (snakePosition.last < 15) {
        snakePosition.add(snakePosition.last - 15 + 330);
      } else {
        snakePosition.add(snakePosition.last - 15);
      }

      // snakePosition.removeAt(0);
    } else if (snakeDirection == SnakeDirection.Down) {
      if (snakePosition.last > 314) {
        snakePosition.add(snakePosition.last + 15 - 330);
      } else {
        snakePosition.add(snakePosition.last + 15);
      }
    }
    if (snakePosition.last == foodPosition) {
      onEatFood();
    } else {
      snakePosition.removeAt(0);
    }
    setState(() {});
  }

  void onEatFood() {
    score++;
    while (snakePosition.contains(foodPosition)) {
      foodPosition = Random().nextInt(329);
    }
  }

  void gameOver() {
    print("check gameover");
    List<int> duplicateSnakePosition = [];
    duplicateSnakePosition.addAll(snakePosition);
    duplicateSnakePosition.remove(snakePosition.last);
    if (duplicateSnakePosition.contains(snakePosition.last)) {
      print("Game over");
      timer.cancel();
      isGameOver = true;

      setState(() {});
      AwesomeDialog(
        context: context,
        animType: AnimType.scale,
        dialogType: DialogType.error,
        body: const Center(
          child: Text(
            'Game Over!',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        title: "Score $score",
        desc: 'RestartGame',
        btnOkOnPress: () {
          restartGame();
        },
      ).show();
    }
  }

  void restartGame() {
    print("Enter into restart");
    isGameOver = false;
    score = 0;
    snakePosition = [];
    initializeSnake();
    startGame();
  }

  @override
  void initState() {
    super.initState();
    initializeSnake();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: (DragUpdateDetails) {
        if (DragUpdateDetails.delta.dy > 0) {
          snakeDirection = SnakeDirection.Down;
          print("downward");
        } else {
          snakeDirection = SnakeDirection.Up;
          print("upward");
        }
        setState(() {});
      },
      onHorizontalDragUpdate: (DragUpdateDetails) {
        if (DragUpdateDetails.delta.dx > 0) {
          print("right");
          snakeDirection = SnakeDirection.Right;
        } else {
          snakeDirection = SnakeDirection.Left;
          print("left");
        }
        setState(() {});
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: (Color.fromARGB(213, 37, 80, 155)),
          title: const Text("Snack Game"),
        ),
        backgroundColor: Colors.grey.shade300,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(213, 37, 80, 155),
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                  border: Border.all(
                    color: Colors.grey,
                  ),
                ),
                padding: const EdgeInsets.all(8),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 330,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 15,
                    crossAxisSpacing: 1.5,
                    mainAxisSpacing: 1.5,
                  ),
                  itemBuilder: (context, index) {
                    if (index == foodPosition) {
                      return const Food();
                    } else if (snakePosition.contains(index)) {
                      return const Snake();
                    } else {
                      return Box(index: index);
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              isGameRunning
                  ? Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(213, 37, 80, 155),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      height: 50,
                      width: 100,
                      child: Text(
                        "Score $score",
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    )
                  : InkWell(
                      onTap: () {
                        startGame();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(213, 37, 80, 155),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        height: 50,
                        width: 100,
                        child: const Text(
                          "Start",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}

class Box extends StatelessWidget {
  final int index;
  const Box({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(213, 37, 80, 155),
        border: Border.all(
          width: 1,
          color: Colors.grey.shade300,
        ),
        borderRadius: BorderRadius.circular(
          8,
        ),
      ),
    );
  }
}

class Food extends StatelessWidget {
  const Food({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(
          8,
        ),
      ),
    );
  }
}

class Snake extends StatelessWidget {
  const Snake({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(
          8,
        ),
      ),
    );
  }
}

enum SnakeDirection {
  Up,
  Down,
  Right,
  Left,
}
