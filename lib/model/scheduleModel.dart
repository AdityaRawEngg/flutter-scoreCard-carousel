import 'package:json_annotation/json_annotation.dart';

part 'scheduleModel.g.dart';

@JsonSerializable(createFactory: true)
class Schedule {
  final year;
  final gametime;
  final game_state;
  final v;
  final h;
  final stt;

  Schedule(this.year, this.gametime, this.game_state, this.h, this.stt, this.v);

  factory Schedule.fromJson(Map<String, dynamic> json) =>
      _$ScheduleFromJson(json);
  Map<String, dynamic> toJson() => _$ScheduleToJson(this);

  // factory Schedule.fromJson(Map<String, dynamic> json) =>
  //     _$ScheduleFromJson(json);
  // Map<String, dynamic> toJson() => _$ScheduleToJson(this);
}
