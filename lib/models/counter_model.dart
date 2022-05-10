
import 'package:flutter/material.dart';

class CounterModel extends ChangeNotifier {
  var _count = 0;
  int get count => _count;

  void increment() {
    _count++;
    //notifyListeners()で監視元（ConsumerWidget内のref.watchに通知がいき、
    //監視元でcounterProviderがラップしているcounterModel(状態が変化している=_countの値が変化)のcountを引き出している
    notifyListeners();
  }

  void refresh() {
    _count = 0;
    notifyListeners();
  }
}