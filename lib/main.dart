import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final helloWorldProvider = Provider((_) => 'Hello world');

void main() {
  runApp(
    ProviderScope(child: MyApp(),),
  );

}

class MyApp extends HookConsumerWidget{
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    final String value = ref.watch(helloWorldProvider);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Example"),),
        body: Center(
          child: Text(value),
        ),
      ),
    );
  }
}