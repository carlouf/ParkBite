import 'package:flutter/material.dart';
import 'dart:async';

class MemoryMatchGame extends StatefulWidget {
  const MemoryMatchGame({super.key});

  @override
  _MemoryMatchGameState createState() => _MemoryMatchGameState();
}

class _MemoryMatchGameState extends State<MemoryMatchGame> {
  List<String> gameImages = [
    'assets/images/card1.png',
    'assets/images/card2.png',
    'assets/images/card3.png',
    'assets/images/card4.png',
    'assets/images/card5.png',
    'assets/images/card6.png',
    'assets/images/card7.png',
    'assets/images/card8.png',
    'assets/images/card1.png',
    'assets/images/card2.png',
    'assets/images/card3.png',
    'assets/images/card4.png',
    'assets/images/card5.png',
    'assets/images/card6.png',
    'assets/images/card7.png',
    'assets/images/card8.png',
  ];

  late List<bool> cardFlipped;
  late List<String> shownImages;
  int previousIndex = -1;
  bool busy = false;
  int attempts = 0;
  int matches = 0;
  bool gameComplete = false;
  Timer? cooldownTimer;
  bool onCooldown = false;
  int movesLeft = 20; // Total moves allowed

  @override
  void initState() {
    super.initState();
    gameImages.shuffle();
    cardFlipped = List<bool>.filled(gameImages.length, false);
    shownImages = List<String>.filled(gameImages.length, '');
  }

  void onCardTap(int index) {
    if (busy || cardFlipped[index] || gameComplete || onCooldown || movesLeft <= 0) return;

    setState(() {
      shownImages[index] = gameImages[index];
      cardFlipped[index] = true;

      if (previousIndex == -1) {
        previousIndex = index;
      } else {
        attempts++;

        if (gameImages[previousIndex] != gameImages[index]) {
          busy = true;
          Future.delayed(const Duration(seconds: 1), () {
            setState(() {
              shownImages[previousIndex] = '';
              shownImages[index] = '';
              cardFlipped[previousIndex] = false;
              cardFlipped[index] = false;
              previousIndex = -1;
              busy = false;
            });
          });
        } else {
          matches++;
          cardFlipped[previousIndex] = true;
          cardFlipped[index] = true;
          previousIndex = -1;

          if (matches == gameImages.length ~/ 2) {
            gameComplete = true;
            startCooldown();
            // Provide reward here (e.g., points, virtual coins, unlock next level)
            showRewardDialog();
          }
        }

        // Decrease movesLeft only if a pair of cards is flipped
        if (previousIndex != -1) {
          movesLeft--;
        }
      }
    });
  }


  void startCooldown() {
    onCooldown = true;
    cooldownTimer = Timer(const Duration(minutes: 5), () {
      setState(() {
        onCooldown = false;
      });
    });
  }

  void showRewardDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Congratulations!'),
          content: Text('You completed the Memory Match game!\n\nYou earned a reward!'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void showFailureDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Game Over'),
          content: Text('You ran out of moves!'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                restartGame();
              },
              child: Text('Restart'),
            ),
          ],
        );
      },
    );
  }

  void restartGame() {
    setState(() {
      gameComplete = false;
      movesLeft = 20; // Reset moves left
      attempts = 0;
      matches = 0;
      gameImages.shuffle();
      cardFlipped = List<bool>.filled(gameImages.length, false);
      shownImages = List<String>.filled(gameImages.length, '');
    });
  }

  @override
  void dispose() {
    cooldownTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Memory Match Game'),
        actions: [
          if (onCooldown)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Center(
                child: Text(
                  'Cooldown: ${cooldownTimer?.tick ?? 0} mins',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Center(
              child: Text(
                'Moves Left: $movesLeft',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
        ),
        itemCount: gameImages.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => onCardTap(index),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(8.0),
                image: shownImages[index].isNotEmpty
                    ? DecorationImage(
                  image: AssetImage(shownImages[index]),
                  fit: BoxFit.cover,
                )
                    : null,
              ),
              child: shownImages[index].isEmpty
                  ? const Center(
                child: Text(
                  '?',
                  style: TextStyle(
                    fontSize: 32.0,
                    color: Colors.white,
                  ),
                ),
              )
                  : null,
            ),
          );
        },
      ),
    );
  }
}
