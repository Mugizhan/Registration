import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
part 'StatisticsModel.g.dart';

@JsonSerializable()
class StatisticsModel{

  @JsonKey(name:'confirmedCasesIndian')
  final int affected;
  @JsonKey(name:'deaths')
  final int death;
  @JsonKey(name:'discharged')
  final int recovered;
  @JsonKey(name:'totalConfirmed')
  final int active;
  @JsonKey(name:'confirmedCasesForeign')
  final int serious;
  const StatisticsModel({required this.affected,required this.death,required this.recovered,required this.active,required this.serious});
  factory StatisticsModel.fromJson(Map<String,dynamic> json)=>_$StatisticsModelFromJson(json);
  Map<String,dynamic> toJson()=>_$StatisticsModelToJson(this);
}