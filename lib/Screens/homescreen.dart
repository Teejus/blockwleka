import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<String, String> data = {};

  getSavedValue() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      data['access'] = pref.getString('access') ?? "";
      data['firstName'] = pref.getString('firstName') ?? "";
      data['lastName'] = pref.getString('lastName') ?? "";
    });
  }

  @override
  void initState() {
    getSavedValue();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("${data['access']}"),
          Text("${data['firstName']}"),
          Text("${data['lastName']}"),
        ],
      ),
    );
  }
}
