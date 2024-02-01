import 'package:flutter/material.dart';

class MusicItem extends StatelessWidget {
  final String musicNumber;
  final String musicName;
  final String musicTime;

  const MusicItem(
      {super.key,
        required this.musicNumber,
        required this.musicName,
        required this.musicTime});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          musicNumber,
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(
          width: 40,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              musicName,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),
            SizedBox(
              height: 6,
            ),
            Text(
              "Brambles - $musicTime",
              style: TextStyle(color: Colors.grey),
            )
          ],
        ),
        Spacer(),
        Icon(Icons.more_horiz)
      ],
    );
  }
}
