import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  double get widthScreen => MediaQuery.of(this).size.width;
  double get heightScreen => MediaQuery.of(this).size.height;

  void showSnackBar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(content: Text(message)));
  }
}
