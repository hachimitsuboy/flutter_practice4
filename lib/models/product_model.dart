import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../screens/second_screen.dart';

class Product {
  Product({required this.name, required this.price});

  final String name;
  final double price;
}

final products = [
  Product(name: 'iPhone', price: 999),
  Product(name: 'cookie', price: 2),
  Product(name: 'ps5', price: 500),
];

