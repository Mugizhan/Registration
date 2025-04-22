import 'package:equatable/equatable.dart';
import 'package:form1/data/model/StatisticsModel.dart';

import '../form_bloc/data_fetch.dart';

class StatisticsState extends Equatable {
  final List<StatisticsModel> fetchedData;
  final DataFetch formStatus;
  const StatisticsState({this.fetchedData=const [],this.formStatus=const DataFetched()});

  StatisticsState copyWith({
    List<StatisticsModel>? fetchedData,
    DataFetch?formStatus
}){
    return StatisticsState(
        fetchedData:fetchedData??this.fetchedData,
        formStatus:formStatus??this.formStatus
    );
  }
  @override
  List<Object?> get props => [];
}

