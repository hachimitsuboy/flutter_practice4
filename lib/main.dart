import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_pracitce/models/counter_model.dart';
import 'package:riverpod_pracitce/screens/home_screen.dart';

// normal Provider
final helloWorldProvider = Provider((_) => "カウンター");

//ChangeNotifierProvider
final counterProvider = ChangeNotifierProvider(
  (ref) => CounterModel(),
);

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "RiverPod_Practice",
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

