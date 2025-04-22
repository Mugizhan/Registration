

import 'package:form1/data/model/StatisticsModel.dart';
import 'package:form1/data/service/statistics_service.dart';

class StatisticRepository{

  final StatisticsService _service=StatisticsService();
  Future<StatisticsModel> getData()async{
    return await _service.statisticService();
  }
}