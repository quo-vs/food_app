import 'package:flutter/material.dart';
import 'package:fooderlich/home.dart';
import 'package:fooderlich/theme.dart';

void main() {
  runApp(const Fooderlich());
}

class Fooderlich extends StatelessWidget {

  const Fooderlich({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = FooderlichTheme.dark();

    return MaterialApp(
      title: 'Fooderlich',
      theme: theme,
      home: const HomeScreen(),
    );
  }
}
