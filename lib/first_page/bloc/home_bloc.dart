import 'package:bloc/bloc.dart';
import 'package:cats_fact/models/cat_model.dart/cat_model.dart';

import '../../src/storage/hive_src.dart';

class SFCEvents {
  String? id;
  SFCEvents({required this.id});
}

class SFCDecrementEvent extends SFCEvents {
  SFCDecrementEvent({required super.id});
}

class SFCInitializaEvent extends SFCEvents {
  SFCInitializaEvent({required super.id});
}

class SelFactState {
  CatModel fact;
  SelFactState({required this.fact});
}

class HomeBloc extends Bloc<SFCEvents, SelFactState> {
  final HiveMethods hiveMethods = HiveMethods();
  HomeBloc() : super(SelFactState(fact: CatModel())) {
    //   on<SFCInitializaEvent>(
    //     (event, emit) async {
    //       final fact = await hiveMethods.getFactLists();
    //       print("----------------------$fact");
    //       emit(SelFactState(fact: fact ?? {}));
    //     },
    //   );
    //   on<SFCIncrementEvent>((event, emit) async {
    //     Map<String, dynamic> foodsMap = state.fact;
    //     foodsMap[event.id!] = foodsMap[event.id]! + 1;
    //     bool? bo = await Prefs.saveDataToLocal(key: "foods", data: foodsMap);
    //     print("isSav $bo");
    //     emit(SelFactState(fact: foodsMap));
    //   });
    //   on<SFCDecrementEvent>(
    //     (event, emit) async {
    //       Map<String, dynamic> foodsMap = state.fact;
    //       foodsMap[event.id!] = foodsMap[event.id]! - 1;
    //       await Prefs.saveDataToLocal(key: "foods", data: foodsMap);
    //       emit(SelFactState(fact: foodsMap));
    //     },
    //   );
    //   on<SFCAddEvent>(
    //     (event, emit) async {
    //       Map<String, dynamic> foodsMap = state.fact;
    //       foodsMap[event.id!] = 1;
    //       await Prefs.saveDataToLocal(key: "foods", data: foodsMap);
    //       emit(SelFactState(fact: foodsMap));
    //     },
    //   );
    //   on<SFCDeleteEvent>(
    //     (event, emit) async {
    //       Map<String, dynamic> foodsMap = state.fact;
    //       foodsMap.remove(event.id);
    //       await Prefs.saveDataToLocal(key: "foods", data: foodsMap);
    //       emit(SelFactState(fact: foodsMap));
    //     },
    //   );
    // }
    // addTocard(SFCEvents event) async {
    //   Map<String, dynamic> foodsMap = state.fact;
    //   foodsMap[event.id!] = 1;
    //   await Prefs.saveDataToLocal(key: "foods", data: foodsMap);
    //   state.fact = foodsMap;
    //   // emit(SelFoodState(foods: foodsMap));
  }
}
//ihu