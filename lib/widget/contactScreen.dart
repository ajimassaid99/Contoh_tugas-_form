import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

class ContactList extends StatefulWidget {
  // final List<Map<String, dynamic>> data;
  const ContactList({super.key});

  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    // Simulate loading data with a delay
    fetchData();
  }

  Future<void> fetchData() async {
    await Future.delayed(Duration(seconds: 2));

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> _data = ModalRoute.of(context)!
        .settings
        .arguments as List<Map<String, dynamic>>;
    return isLoading
        ? Scaffold(
            body: Center(
                child: Lottie.asset('assets/lottie/loading_indicator.json')),
          )
        : Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text("Contact List"),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, "/gallery", (routes) => routes.isFirst);
                    },
                    child: Icon(Icons.add))
              ],
            ),
            body: ListView.builder(
              itemCount: _data.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    radius: 35,
                    backgroundColor:
                        _data[index]['color'] ?? const Color(0xFFEADDFF),
                    child: _data[index]['path'] != ''
                        ? ClipOval(
                            child: Image.file(
                              File(_data[index]['path']),
                              fit: BoxFit.fill,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          )
                        : Text(
                            _data[index]['name']?[0] ?? "A",
                            style: const TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF21005D),
                            ),
                          ),
                  ),
                  title: Text(_data[index]['name']!),
                  subtitle: Text(_data[index]['number']!),
                  trailing: Container(
                    width: 100,
                    child: Row(
                      children: <Widget>[
                        Column(children: [
                          Flexible(
                            child: Row(children: [
                              IconButton(
                                iconSize: 20,
                                icon: const Icon(Icons.edit),
                                onPressed: () {
                                  _showEditDialog(context, index);
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete),
                                iconSize: 20,
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: const Text('Delete Contact'),
                                      content: const Text(
                                          'Are you sure you want to delete this contact?'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: const Text('Cancel'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            setState(() {
                                              _data.removeAt(index);
                                            });
                                            Navigator.pop(context);
                                          },
                                          child: const Text('Delete'),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              )
                            ]),
                          ),
                          Flexible(
                            child: Text(DateFormat('dd-MM-yyyy').format(
                                _data[index]['date'] ?? DateTime.now())),
                          ),
                        ]),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
  }

  // Add the edit dialog function if needed
  void _showEditDialog(BuildContext context, int index) {
    // Implement your edit dialog logic here
  }
}
