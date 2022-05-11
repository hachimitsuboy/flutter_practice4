import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_pracitce/screens/second_screen.dart';
import '../main.dart';
import '../models/product_model.dart';

class HomeScreen extends ConsumerWidget{

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String value = ref.watch(helloWorldProvider);
    final int count = ref.watch(counterProvider).count;
    final products = ref.watch(productsProvider);


    return Scaffold(
      appBar: AppBar(
        title: const Text("Example"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(value),
            const SizedBox(height: 10),
            Text("ボタンがタップされた回数: $count"),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => refresh(ref),
              child: const Text("リセットする"),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SecondScreen(),
                  ),
                );
              },
              child: const Text(
                "次のページへ",
                style: TextStyle(fontSize: 15),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => increment(ref),
        child: const Icon(Icons.add),
        tooltip: "値を追加",
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
