// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scheduleModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Schedule _$ScheduleFromJson(Map<String, dynamic> json) {
  return Schedule(
    json['year'],
    json['gametime'],
    json['game_state'],
    json['h'],
    json['stt'],
    json['v'],
  );
}

Map<String, dynamic> _$ScheduleToJson(Schedule instance) => <String, dynamic>{
      'year': instance.year,
      'gametime': instance.gametime,
      'game_state': instance.game_state,
      'v': instance.v,
      'h': instance.h,
      'stt': instance.stt,
    };
