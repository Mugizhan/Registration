import 'package:bloc/bloc.dart';
import 'package:form1/bloc/form_bloc/data_fetch.dart';
import 'package:form1/bloc/statistics_bloc/statistics_event.dart';
import 'package:form1/bloc/statistics_bloc/statistics_state.dart';
import 'package:form1/data/repository/statistics_repository.dart';
import 'package:meta/meta.dart';


class StatisticsBloc extends Bloc<StatisticsEvent, StatisticsState> {
  final StatisticRepository statisticsRepo;
  StatisticsBloc({required this.statisticsRepo}) : super(StatisticsState()) {
    on<StatisticsEvent>((event, emit) {
      mapEventToState(event,emit);
    });
  }

  Future<void> mapEventToState(StatisticsEvent event,Emitter<StatisticsState> emit)async{
    try{


    }
    catch(e){
      emit(state.copyWith(
        formStatus: const DataFetchedFailed(),
      ));
    }
  }
}
