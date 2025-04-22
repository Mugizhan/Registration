import 'package:equatable/equatable.dart';
import 'package:form1/data/model/StatisticsModel.dart';
import '../form_bloc/data_fetch.dart';

class StatisticsState extends Equatable {
  final StatisticsModel? fetchedData;
  final DataFetch formStatus;

  const StatisticsState({
    this.fetchedData,
    this.formStatus = const DataFetched(),
  });

  StatisticsState copyWith({
    StatisticsModel? fetchedData,
    DataFetch? formStatus,
  }) {
    return StatisticsState(
      fetchedData: fetchedData ?? this.fetchedData,
      formStatus: formStatus ?? this.formStatus,
    );
  }

  @override
  List<Object?> get props => [fetchedData, formStatus];
}
