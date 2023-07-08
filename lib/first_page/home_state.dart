import 'dart:math';
import 'dart:developer' as dev;
import 'package:cats_fact/models/cat_model.dart/cat_model.dart';
import 'package:cats_fact/src/repo/repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../src/storage/hive_src.dart';

class MyAppState extends ChangeNotifier {
  final HiveMethods hiveMethods = HiveMethods();
  List<CatModel> users = [];

  void addUserLocalInStorage() async {
    hiveMethods.addFact(current);
  }

  var current = CatModel(text: "qwerty", createdAt: "");
  String image = "https://cataas.com/cat";
  void init() async {
    current = await getCurrent;
    notifyListeners();
  }

  int b = 1;

  get getCurrent async {
    final dio = Dio();
    try {
      final res = await CatFactRepo(dio).getFacts();
      dev.log('res  $res');
    } catch (e) {
      dev.log('error  $e');
    }
    int rand = Random().nextInt((await CatFactRepo(dio).getFacts()).length);
    print(await CatFactRepo(dio).getFacts());
    return (await CatFactRepo(dio).getFacts())[rand];
  }

  var history = <CatModel>[];

  GlobalKey? historyListKey;

  void getNext() async {
    if (!history.map((e) => e.id).toList().contains(current.id)) {
      history.insert(0, current);
      var animatedList = historyListKey?.currentState as AnimatedListState?;
      animatedList?.insertItem(0);
      // addUserLocalInStorage();
    }
    current = await getCurrent;
    image = "https://cataas.com/cat?$b";
    b++;
    notifyListeners();
  }
}
