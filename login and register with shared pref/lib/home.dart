import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? first;

  Future<String?> getfirst() async {
    var data = await SharedPreferences.getInstance();
    return data.getString("firstname");
  }

  //
  String? middle;

  Future<String?> getmiddle() async {
    var data = await SharedPreferences.getInstance();
    return data.getString("middlename");
  }

  String? last;

  Future<String?> getlast() async {
    var data = await SharedPreferences.getInstance();
    return data.getString("lastname");
  }

  @override
  void initState() {
    super.initState();
    getfirst().then((value) {
      setState(() {
        first = value;
      });
    });
    getmiddle().then((value) {
      setState(() {
        middle = value;
      });
    });
    getlast().then((value) {
      setState(() {
        last = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('firstname:${first ?? "No data"}'),
        Text('middlename:${middle ?? "No data"}'),
        Text('lastname: ${last ?? "No data"}'),
      ],
    );
  }
}
