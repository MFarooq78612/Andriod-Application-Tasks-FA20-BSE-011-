import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'package:file_picker/file_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trading App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: WelcomePage(),
    );
  }
}

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink, // Pink navigation bar
        title: Text('My App'), // Welcome in My App navbar center
        centerTitle: true,
      ),
      body: Container(
        color: Colors.black87, // Black background
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Welcome in Trading App text
              Text(
                'Welcome to Trading App',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24, // Increased font size
                ),
              ),
              SizedBox(height: 20), // Adding space between text and button
              // Next arrow button with increased size and pink color
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChoicesPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(), backgroundColor: Colors.pink,
                  padding: EdgeInsets.all(20), // Pink button color
                ),
                child: Icon(
                  Icons.arrow_forward,
                  size: 40, // Increased arrow size
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class ChoicesPage extends StatelessWidget {
  const ChoicesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink, // Navbar color set to pink
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Center(child: Text('Trading App')),
        actions: [
        ],
      ),
      body: Container(
        color: Colors.black87, // Background color set to black87
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  // Navigate to Admin Login Page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TradingAppPage(),
                    ),
                  );
                },
                child: Container(
                  width: 150,
                  height: 170,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.pink, // First card color changed to pink
                    border: Border.all(
                      color: Colors.amber,
                      width: 2,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const CircleAvatar(
                        radius: 38,
                        backgroundImage: NetworkImage(
                            'https://media.licdn.com/dms/image/C4E03AQGO448nAOrvfw/profile-displayphoto-shrink_400_400/0/1516929476300?e=2147483647&v=beta&t=i9xTbCh2nx3upQEx53PPtGP28Da2T7i_AJOTsqQRliE'),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Admin',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: () {
                  // Navigate to Learner Login Page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UsersPage(),
                    ),
                  );
                },
                child: Container(
                  width: 150,
                  height: 170,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.pink, // Second card color changed to pink
                    border: Border.all(
                      color: Colors.amber,
                      width: 2,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const CircleAvatar(
                        radius: 38,
                        backgroundImage: NetworkImage(
                            'https://media.licdn.com/dms/image/C4E03AQGO448nAOrvfw/profile-displayphoto-shrink_400_400/0/1516929476300?e=2147483647&v=beta&t=i9xTbCh2nx3upQEx53PPtGP28Da2T7i_AJOTsqQRliE'),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Users',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class UsersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink, // Navbar color set to pink
        title: Text('User Details'), // Title of the page
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        color: Colors.black87, // Background color set to black87
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AccessWithoutAccountPage(), // Replace with your desired page for "Access Without Account"
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink, // Button color set to pink
                ),
                child: Text(
                  'Access Without Account',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AccessWithAccountPage(), // Replace with your desired page for "Access With Account"
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.pink, // Button color set to pink
                ),
                child: Text(
                  'Access With Account',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class AccessWithoutAccountPage extends StatefulWidget {
  @override
  _AccessWithoutAccountPageState createState() => _AccessWithoutAccountPageState();
}

class _AccessWithoutAccountPageState extends State<AccessWithoutAccountPage> {
  TextEditingController buyController = TextEditingController();
  TextEditingController sellController = TextEditingController();
  TextEditingController feesController = TextEditingController();
  double profit = 0.0;

  String selectedMenuItem = '';

  void calculateProfit() {
    double buyingPrice = double.tryParse(buyController.text) ?? 0.0;
    double sellingPrice = double.tryParse(sellController.text) ?? 0.0;
    double fees = double.tryParse(feesController.text) ?? 0.0;

    setState(() {
      profit = ((sellingPrice - buyingPrice) - fees);
      selectedMenuItem = 'Profit: \$ $profit';
    });
  }

  void displayCurrentPrice() {
    setState(() {
      selectedMenuItem = 'Current Price: \$12000';
    });
  }

  void showAvailableMarkets() {
    String marketURL = 'https://accounts.binance.com';
    launchURL(marketURL);
  }

  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text('Access Without Account'),
        centerTitle: true,
        actions: [
          PopupMenuButton<String>(
            icon: Icon(Icons.more_vert, color: Colors.white), // Dropdown icon color
            color: Colors.pink,
            onSelected: (String value) {
              setState(() {
                selectedMenuItem = '';
              });
              if (value == 'currentPrice') {
                displayCurrentPrice();
              } else if (value == 'availableMarkets') {
                showAvailableMarkets();
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              PopupMenuItem<String>(
                value: 'currentPrice',
                child: Text(
                  'Display Current Price of the Coin',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              PopupMenuItem<String>(
                value: 'availableMarkets',
                child: Text(
                  'Available Markets',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.black87,
          padding: EdgeInsets.all(100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Text(
                'Profits of Investment',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: buyController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Buying Price',
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.pink),
                  ),
                ),
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: sellController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Selling Price',
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.pink),
                  ),
                ),
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: feesController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Investment Fees',
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.pink),
                  ),
                ),
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  calculateProfit();
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.pink,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                ),
                child: Text('Calculate Profit', style: TextStyle(fontSize: 18)),
              ),
              SizedBox(height: 20),
              Text(
                selectedMenuItem,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}


class AccessWithAccountPage extends StatefulWidget {
  @override
  _AccessWithAccountPageState createState() => _AccessWithAccountPageState();
}

class _AccessWithAccountPageState extends State<AccessWithAccountPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _usernameFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();

  bool isUsernameFocused = false;
  bool isPasswordFocused = false;

  @override
  void initState() {
    super.initState();
    _usernameController.addListener(updateBorderColor);
    _passwordController.addListener(updateBorderColor);
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _usernameFocus.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }

  void updateBorderColor() {
    setState(() {
      isUsernameFocused = _usernameFocus.hasFocus || _usernameController.text.isNotEmpty;
      isPasswordFocused = _passwordFocus.hasFocus || _passwordController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text('Login'),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.black87,
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _usernameController,
                focusNode: _usernameFocus,
                style: TextStyle(color: isUsernameFocused ? Colors.white : Colors.pink),
                decoration: InputDecoration(
                  labelText: 'Username or Email',
                  labelStyle: TextStyle(color: Colors.white),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.pink),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: isUsernameFocused ? Colors.pink : Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _passwordController,
                focusNode: _passwordFocus,
                obscureText: true,
                style: TextStyle(color: isPasswordFocused ? Colors.white : Colors.pink),
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.white),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.pink),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: isPasswordFocused ? Colors.pink : Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UserMainPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.pink,
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text('Login', style: TextStyle(fontSize: 18)),
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignupPage()),
                  );
                },
                child: Text(
                  'Don\'t have an account? Sign up',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



class UserMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text('User Details Page'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.black87,
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildCardRow([
                CardButton(
                  buttonText: 'Track Real-time Price',
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CoinMarketPage()));
                  },
                ),
                CardButton(
                  buttonText: 'Access News by Admin',
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PostPage()));
                  },
                ),
              ]),
              SizedBox(height: 20),
              buildCardRow([
                CardButton(
                  buttonText: 'View Video in App',
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PostPage()));
                  },
                ),
                CardButton(
                  buttonText: 'Download Admin File',
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ShareFilePage()));
                  },
                ),
              ]),
              SizedBox(height: 20),
              buildCardRow([
                CardButton(
                  buttonText: 'Share Shared Picture',
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ShareFilePage()));
                  },
                ),
                CardButton(
                  buttonText: 'Like the Admin Post',
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PostPage()));
                  },
                ),
              ]),
              SizedBox(height: 20),
              buildCardRow([
                CardButton(
                  buttonText: 'Dislike the Admin Post',
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PostPage()));
                  },
                ),
                CardButton(
                  buttonText: 'Give Feedback',
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PostPage()));
                  },
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCardRow(List<Widget> children) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: children,
    );
  }
}

