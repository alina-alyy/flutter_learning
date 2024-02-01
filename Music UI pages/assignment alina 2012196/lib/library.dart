import 'package:flutter/material.dart';
import 'package:layoutsandform/components/BottomNav.dart';
import 'package:layoutsandform/components/MusicItem.dart';

class Library extends StatelessWidget {
  const Library({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Icon(Icons.arrow_back), Icon(Icons.search)],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: Image.asset(
                        "imge.png",
                        width: 150,
                      )),
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Album - 8 songs - 2022",
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Charcol",
                          style: TextStyle(
                              fontSize: 26, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Brambles",
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Row(
                          children: [
                            Icon(Icons.music_video_rounded, size: 34),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(Icons.download_for_offline_outlined, size: 34),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(Icons.more_horiz_rounded, size: 34)
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                      child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        backgroundColor: Colors.black,
                        padding: EdgeInsets.only(
                            top: 20, bottom: 20, left: 8, right: 8)),
                    label: Text("Play"),
                    icon: Icon(Icons.play_arrow_rounded),
                    onPressed: () {},
                  )),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        backgroundColor: Colors.grey,
                        padding: EdgeInsets.only(
                            top: 20, bottom: 20, left: 8, right: 8)),
                    label: Text("Shuffle"),
                    icon: Icon(Icons.shuffle_rounded),
                    onPressed: () {},
                  ))
                ],
              ),
              SizedBox(height: 40,),
              Column(
                children: [
                  MusicItem(musicNumber: "01", musicName: "To Speak Of Solitude", musicTime: "4:21"),
                  SizedBox(height: 30,),
                  MusicItem(musicNumber: "02", musicName: "Unsayable", musicTime: "2:52"),
                  SizedBox(height: 30,),
                  MusicItem(musicNumber: "03", musicName: "Into The Night", musicTime: "4:43"),
                  SizedBox(height: 30,),
                  MusicItem(musicNumber: "04", musicName: "Sait Photographs", musicTime: "6:54"),
                  SizedBox(height: 30,),
                  MusicItem(musicNumber: "05", musicName: "Pink And Cute", musicTime: "2:58")
                ],
              )
            ],
          ),
        ),
      ),
      // bottomNavigationBar: BottomNav(),
    );
  }
}
