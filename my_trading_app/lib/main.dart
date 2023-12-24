import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AdminPostScreen(),
    );
  }
}

class AdminPostScreen extends StatefulWidget {
  @override
  _AdminPostScreenState createState() => _AdminPostScreenState();
}

class _AdminPostScreenState extends State<AdminPostScreen> {
  String videoURL = '';
  String imageURL = '';

  Future<void> _pickImage() async {
    // Code to pick an image from the gallery
    // ...
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Post'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Select Image'),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter YouTube Video URL',
              ),
              onChanged: (value) {
                setState(() {
                  videoURL = value;
                  imageURL = '';
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (Platform.isWindows) {
                  // Handling video playback for Windows platform
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Video Playback Unsupported'),
                        content: Text('Video playback is not supported on Windows.'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('Close'),
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  // For other platforms, launch the video URL in the default browser
                  if (await canLaunch(videoURL)) {
                    await launch(videoURL);
                  } else {
                    throw 'Could not launch $videoURL';
                  }
                }
              },
              child: Text('Show Video in App'),
            ),
            SizedBox(height: 20),
            imageURL.isNotEmpty
                ? Image.file(
              File(imageURL),
              height: 200,
              fit: BoxFit.cover,
            )
                : Container(),
          ],
        ),
      ),
    );
  }
}
