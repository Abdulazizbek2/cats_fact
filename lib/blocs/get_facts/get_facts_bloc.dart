import 'dart:math';
import 'dart:developer' as dev;
import 'package:cats_fact/core/dio/dio_error_exception.dart';
import 'package:cats_fact/src/repo/repository.dart';
import 'package:cats_fact/src/storage/hive_src.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/cat_model.dart/cat_model.dart';

part 'get_facts_event.dart';
part 'get_facts_state.dart';

class GetFactsBloc extends Bloc<CatFatsEvents, GetFactsState> {
  final HiveMethods hiveMethods = HiveMethods();
  GetFactsBloc()
      : super(GetFactsState(
            catshistoryList: [],
            b: 1,
            current: CatModel(text: "qwerty", createdAt: "3434"),
            image: "https://cataas.com/cat")) {
    on<FactInitializaEvent>(
      (event, emit) async {
        try {
          CatModel current = await getCurrent;
          final catshistoryList = await hiveMethods.getFactLists();
          emit(GetFactsState(
              catshistoryList: catshistoryList,
              b: 1,
              current: current,
              image: "https://cataas.com/cat"));
        } on DioException catch (e) {
          emit(GetFactsError(
              errorMessage: DioExceptions.fromDioError(e).toString(),
              catshistoryList: [],
              b: 1,
              current: CatModel(text: "erorr", createdAt: "00"),
              image: "https://cataas.com/cat"));
        }
      },
    );
    on<FactNextEvent>((event, emit) async {
      CatModel current = await getCurrent;
      if (!state.catshistoryList
          .map((e) => e.id)
          .toList()
          .contains(current.id)) {
        hiveMethods.addFact(current);
      }
      final catshistoryList = await hiveMethods.getFactLists();
      emit(GetFactsState(
          catshistoryList: catshistoryList,
          b: state.b + 1,
          current: current,
          image: "https://cataas.com/cat?${state.b}"));
    });
  }

  get getCurrent async {
    final dio = Dio();
    try {
      final res = await CatFactRepo(dio).getFacts();
      dev.log('res  $res');
    } catch (e) {
      dev.log('error  $e');
    }
    int rand = Random().nextInt((await CatFactRepo(dio).getFacts()).length);
    return (await CatFactRepo(dio).getFacts())[rand];
  }
}
