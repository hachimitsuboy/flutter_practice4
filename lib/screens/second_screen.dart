import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/product_model.dart';

enum ProductSortType {
  name,
  price,
}

final productSortTypeProvider = StateProvider<ProductSortType>(
  // ソートの種類 name を返します。これがデフォルトのステートとなります。
  (ref) => ProductSortType.name,
);

final productsProvider = Provider<List<Product>>((ref) {
  final sortType = ref.watch(productSortTypeProvider);
  switch (sortType) {
    case ProductSortType.name:
      products.sort((a, b) => a.name.compareTo(b.name));
      return products;
    case ProductSortType.price:
      products.sort((a, b) => a.price.compareTo(b.price));
      return products;
  }
});

class SecondScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: [
          DropdownButton<ProductSortType>(
            // ソートの種類が変わると、ドロップダウンメニューが更新されて
            // 表示されるアイコン（メニューアイテム）が変わります。
            value: ref.watch(productSortTypeProvider),
            //stateProvider.notifierが呼ばれると、おそらくConsumerWidgetに通知がいき、リビルドされるのではないか？
            //つまり、ProductSortTypeのstate(name,price)が変更され、setstateしろといわれている？
            onChanged: (value) =>
                ref.read(productSortTypeProvider.notifier).state = value!,

            items: const [
              DropdownMenuItem(
                value: ProductSortType.name,
                child: Icon(
                  Icons.sort_by_alpha,
                  color: Colors.black,
                ),
              ),
              DropdownMenuItem(
                value: ProductSortType.price,
                child: Icon(
                  Icons.sort,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Text('${product.price} \$'),
          );
        },
      ),
    );
  }
}
