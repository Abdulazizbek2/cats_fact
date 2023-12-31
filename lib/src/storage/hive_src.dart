import 'dart:convert';
import 'package:cats_fact/models/cat_model.dart/cat_model.dart';
import 'package:hive/hive.dart';

class HiveMethods {
  String hiveBox = 'hive_local_db';
  addFact(CatModel catModel) async {
    var box = await Hive.openBox(hiveBox);
    await box.add(json.encode(catModel.toJson()));
    Hive.close();
  }

  Future<List<CatModel>> getFactLists() async {
    var box = await Hive.openBox(hiveBox);
    List<CatModel> catFacts = [];

    for (int i = box.length - 1; i >= 0; i--) {
      var userMap = box.getAt(i);
      catFacts.add(CatModel.fromJson(json.decode(userMap)));
    }
    return catFacts;
  }

  deleteFact(int id) async {
    var box = await Hive.openBox(hiveBox);
    await box.deleteAt(id);
  }

  deleteAllFact() async {
    var box = await Hive.openBox(hiveBox);
    await box.clear();
  }
}
