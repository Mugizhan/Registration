import 'package:bloc/bloc.dart';
import 'package:form1/bloc/form_bloc/data_fetch.dart';
import 'package:form1/bloc/statistics_bloc/statistics_event.dart';
import 'package:form1/bloc/statistics_bloc/statistics_state.dart';
import 'package:form1/data/repository/statistics_repository.dart';

class StatisticsBloc extends Bloc<StatisticsEvent, StatisticsState> {
  final StatisticRepository statisticsRepo;

  StatisticsBloc({required this.statisticsRepo}) : super(const StatisticsState()) {
    on<StaticPageLoad>(_onStaticPageLoad);
    on<StatisticDataFetch>(_onStatisticDataFetch);
  }

  Future<void> _onStaticPageLoad(
      StaticPageLoad event, Emitter<StatisticsState> emit) async {
    emit(state.copyWith(formStatus: const DataFetchedLoading()));
    try {
      final data = await statisticsRepo.getData();
      emit(state.copyWith(
        fetchedData: data,
        formStatus: const DataFetched(),
      ));
    } catch (e) {
      emit(state.copyWith(
        formStatus: const DataFetchedFailed(),
      ));
    }
  }

  void _onStatisticDataFetch(
      StatisticDataFetch event, Emitter<StatisticsState> emit) {
    emit(state.copyWith(
      fetchedData: event.fetchedData,
      formStatus: const DataFetched(),
    ));
  }
}
