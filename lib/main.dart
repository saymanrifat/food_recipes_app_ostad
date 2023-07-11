import 'package:flutter/material.dart';
import 'package:food_recipes_app_ostad/screen/home.dart';

void main() {
  runApp(BaseApp());
}

class BaseApp extends StatelessWidget {
  const BaseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
