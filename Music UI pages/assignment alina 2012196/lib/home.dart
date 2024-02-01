import 'package:flutter/material.dart';
import 'package:drop_shadow/drop_shadow.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 60,
                height: 20,
                child: Image.asset("dropdown.png"),
              ),
              Text("Now Playing"),
              Container(
                child: Image.asset("icon2.png"),
                width: 60,
                height: 20,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: DropShadow(
                  //this is the package class we called

                  //@image give Image.asset() or Image.network()
                  child: Image.asset(
                    'imge.png',
                    width: 400,
                  ),
                  //@borderRadius if not defined default value is 0
                  borderRadius: 20,
                  //@blurRadius if not defined default value is
                  blurRadius: 15,
                  //@offset default value is Offset(8,8)
                  offset: Offset(5, 5),
                  //@scale if not defined default value is 1
                  spread: 1.05,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                // margin: EdgeInsets.only(top: 30, left: 30),
                child: Image.asset("heart.png"),
                width: 60,
                // height: 20,
              ),
              Text(
                "Unsayabless",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight:
                  FontWeight.bold, // Adjust the font size as needed
                ),
              ),
              Container(
                child: Image.asset("icon.png"),
                width: 60,
                height: 20,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Alan Walker",
                style: TextStyle(
                  fontSize: 16,
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Container(
              child: Row(
                children: [
                  Expanded(
                    child: Image.asset("music.png", fit: BoxFit.cover),
                  ),
                ],
              ),
              height: 40,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("1:02"),
                Container(
                  child: Row(
                    children: [Image.asset("icon.png")],
                  ),
                  height: 20,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Icon(Icons.shuffle_rounded, color: Colors.grey),
                ),
                Container(
                  child: Image.asset("backward.png", width: 40),
                ),
                Container(
                  child: Icon(Icons.play_circle_fill, size: 85),
                ),
                Container(
                  child: Image.asset("forward.png", width: 40),
                ),
                Container(
                  child: Icon(Icons.loop_rounded, color: Colors.grey),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
