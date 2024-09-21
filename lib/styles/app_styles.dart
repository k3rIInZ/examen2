import 'package:flutter/material.dart';

class AppStyles {
  static final InputDecoration inputDecoration = InputDecoration(
    border: OutlineInputBorder(),
    labelStyle: TextStyle(fontSize: 16, color: Colors.grey),
  );

  static final TextStyle titleStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle subtitleStyle = TextStyle(
    fontSize: 16,
    color: Colors.grey[600],
  );
}