class CardButton extends StatelessWidget {
  final String buttonText;
  final Function onPressed;

  const CardButton({
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.pink,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: InkWell(
        onTap: () {
          onPressed();
        },
        borderRadius: BorderRadius.circular(15.0),
        child: Container(
          height: 150, // Adjust the height of the cards
          width: MediaQuery.of(context).size.width * 0.3, // Adjust the width of the cards
          padding: EdgeInsets.all(16),
          child: Center(
            child: Text(
              buttonText,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _usernameFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();

  bool isUsernameFocused = false;
  bool isEmailFocused = false;
  bool isPasswordFocused = false;

  @override
  void initState() {
    super.initState();
    _usernameController.addListener(updateBorderColor);
    _emailController.addListener(updateBorderColor);
    _passwordController.addListener(updateBorderColor);
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _usernameFocus.dispose();
    _emailFocus.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }

  void updateBorderColor() {
    setState(() {
      isUsernameFocused = _usernameFocus.hasFocus || _usernameController.text.isNotEmpty;
      isEmailFocused = _emailFocus.hasFocus || _emailController.text.isNotEmpty;
      isPasswordFocused = _passwordFocus.hasFocus || _passwordController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text('Sign Up'),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.black87,
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _usernameController,
                focusNode: _usernameFocus,
                style: TextStyle(color: isUsernameFocused ? Colors.white : Colors.black),
                decoration: InputDecoration(
                  labelText: 'Username',
                  labelStyle: TextStyle(color: Colors.white),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.pink),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: isUsernameFocused ? Colors.pink : Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _emailController,
                focusNode: _emailFocus,
                style: TextStyle(color: isEmailFocused ? Colors.white : Colors.black),
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.white),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.pink),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: isEmailFocused ? Colors.pink : Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _passwordController,
                focusNode: _passwordFocus,
                obscureText: true,
                style: TextStyle(color: isPasswordFocused ? Colors.white : Colors.black),
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.white),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.pink),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: isPasswordFocused ? Colors.pink : Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.pink,
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text('Sign Up', style: TextStyle(fontSize: 18)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class TradingAppPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Center(child: Text('Trading App')),
        actions: [

        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.black87,
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top + 120,
            left: 20,
            right: 20,
            bottom: 100,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Center(
                child: Text(
                  'Admin',
                  style: TextStyle(color: Colors.white, fontSize: 32),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Navigate to the desired page
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PostPage()),
                        );
                      },
                      child: const CardItem(text: 'Admin Posts', color: Colors.pink),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigate to the Admin Voice Message page
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AdminVoiceMessagePage()),
                        );
                      },
                      child: const CardItem(text: 'Admin Voice Message', color: Colors.pink),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigate to the Share file page
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ShareFilePage()),
                        );
                      },
                      child: const CardItem(text: 'Share file', color: Colors.pink),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigate to the Coin Market page
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CoinMarketPage()),
                        );
                      },
                      child: const CardItem(text: 'Coin Market', color: Colors.pink),
                    ),
                    // Add more GestureDetector widgets for other pages...
                  ],
                ),
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
class CardItem extends StatelessWidget {
  final String text;
  final Color color;

