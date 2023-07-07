import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'cat_fact_event.dart';
part 'cat_fact_state.dart';

class CatFactBloc extends Bloc<CatFactEvent, CatFactState> {
  CatFactBloc() : super(CatFactInitial()) {
    on<CatFactEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
