import 'package:equatable/equatable.dart';
import 'package:form1/data/model/StatisticsModel.dart';

abstract class StatisticsEvent extends Equatable {
  const StatisticsEvent();

  @override
  List<Object?> get props => [];

  get fetchedData => null;
}

class StaticPageLoad extends StatisticsEvent {}

class StatisticDataFetch extends StatisticsEvent {
  final StatisticsModel fetchedData;

  const StatisticDataFetch({required this.fetchedData});

  @override
  List<Object?> get props => [fetchedData];
}
