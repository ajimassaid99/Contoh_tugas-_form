import 'package:aplikasi_pertama/bloc/counter_bloc.dart';
import 'package:aplikasi_pertama/bloc/text_bloc.dart';
import 'package:aplikasi_pertama/createContact.dart';
import 'package:aplikasi_pertama/main.dart';
import 'package:aplikasi_pertama/view-model/mainProvider.dart';
import 'package:aplikasi_pertama/view/contactScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  late VideoPlayerController _controller;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  String text = "";

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
    final counter = Provider.of<Counter>(context);
    return ChangeNotifierProvider<Counter>(
        create: (_) => Counter(),
        child: Consumer<Counter>(builder: (context, counter, child) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'WelcomePage',
                style: TextStyle(
                  fontFamily: 'Roboto',
                ),
              ),
              actions: [
                ElevatedButton(
                  onPressed: () => counter.toggleTheme(),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(counter.selectedColor),
                  ),
                  child: Text(counter.mode),
                )
              ],
            ),
            body: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // TextFormField(
                    //   controller: _nameController,
                    //   decoration: const InputDecoration(
                    //     labelText: 'Name',
                    //     border: OutlineInputBorder(),
                    //   ),
                    // ),
                    // const SizedBox(height: 20),
                    // TextFormField(
                    //   controller: _phoneController,
                    //   decoration: const InputDecoration(
                    //     labelText: 'Phone Number',
                    //     border: OutlineInputBorder(),
                    //   ),
                    //   keyboardType: TextInputType.phone,
                    // ),
                    // const SizedBox(height: 20),
                    // ElevatedButton(
                    //   onPressed: () {
                    //     String name = _nameController.text;
                    //     String phoneNumber = _phoneController.text;
                    //     // Do something with the name and phone number
                    //     print('Name: $name, Phone Number: $phoneNumber');
                    //   },
                    //   child: const Text('Submit'),
                    // ),
                    // BlocListener<TextBloc, TextState>(
                    //     listener: (context, state) {
                    //       if (state is TextSucces) {
                    //         ScaffoldMessenger.of(context).showSnackBar(
                    //           const SnackBar(content: Text('Hitungan Genap!')),
                    //         );
                    //         // context.read<CounterBloc>.add(Increment(angka: 1,));
                    //       }
                    //     },
                    //     child: Center(child: Text(text))),
                    // ElevatedButton(
                    //   onPressed: () {
                    //     context
                    //         .read<TextBloc>()
                    //         .add(ChangeText("sudah di tekan", ''));
                    //   },
                    //   child: const Text('Kirim'),
                    // ),
                    // Text('${counter.count}'),
                    // ElevatedButton(
                    //   onPressed: () => counter.increment(),
                    //   child: const Text('Tambah'),
                    // ),
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
                                    'color':
                                        const Color.fromARGB(255, 7, 170, 29),
                                    'path': '',
                                    'date': DateTime.now(),
                                  },
                                  {
                                    'name': 'Yohn Doe 2',
                                    'number': '123-456-7890',
                                    'color':
                                        const Color.fromARGB(255, 73, 230, 164),
                                    'path':
                                        '', // Provide the file path if available
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
                    // Container(
                    //   padding: const EdgeInsets.only(top: 20.0),
                    // ),
                    // const Text('With assets mp4'),
                    // Container(
                    //   padding: const EdgeInsets.all(20),
                    //   child: AspectRatio(
                    //     aspectRatio: _controller.value.aspectRatio,
                    //     child: Stack(
                    //       alignment: Alignment.bottomCenter,
                    //       children: <Widget>[
                    //         VideoPlayer(_controller),
                    //         VideoProgressIndicator(_controller,
                    //             allowScrubbing: true),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          );
        }));
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
