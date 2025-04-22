import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:form1/data/model/StatisticsModel.dart';

class StatisticsService {
  Future<StatisticsModel> statisticService() async {
    final url = Uri.parse('https://api.rootnet.in/covid19-in/stats/latest');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final jsonData = jsonDecode(response.body);
        final summary = StatisticsModel.fromJson(jsonData['data']['summary']);
        return summary;
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
