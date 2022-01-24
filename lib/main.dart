import 'package:flutter/material.dart';
import 'package:fooderlich/home.dart';
import 'package:fooderlich/models/models.dart';
import 'package:fooderlich/theme.dart';
import 'package:provider/provider.dart';

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
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: MultiProvider(providers: [
        ChangeNotifierProvider(
          create: (ctx) => TabManager(),         
        ),
        ChangeNotifierProvider(
          create: (ctx) => GroceryManager(),         
        ),
      ], child: const HomeScreen()),
    );
  }
}
