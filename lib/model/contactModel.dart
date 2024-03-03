import 'dart:core';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ContactModel {
  final String nama;
  final String number;
  final List<int> color;
  final String path;
  final DateFormat date;

  ContactModel(
      {required this.nama,
      required this.color,
      required this.date,
      required this.number,
      required this.path});

  factory ContactModel.fromJson(Map<String, dynamic> json) => ContactModel(
      nama: json["nama"] ?? "",
      number: json["number"] ?? 0,
      color: json['title'] ?? [],
      path: json['path'] ?? '',
      date: json['date']);
}
