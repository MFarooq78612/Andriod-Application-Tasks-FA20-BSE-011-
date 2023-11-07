// import 'package:flutter/material.dart';

// import 'app.dart';

// void main() {
//   runApp(const RollDice());
// }

import 'dart:math';
import 'package:flutter/material.dart';

final randomizer = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({Key? key}) : super(key: key);

  @override
  State<DiceRoller> createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {
  List<int> diceValues = [1, 2, 3, 4]; // Initial values for each corner
  List<int> totalScores = [0, 0, 0, 0]; // Initial total scores for each dice
  List<int> totalMoves = [0, 0, 0, 0]; // Initial total moves for each dice
  List<String> playerNames = ['Player 1', 'Player 2', 'Player 3', 'Player 4'];
  String winnerMessage = ''; // Winner message
  int currentPlayer = 0; // Current player's index
  int totalMovesCount = 0; // Total moves across all players

  void rollDice(int index) {
    if (index == currentPlayer && totalMoves[index] < 10) {
      setState(() {
        int rolledValue = Random().nextInt(6) + 1;
        diceValues[index] = rolledValue;
        totalScores[index] += rolledValue;
        totalMoves[index]++;
        totalMovesCount++;

        if (totalMovesCount == 40) {
          int winnerIndex = determineWinner();
          winnerMessage = '${playerNames[winnerIndex]} is the Winner!';
        }

        print('Dice value $index = $rolledValue');
      });

      // Move to the next player
      currentPlayer = (currentPlayer + 1) % 4;
    }
  }

  int determineWinner() {
    int maxScore = -1;
    int winnerIndex = -1;

    for (int i = 0; i < 4; i++) {
      if (totalScores[i] > maxScore) {
        maxScore = totalScores[i];
        winnerIndex = i;
      }
    }

    return winnerIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Dice Roller'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildDiceImage(0),
                buildDiceImage(1),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildDiceImage(2),
                buildDiceImage(3),
              ],
            ),
          ),
          SizedBox(height: 10),
          Text(
            winnerMessage,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDiceImage(int index) {
    return Expanded(
      child: Column(
        children: [
          Text(
            playerNames[index],
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          GestureDetector(
            onTap: () => rollDice(index),
            child: Image.asset(
              'assets/images/dice-${diceValues[index]}.png',
              width: 100,
            ),
          ),
          SizedBox(height: 8), // Adjust the spacing
          Text(
            'Score: ${diceValues[index]}',
            style: TextStyle(fontSize: 16),
          ),
          Text(
            'Total Score: ${totalScores[index]}',
            style: TextStyle(fontSize: 16),
          ),
          Text(
            'Total Moves: ${totalMoves[index]}',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
