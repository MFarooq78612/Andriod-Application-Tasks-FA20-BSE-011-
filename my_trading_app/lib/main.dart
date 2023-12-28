import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:audioplayers/audioplayers.dart';
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
      home: TradingAppPage(),
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
          IconButton(
            icon: const Icon(Icons.arrow_forward),
            onPressed: () {},
          ),
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
                  child: Text(
                    'Start Recording',
                    style: TextStyle(fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
                )
              else
                ElevatedButton(
                  onPressed: _stopRecording,
                  child: Text(
                    'Stop Recording',
                    style: TextStyle(fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red), // Use a different color for stop
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
                child: Text('Search URL File'),
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
      throw Exception('Failed to load data');
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
                hint: const Text('Select Post Type', style: TextStyle(color: Colors.white)),
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
