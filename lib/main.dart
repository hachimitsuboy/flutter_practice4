import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_pracitce/models/counter_model.dart';

// normal Provider
final helloWorldProvider = Provider((_) => 'Hello world');

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

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String value = ref.watch(helloWorldProvider);
    final int count = ref.watch(counterProvider).count;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Example"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("ボタンがタップされた回数: $count"),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: () => refresh(ref), child: const Text("リセットする"),)
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => increment(ref),
          child: const Icon(Icons.add),
          tooltip: "値を追加",
        ),
      ),
    );
  }

  increment(WidgetRef ref) {
    final model = ref.read(counterProvider);
    //FloatingActionButtonが押された時、refを用いてプロバイダがラップしているcounterModelを生成し、incrementを実行する
    model.increment();
  }

  refresh(WidgetRef ref) {
    final model = ref.read(counterProvider);
    model.refresh();
  }
}
