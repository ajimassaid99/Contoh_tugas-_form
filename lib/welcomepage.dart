import 'package:aplikasi_pertama/createContact.dart';
import 'package:aplikasi_pertama/widget/contactScreen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:video_player/video_player.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/video/ok.mp4');

    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(true);
    _controller.initialize().then((_) => setState(() {}));
    _controller.play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'WelcomePage',
          style: TextStyle(
            fontFamily: 'Roboto',
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigasi ke halaman Contact
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ContactList(),
                      settings: RouteSettings(
                        arguments: [
                          {
                            'name': 'John Doe',
                            'number': '123-456-7890',
                            'color': const Color.fromARGB(255, 7, 170, 29),
                            'path': '', // Provide the file path if available
                            'date': DateTime.now(),
                          },
                          {
                            'name': 'Yohn Doe 2',
                            'number': '123-456-7890',
                            'color': Color.fromARGB(255, 73, 230, 164),
                            'path': '', // Provide the file path if available
                            'date': DateTime.now(),
                          },
                        ],
                      ),
                    ));
              },
              child: Image.asset(
                'assets/icon/ContactsIcon.jpg',
                width: 40,
                height: 30,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigasi ke halaman Gallery
                Navigator.pushNamed(context, "/gallery");
              },
              child: Image.asset(
                'assets/icon/galeryIcon.jpg',
                width: 40,
                height: 30,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 20.0),
            ),
            const Text('With assets mp4'),
            Container(
              padding: const EdgeInsets.all(20),
              child: AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: <Widget>[
                    VideoPlayer(_controller),
                    VideoProgressIndicator(_controller, allowScrubbing: true),
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

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact'),
      ),
      body: const Center(
        child: Text('This is the Contact Page'),
      ),
    );
  }
}

class GalleryPage extends StatelessWidget {
  const GalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallery'),
      ),
      body: const Center(
        child: Text('This is the Gallery Page'),
      ),
    );
  }
}
