import 'package:flutter/material.dart';


class ImageCard extends StatelessWidget {
  final String Details;
  final String Viewers;
  final String imagepath;

  const ImageCard(
  {super.key, required this.Details, required this.Viewers, required this.imagepath});


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),


          ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
            child: Image.asset(
              imagepath,
              fit: BoxFit.cover, // Ensure the image fits the container
            ),
          )),

        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(Details),
                  Text(Viewers)
                ],
              ),

            ],
          ),
        ), // Make sure to use a string for the Text widget
      ],
    );
  }}
