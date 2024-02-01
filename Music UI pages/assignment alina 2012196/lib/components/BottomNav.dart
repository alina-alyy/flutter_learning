import 'package:flutter/material.dart';
import 'package:layoutsandform/home.dart';

import '../library.dart';

class BottomNav extends StatefulWidget {
  final Function(Widget newScreen) changeScreen;

  const BottomNav({super.key, required this.changeScreen});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int curIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: curIndex,
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.library_music),
          label: 'Library',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.playlist_add),
          label: 'Playlist',
        ),
      ],
      onTap: (int index) {
        if (index == 2) {
          setState(() {
            curIndex = 2;
          });
          widget.changeScreen(Library());
        } else if (index == 0) {
          setState(() {
            curIndex = 0;
          });
          widget.changeScreen(Home());
        }
      },
    );
  }
}