  const CardItem({required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        leading: const Icon(Icons.arrow_right, color: Colors.white),
        title: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}


class AdminVoiceMessagePage extends StatefulWidget {
  @override
  _AdminVoiceMessagePageState createState() => _AdminVoiceMessagePageState();
}

class _AdminVoiceMessagePageState extends State<AdminVoiceMessagePage> {
  late bool _isRecording;
  late Timer _timer;
  int _start = 0;
  int _recordingIndex = 1;
  List<String> _recordings = [];

  @override
  void initState() {
    super.initState();
    _isRecording = false;
  }

  void _startRecording() {
    setState(() {
      _isRecording = true;
      _start = 0; // Reset start time when starting recording
      _startTimer();
    });
  }

  void _stopRecording() {
    setState(() {
      _isRecording = false;
      _stopTimer();
      _saveRecording();
    });
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _start++;
      });
    });
  }

  void _stopTimer() {
    _timer.cancel();
  }

  void _saveRecording() {
    String recordingName = 'Recording$_recordingIndex';
    _recordings.add('$recordingName: $_start seconds');
    _recordingIndex++;
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel timer on dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text(
          'Admin Voice Message',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        color: Colors.black87,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$_start seconds',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: _recordings.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        _recordings[index],
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              if (!_isRecording)
                ElevatedButton(
                  onPressed: _startRecording,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32), // Adjust padding for larger button
                    child: Text(
                      'Start Recording',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                  ),
                )
              else
                ElevatedButton(
                  onPressed: _stopRecording,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32), // Adjust padding for larger button
                    child: Text(
                      'Stop Recording',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red, // Use a different color for stop
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}


class ShareFilePage extends StatefulWidget {
  @override
  _ShareFilePageState createState() => _ShareFilePageState();
}

class _ShareFilePageState extends State<ShareFilePage> {
  File? _selectedFile;
  TextEditingController _fileUrlController = TextEditingController();

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        _selectedFile = File(result.files.single.path!);
      });
    }
  }

  void _openFileUrl() async {
    if (await canLaunch(_fileUrlController.text)) {
      await launch(_fileUrlController.text);
    } else {
      print('Could not launch $_fileUrlController.text');
    }
  }

  @override
  void dispose() {
    _fileUrlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text('Share File'),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.black87,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _selectedFile != null
                  ? _selectedFile!.path.endsWith('.jpg') ||
                  _selectedFile!.path.endsWith('.png')
                  ? Image.file(
                _selectedFile!,
                fit: BoxFit.contain,
                height: 200,
              )
                  : Text(
                'File: ${_selectedFile!.path}',
                style: TextStyle(color: Colors.white),
              )
                  : Container(),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _pickFile,
                child: Text('Select File'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.pink,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _fileUrlController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Enter File URL',
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.pink),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.pink),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _openFileUrl,
                child: Text('Search here URL File'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.pink,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CoinMarketPage extends StatefulWidget {
  @override
  _CoinMarketPageState createState() => _CoinMarketPageState();
}

class _CoinMarketPageState extends State<CoinMarketPage> {
  TextEditingController searchController = TextEditingController();
  String country = '';
  double dollarRate = 0.0;

  Future<void> fetchData(String country) async {
    final apiKey = '256|HBKPTF8avF0UN24iHgQ1ZfcvcnH36MxoQOH8J1OA'; // Replace with your actual API key
    final baseUrl = 'https://v6.exchangeratesapi.io/latest';

    final apiUrl = '$baseUrl?base=USD&symbols=$country&access_key=$apiKey';

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final dynamic jsonData = json.decode(response.body);

      final double rate = jsonData['rates'][country];

      setState(() {
        dollarRate = rate;
      });
    } else {
      throw Exception('Failed loading data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text('Coin Market'),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.black87,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                labelText: 'Add country',
                labelStyle: TextStyle(color: Colors.white),
                suffixIcon: TextButton(
                  onPressed: () {
                    country = searchController.text;
                    fetchData(country);
                  },
                  child: Icon(Icons.search, color: Colors.white),
                ),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.pink),
                ),
              ),
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                country = searchController.text;
                fetchData(country);
              },
              child: Text(
                'Search',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Country: $country',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 10),
            Text(
              'Dollar Rate: $dollarRate',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class PostPage extends StatefulWidget {
  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  String? selectedOption;
  TextEditingController urlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text('Admin Posts'),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.black87,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.circular(5),
              ),
              child: DropdownButton<String>(
                itemHeight: 50,
                items: [
                  DropdownMenuItem<String>(
                    value: 'image',
                    child: Text('Image', style: TextStyle(color: selectedOption == 'image' ? Colors.white : Colors.black)),
                  ),
                  DropdownMenuItem<String>(
                    value: 'video_url',
                    child: Text('Video URL', style: TextStyle(color: selectedOption == 'video_url' ? Colors.white : Colors.black)),
                  ),
                  DropdownMenuItem<String>(
                    value: 'web_view',
                    child: Text('WebView', style: TextStyle(color: selectedOption == 'web_view' ? Colors.white : Colors.black)),
                  ),
                ],
                onChanged: (String? value) {
                  setState(() {
                    selectedOption = value;
                  });
                },
                value: selectedOption,
                hint: const Text('Select Post Type:', style: TextStyle(color: Colors.white)),
                underline: Container(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: urlController,
              decoration: const InputDecoration(
                labelText: 'Enter URL',
                labelStyle: TextStyle(color: Colors.white),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.pink),
                ),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (selectedOption != null && urlController.text.isNotEmpty) {
                      launchURL(urlController.text);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                  ),
                  child: Text('Submit ${selectedOption ?? ''}'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
