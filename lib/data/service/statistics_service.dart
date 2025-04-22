import 'dart:convert';
import 'package:form1/data/model/StatisticsModel.dart';
import 'package:http/http.dart' as http;

class StatisticsService{
  Future<List<StatisticsModel>> statisticService()async{
    final url=Uri.parse('https://api.rootnet.in/covid19-in/stats/latest');
    try{
    final response=await http.get(url);
    if (response.statusCode == 200) {
      List<dynamic> jsonData = jsonDecode(response.body);
      List<StatisticsModel> products = jsonData.map((item) => StatisticsModel.fromJson(item)).toList();
      return products;
    } else {
      throw Exception('Failed to load products');
    }

    }
    catch(e){
      throw Exception(e);
    }

  }
}