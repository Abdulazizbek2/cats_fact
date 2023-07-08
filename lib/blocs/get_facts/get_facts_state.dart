part of 'get_facts_bloc.dart';

@immutable
class GetFactsState {
  final List<CatModel> catshistoryList;
  final int b;
  final CatModel current;
  final String image;

  const GetFactsState(
      {required this.catshistoryList,
      required this.b,
      required this.current,
      required this.image});
}

// class GetFactsInitial extends GetFactsState {
//   const GetFactsInitial(
//       {required super.catshistoryList,
//       required super.b,
//       required super.current,
//       required super.image});
// }

// class GetFactsLoading extends GetFactsState {
//   const GetFactsLoading(
//       {required super.catshistoryList,
//       required super.b,
//       required super.current,
//       required super.image});
// }

class GetFactsError extends GetFactsState {
  final String errorMessage;

  const GetFactsError({
    required this.errorMessage,
    required super.catshistoryList,
    required super.b,
    required super.current,
    required super.image,
  });
}

// class GetFactsSuccess extends GetFactsState {
//   const GetFactsSuccess(
//       {required super.catshistoryList,
//       required super.b,
//       required super.current,
//       required super.image});
// }
