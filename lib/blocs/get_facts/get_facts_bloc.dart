import 'package:cats_fact/core/dio/dio_error_exception.dart';
import 'package:cats_fact/src/repo/repository.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/cat_model.dart/cat_model.dart';

part 'get_facts_event.dart';
part 'get_facts_state.dart';

part 'get_facts_bloc.freezed.dart';

class GetFactsBloc extends Bloc<GetFactsEvent, GetFactsState> {
  final CatFactRepo catFactRepo;
  GetFactsBloc(this.catFactRepo) : super(GetFactsInitial()) {
    on<_GetFacts>(_getFacts);
  }

  Future<void> _getFacts(_GetFacts event, Emitter<GetFactsState> emit) async {
    emit(GetFactsLoading());
    try {
      final res = await catFactRepo.getFacts();
      emit(GetFactsSuccess(catsModelList: res));
    } on DioException catch (e) {
      emit(GetFactsError(
          errorMessage: DioExceptions.fromDioError(e).toString()));
    }
  }
}
