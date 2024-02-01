import 'package:alina_2012196_mid/home.dart';
import 'package:flutter/material.dart';

import 'Component/BottomNav.dart';
import 'Login.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child:Login()
        ),
          // bottomNavigationBar: BottomNav(),
      ),
    );
  }
}
