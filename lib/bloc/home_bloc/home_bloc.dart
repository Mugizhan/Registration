import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:form1/bloc/form_bloc/form_event.dart';
import 'package:meta/meta.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<HomeEvent>((event, emit) async{
      await eventMapToState(event,emit);
    });
  }

  Future<void> eventMapToState(HomeEvent event,Emitter<HomeState> emit)async{
    if(event is CountryChanged) {
      emit(state.copyWith(
          selectedCountry:event.country,
    formStatus: FormEditing()
      ));
    }
    if(event is PageTapped) {
      emit(state.copyWith(
          pageIndex: event.index,
          formStatus: FormEditing()
      ));
    }
  }

}


