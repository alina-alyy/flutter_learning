import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Component/BottomNav.dart';
import 'Component/ImageCard.dart';
import 'Component/MusicItem.dart';


class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  String? fullName;
  String? email;

  Future<String?> getFullName() async {
    var data = await SharedPreferences.getInstance();
    return data.getString("fullName");
  }


  @override
  void initState() {
    super.initState();
    getFullName().then((value) {
      setState(() {
        fullName = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Icon(Icons.settings),
                  Text(" Hello ${fullName}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                  Icon(Icons.account_box),
                ]),
                SizedBox(
                  height: 20,
                ),



                  TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        labelText: "Search",
                        hintText: "Search",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                    ),

                  // SizedBox(width: 20,),


                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  height: 180,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: Image.asset("title.png",
                      fit: BoxFit.cover, ),
                  ),),
                SizedBox(height: 10),
               Text("Your favourites",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23)),
                SizedBox(
                  height: 20,
                ),


                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children:[

                 ImageCard(Details: "into the night", Viewers: "23 views", imagepath: "img.png"),
                 ImageCard(Details: "into the night", Viewers: "230 views", imagepath: "img3.png"),
                 ImageCard(Details: "into the night", Viewers: "200 views", imagepath: "img2.png")
                  ]
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text("Artist",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                    Text("Album",style: TextStyle(color: Colors.grey.shade800)),
                    Text("hit",style: TextStyle(color: Colors.grey.shade800)),
                    Text("your playlist",style: TextStyle(color: Colors.grey.shade800))],
                ),
                SizedBox(height: 50,),
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
                ),


              ],
            ),
          ),
          // ),
        ),
      ),
      bottomNavigationBar: BottomNav(),
    );
  }
}
