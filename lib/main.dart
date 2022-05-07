import 'package:flutter/material.dart';
import 'package:riverpod_pracitce/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "RiverPod",
      theme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/' : (context) => const HomeScreen(),
      },
    );
  }
}
