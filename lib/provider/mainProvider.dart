import 'package:flutter/material.dart';

class Counter with ChangeNotifier {
  int count = 0;

  void increment() {
    count++;
    notifyListeners();
  }
  void decrement() {
    count--;
    notifyListeners();
  }
  bool _isDarkMode = true;

  bool get isDarkMode => _isDarkMode;
  String mode = 'light';
  Color selectedColor = Colors.blue;
 

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    
    if(_isDarkMode){
      mode = 'light';
      selectedColor = Colors.blue;

  }else{
    mode = 'drak';
    selectedColor = Colors.black;

  }
  notifyListeners();
  }
}