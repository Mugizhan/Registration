// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'StatisticsModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StatisticsModel _$StatisticsModelFromJson(Map<String, dynamic> json) =>
    StatisticsModel(
      affected: (json['confirmedCasesIndian'] as num).toInt(),
      death: (json['deaths'] as num).toInt(),
      recovered: (json['discharged'] as num).toInt(),
      active: (json['total'] as num).toInt(),
      serious: (json['confirmedCasesForeign'] as num).toInt(),
    );

Map<String, dynamic> _$StatisticsModelToJson(StatisticsModel instance) =>
    <String, dynamic>{
      'confirmedCasesIndian': instance.affected,
      'deaths': instance.death,
      'discharged': instance.recovered,
      'total': instance.active,
      'confirmedCasesForeign': instance.serious,
    };
