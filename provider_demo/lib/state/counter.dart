import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Counter with ChangeNotifier {
  int _count;
  Counter(this._count);

  get count => _count;

  Future<void> add() async {
    await Future.delayed(Duration(seconds: 3));
    _count++;
    notifyListeners();
    print("#3 数值变化了 $_count");
  }
}

