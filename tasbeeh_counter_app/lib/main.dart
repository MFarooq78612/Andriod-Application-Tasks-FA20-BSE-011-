// main.dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tasbih Counter App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('dark.jpg'), // Replace with your background image path
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: Colors.transparent, // Set the color to transparent
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 40, 8, 16), // Add padding from top
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Tasbih Counter',
                    style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Azkar with the Dhikr Counter',
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: 16),
                  buildCard(
                    context,
                    centerText: 'Allhamdulilah',
                    rightText: 'Count: 0/33 (0)\nTotal Count: 0',
                  ),
                  const SizedBox(height: 8),
                  buildCard(
                    context,
                    centerText: 'Astaghfirullah',
                    rightText: 'Count: 0/33 (0)\nTotal Count: 0',
                  ),
                  const SizedBox(height: 8),
                  buildCard(
                    context,
                    centerText: 'Allahuakber',
                    rightText: 'Count: 0/33 (0)\nTotal Count: 0',
                  ),
                  const SizedBox(height: 8),
                  buildCard(
                    context,
                    centerText: 'Bismillah',
                    rightText: 'Count: 0/33 (0)\nTotal Count: 0',
                  ),
                  const SizedBox(height: 8),
                  buildCard(
                    context,
                    centerText: 'La Illah Illalah',
                    rightText: 'Count: 0/33 (0)\nTotal Count: 0',
                  ),
                  const SizedBox(height: 8),
                  buildCard(
                    context,
                    centerText: 'Darood e Pak',
                    rightText: 'Count: 0/33 (0)\nTotal Count: 0',
                  ),
                  const SizedBox(height: 8),
                  buildCard(
                    context,
                    centerText: 'Ayat e Karima',
                    rightText: 'Count: 0/33 (0)\nTotal Count: 0',
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCard(BuildContext context, {required String centerText, required String rightText}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CounterPage(selectedTasbeeh: centerText),
            ),
          );
        },
        child: Card(
          color: Colors.white70,
          child: SizedBox(
            height: 40,
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Icon(Icons.more_vert, size: 24),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      centerText,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Text(
                    rightText,
                    textAlign: TextAlign.right,
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



class CounterPage extends StatefulWidget {
  String selectedTasbeeh;

  CounterPage({Key? key, required this.selectedTasbeeh}) : super(key: key);

  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int currentSet = 0;
  int currentCount = 0;
  int totalCount = 0;

  void incrementCounter() {
    setState(() {
      currentCount++;
      totalCount++;
      if (currentCount == 34) {
        currentSet++;
        currentCount = 0;
      }
    });
  }

  void refreshCounter() {
    setState(() {
      currentSet = 0;
      currentCount = 0;
      totalCount = 0;
    });
    print('Refresh button pressed');
  }

  void navigateToTasbeehDetailsPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CreateTasbeehPage(
          selectedTasbeeh: widget.selectedTasbeeh,
          onTasbeehAdded: (String tasbeehName, int totalCount) {
            setState(() {
              widget.selectedTasbeeh = tasbeehName;
              this.totalCount = totalCount;
            });
          },
        ),
      ),
    );
  }

  void navigateToSettingsPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AppSettingsPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'Tasbih Counter',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          backgroundColor: Colors.blueGrey,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.refresh, color: Colors.white),
              onPressed: refreshCounter,
            ),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.settings, color: Colors.white),
                  onPressed: navigateToSettingsPage,
                ),
                IconButton(
                  icon: Icon(Icons.arrow_forward, color: Colors.white),
                  onPressed: navigateToTasbeehDetailsPage,
                ),
              ],
            ),
          ],
        ),
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('dark.jpg'), // Change this to your background image path
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              color: Colors.transparent,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Selected Tasbeeh:  ${widget.selectedTasbeeh}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Sets Completed: $currentSet',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: incrementCounter,
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: currentCount == 33 ? Colors.white : Colors.white,
                          border: Border.all(
                            color: Colors.blue,
                            width: 5.0,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            '$currentCount',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 40,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Cumulative Count: $totalCount',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class CreateTasbeehPage extends StatelessWidget {
  final TextEditingController _tasbeehNameController = TextEditingController();
  final TextEditingController _totalCountsController = TextEditingController();
  final Function(String tasbeehName, int totalCount) onTasbeehAdded;
  final String selectedTasbeeh;

  CreateTasbeehPage({
    Key? key,
    required this.selectedTasbeeh,
    required this.onTasbeehAdded,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Create Tasbeeh',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('mosque.jpg'), // Replace with your background image path
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Card(
                margin: EdgeInsets.all(14),
                child: Padding(
                  padding: EdgeInsets.all(14),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildTextFieldWithTitle(
                        title: 'Enter Tasbeeh/Zikr Name',
                        controller: _tasbeehNameController,
                        placeholder: 'Name',
                      ),
                      SizedBox(height: 14),
                      _buildTextFieldWithTitle(
                        title: 'Enter total counts',
                        controller: _totalCountsController,
                        placeholder: '33',
                      ),
                      SizedBox(height: 14),
                      ElevatedButton(
                        onPressed: () {
                          String tasbeehName = _tasbeehNameController.text;
                          int totalCount = int.tryParse(_totalCountsController.text) ?? 0;

                          onTasbeehAdded(tasbeehName, totalCount);

                          Navigator.pop(context); // Close the create Tasbeeh page
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueGrey,
                        ),
                        child: Text(
                          'Add Tasbeeh',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextFieldWithTitle({
    required String title,
    required TextEditingController controller,
    required String placeholder,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 6),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: placeholder,
          ),
        ),
      ],
    );
  }
}


class AppSettingsPage extends StatefulWidget {
  @override
  _AppSettingsPageState createState() => _AppSettingsPageState();
}

class _AppSettingsPageState extends State<AppSettingsPage> {
  bool isVibrationEnabled = true;
  bool isSoundEnabled = true;
  Color selectedColor = Colors.blueGrey; // Default color
  TextEditingController countMaxController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hide debug banner
      theme: ThemeData(
        primaryColor: selectedColor,
        hintColor: selectedColor,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'App Settings',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: selectedColor,
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.white),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context); // Navigate back to the previous screen
            },
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("dark.jpg"), // Replace with your image
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Card(
                  elevation: 4,
                  child: buildSettingRow(
                    'Vibration',
                    Icons.vibration,
                    isVibrationEnabled,
                        (value) {
                      setState(() {
                        isVibrationEnabled = value;
                      });
                    },
                  ),
                ),
                SizedBox(height: 8),
                Card(
                  elevation: 4,
                  child: buildSettingRow(
                    'Sound',
                    Icons.volume_up,
                    isSoundEnabled,
                        (value) {
                      setState(() {
                        isSoundEnabled = value;
                      });
                    },
                  ),
                ),
                SizedBox(height: 8),
                Card(
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8, horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Count Max',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.blue,
                          ),
                        ),
                        Container(
                          width: 150, // Adjust the width as needed
                          child: TextField(
                            controller: countMaxController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Enter Count Max',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    'Themes',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Colors.blue,
                    ),
                  ),
                ),
                SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ColoredCircle(
                      color: Colors.red,
                      onTap: () => changeColor(Colors.red),
                    ),
                    ColoredCircle(
                      color: Colors.green,
                      onTap: () => changeColor(Colors.green),
                    ),
                    ColoredCircle(
                      color: Colors.blue,
                      onTap: () => changeColor(Colors.blue),
                    ),
                    ColoredCircle(
                      color: Colors.yellow,
                      onTap: () => changeColor(Colors.yellow),
                    ),
                    ColoredCircle(
                      color: Colors.orange,
                      onTap: () => changeColor(Colors.orange),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SmallCircle(color: Colors.pink),
                    SmallCircle(color: Colors.black),
                    SmallCircle(color: Colors.blueGrey),
                    SmallCircle(color: Colors.lightGreen),
                    SmallCircle(color: Colors.lightBlueAccent),
                  ],
                ),
                SizedBox(height: 16),
                Center(
                  child: Text(
                    '< Images Background >',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
                // Vibration Card
                Card(
                  elevation: 4,
                  child: buildSettingRow(
                    'Vibration',
                    Icons.vibration,
                    isVibrationEnabled,
                        (value) {
                      setState(() {
                        isVibrationEnabled = value;
                      });
                    },
                  ),
                ),
                SizedBox(height: 16),
                // Reset All Settings Button
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // Add logic to reset all settings
                      setState(() {
                        isVibrationEnabled = true;
                        isSoundEnabled = true;
                        countMaxController.clear(); // Clear the text field
                        // Add any other settings that need to be reset
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text('Reset All Settings'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSettingRow(String title, IconData icon, bool value,
      ValueChanged<bool> onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon),
              SizedBox(width: 16),
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
          Switch(
            value: value,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }

  void changeColor(Color color) {
    setState(() {
      selectedColor = color;
    });
  }
}

class ColoredCircle extends StatelessWidget {
  final Color color;
  final VoidCallback onTap;

  const ColoredCircle({
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 30,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
      ),
    );
  }
}

class SmallCircle extends StatelessWidget {
  final Color color;

  const SmallCircle({required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}
