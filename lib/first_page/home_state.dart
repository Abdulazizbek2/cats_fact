import 'dart:math';

import 'package:cats_fact/models/cat_model.dart/cat_model.dart';
import 'package:cats_fact/src/repo/repozitoriy.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

<<<<<<< HEAD
class MyAppState extends ChangeNotifier {
=======
import '../src/storage/hive_src.dart';

class MyAppState extends ChangeNotifier {
  final HiveMethods hiveMethods = HiveMethods();
  List<CatModel> users = [];
  bool isLoading = true;

  void fetchFacts() async {
    var usersData = await hiveMethods.getFactLists();
    if (usersData.isNotEmpty) {
      users.addAll(usersData);
    }
    isLoading = false;
    notifyListeners();
  }

  void addUserLocalInStorage() async {
    hiveMethods.addFact(current);
  }

>>>>>>> 26f622c (second commi)
  var current = CatModel(text: "qwerty", createdAt: DateTime.now());
  String image = "https://cataas.com/cat";
  void init() async {
    current = await getCurrrent;
    notifyListeners();
  }

  int b = 1;

  get getCurrrent async {
    final dio = Dio(); // Provide a dio instance
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
<<<<<<< HEAD
=======
      addUserLocalInStorage();
>>>>>>> 26f622c (second commi)
    }
    current = await getCurrrent;
    image = "https://cataas.com/cat?$b";
    b++;
    notifyListeners();
  }
<<<<<<< HEAD

  var favorites = <CatModel>[];

  void toggleFavorite([CatModel? pair]) {
    pair = pair ?? current;
    if (favorites.contains(pair)) {
      favorites.remove(pair);
    } else {
      favorites.add(pair);
    }
    notifyListeners();
  }

  void removeFavorite(CatModel pair) {
    favorites.remove(pair);
    notifyListeners();
  }
=======
>>>>>>> 26f622c (second commi)
}
