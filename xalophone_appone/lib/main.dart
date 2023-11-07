import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MyXylophoneApp());
}

class MyXylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: XylophoneScreen(),
    );
  }
}

class XylophoneScreen extends StatefulWidget {
  @override
  _XylophoneScreenState createState() => _XylophoneScreenState();
}

class _XylophoneScreenState extends State<XylophoneScreen> {
  int _numberOfButtons = 7;
  List<Color> _buttonColors = List.generate(7, (index) => Colors.green);
  List<Widget> _buttons = [];
  List<String> _soundPaths = [
    'assets/note1.wav',
    'assets/note2.wav',
    'assets/note3.wav',
    'assets/note4.wav',
    'assets/note5.wav',
    'assets/note6.wav',
    'assets/note7.wav',
  ];

  void playSound(int number) {
    final player = AudioPlayer();
    player.play(_soundPaths[number - 1]);
  }

  DropdownMenuItem<int> buildAudioItem(int audioNumber) {
    return DropdownMenuItem(
      value: audioNumber,
      child: Text('Audio $audioNumber'),
    );
  }

  DropdownMenuItem<Color> buildColorItem(Color color) {
    return DropdownMenuItem(
      value: color,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
        width: 24.0,
        height: 24.0,
      ),
    );
  }

  Widget createButton(int number, Color color, int index) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          children: [
            // Left Dropdown for Audio Selection
            Container(
              width: 80.0, // Adjust the width as needed
              child: DropdownButton<int>(
                value: number,
                onChanged: (value) {
                  setState(() {
                    playSound(value!);
                  });
                },
                items: List.generate(_numberOfButtons, (i) {
                  return buildAudioItem(i + 1);
                }),
              ),
            ),
            SizedBox(width: 8.0),
            // Main Button
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _buttonColors[index] = Colors.red; // Change to your desired color
                  });
                  playSound(number);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: color,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      width: 20.0,
                      height: 24.0,
                      child: Center(
                        child: Text(
                          '$number',
                          style: TextStyle(
                            color: color,
                            fontWeight: FontWeight.bold,
                            fontSize: 12.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      'Audio $number',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 10.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 8.0),
            // Right Dropdown for Color Selection
            Container(
              width: 60.0,
              child: DropdownButton<Color>(
                value: _buttonColors[index],
                onChanged: (value) {
                  setState(() {
                    _buttonColors[index] = value!;
                    updateButtons();
                  });
                },
                items: Colors.primaries.map((color) {
                  return buildColorItem(color);
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void updateButtons() {
    _buttons.clear();
    for (int i = 0; i < _numberOfButtons; i++) {
      _buttons.add(createButton(i + 1, _buttonColors[i], i));
    }
  }

  List<Widget> generateButtons() {
    if (_buttons.isEmpty) {
      updateButtons();
    }

    return [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0), // Adjust padding as needed
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: _buttons,
          ),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Xylophone App"),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF3B1111), Color(0xFF511414)],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: generateButtons(),
        ),
      ),
    );
  }
}
