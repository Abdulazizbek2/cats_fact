part of 'get_facts_bloc.dart';

@freezed
abstract class GetFactsEvent with _$GetFactsEvent {

  const factory GetFactsEvent.getFacts() = _GetFacts;
}
