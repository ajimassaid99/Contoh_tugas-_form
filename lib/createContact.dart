import 'dart:io';

import 'package:aplikasi_pertama/core/reusabel_widget/DatePicker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class FormCOntact extends StatefulWidget {
  const FormCOntact({super.key});

  @override
  State<FormCOntact> createState() => _FormCOntactState();
}

class _FormCOntactState extends State<FormCOntact> {
  final TextEditingController _nameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  int selectedRadio = 0;
  bool switchValue = false;

  String selectedOption = '';
  bool isChecked = false;
  late DateTime _selectedDate;
  late Color _selectedColor;

  void initState() {
    super.initState();
    _selectedColor = Colors.orange;
    _selectedDate = DateTime.now();
  }

  void _selectColor() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Pick a color'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: _selectedColor,
              onColorChanged: (Color color) {
                setState(() {
                  _selectedColor = color;
                });
              },
              pickerAreaHeightPercent: 0.8,
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  XFile? _selectedImage;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = pickedFile;
      });

      // widget.onImageSelected(_selectedImage!.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Contact Form"),
        ),
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              
              TextFormField(
                controller: _nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email tidak boleh kosong';
                  } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                      .hasMatch(value)) {
                    return 'Alamat email tidak valid';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  labelText: 'Username',
                ),
              ),
              DropdownButton<String>(
                value: selectedOption,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedOption = newValue!;
                  });
                },
                items: <String>['', 'Option 1', 'Option 2', 'Option 3']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              Checkbox(
                value: isChecked,
                onChanged: (bool? newValue) {
                  setState(() {
                    isChecked = newValue!;
                  });
                },
              ),
              Row(
                children: [
                  Radio(
                    value: 0,
                    groupValue: selectedRadio,
                    onChanged: (int? value) {
                      setState(() {
                        selectedRadio = value!;
                      });
                    },
                  ),
                  const Text("ya"),
                  const SizedBox(
                    width: 10,
                  ),
                  Radio(
                    value: 1,
                    groupValue: selectedRadio,
                    onChanged: (int? value) {
                      setState(() {
                        selectedRadio = value!;
                      });
                    },
                  ),
                  const Text("Tidak"),
                ],
              ),
              Switch(
                value: switchValue,
                onChanged: (bool newValue) {
                  setState(() {
                    switchValue = newValue;
                  });
                },
              ),
              if (_selectedImage != null)
                Image.file(
                  File(_selectedImage!.path),
                  height: 100,
                ),
              ElevatedButton(
                onPressed: _pickImage,
                child: Text('Pilih Gambar'),
              ),
              DatePickerWidget(
                initialDate: DateTime.now(),
                firstDate: DateTime(2024),
                lastDate: DateTime(2050),
                onDateSelected: (selectedDate) {
                  // Lakukan sesuatu dengan tanggal yang dipilih
                  print("Selected date: $selectedDate");
                },
              ),
              const SizedBox(height: 10),
              Container(
                height: 100,
                decoration: BoxDecoration(
                  color: _selectedColor,
                  shape: BoxShape.rectangle,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: _selectColor,
                  child: const Text('Pick Color'),
                  style: ElevatedButton.styleFrom(
                      // backgroundColor: _selectedColor, // warna latar belakang
                      )),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      print(_nameController.text);
                      print(selectedOption);
                    }
                  },
                  child: const Text("save"))
            ],
          ),
        ));
  }

  // Add the edit dialog function if needed
  void _showEditDialog(BuildContext context, int index) {
    // Implement your edit dialog logic here
  }
}
