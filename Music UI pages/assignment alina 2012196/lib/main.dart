import 'package:flutter/material.dart';
import 'package:layoutsandform/components/BottomNav.dart';
import 'package:layoutsandform/home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  Widget screen = Home();

  void changeScreen(Widget newScreen) {
      setState(() {
        screen = newScreen;
      });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: screen,
        ),
        bottomNavigationBar: BottomNav(changeScreen: changeScreen,),
      ),
    );
  }
}
