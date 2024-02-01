import 'package:flutter/material.dart';


class BottomNav extends StatelessWidget {
  const BottomNav({super.key});


  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(

          icon: Icon(Icons.home,),

          label: 'Home' ,

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

    );
  }
}
