part of 'get_facts_bloc.dart';

@immutable
abstract class GetFactsState {}

class GetFactsInitial extends GetFactsState {}


class GetFactsLoading extends GetFactsState {}

class GetFactsError extends GetFactsState {
  final String errorMessage;

  GetFactsError({required this.errorMessage});
}

class GetFactsSuccess extends GetFactsState {
  final List<CatModel> catsModelList;

  GetFactsSuccess({required this.catsModelList});
}


