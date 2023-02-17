import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    SharedPreferences.setMockInitialValues({});

    return  Scaffold(
      body: Center(
       ),
    );
  }
}