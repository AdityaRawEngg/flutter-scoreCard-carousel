import 'package:score_card/model/scheduleModel.dart';
import 'package:score_card/services/getSchedule.dart';
import 'package:timeago/timeago.dart' as timeago;

class ScheduleVM {
  List<ScheduleModel> schedule = [];

  Future<List<ScheduleModel>> fetchSchedule(
      {String sport_key, String env_key}) async {
    final result = await ScheduleService()
        .getSchedule(env_key: env_key, sport_key: sport_key);

    this.schedule = result.map((data) => ScheduleModel(data)).toList();
    return this.schedule;
  }
}

class ScheduleModel {
  final Schedule schedule;

  ScheduleModel(this.schedule);

  String get year {
    return this.schedule.year != "" ? this.schedule.year.toString() : null;
  }

  String get gameState {
    return this.schedule.game_state != "" ? this.schedule.game_state : null;
  }

  String get gameStatus {
    return this.schedule.st != "" ? this.schedule.st.toString() : null;
  }

  String get gameTime {
    return timeago.format(DateTime.parse(this.schedule.gametime),
        locale: 'en_short');
  }

  String get homeTeamName {
    return this.schedule.h["tn"] != "" ? this.schedule.h["tn"] : null;
  }

  String get arena_name {
    return this.schedule.arena_name != "" ? this.schedule.arena_name : null;
  }

  String get homeTeamScore {
    return this.schedule.h["s"] != "" ? this.schedule.h["s"].toString() : null;
  }

  String get homeTeamRecord {
    return this.schedule.h["re"] != "" ? this.schedule.h["re"] : null;
  }

  String get visitorTeamName {
    return this.schedule.v["tn"] != "" ? this.schedule.v["tn"] : null;
  }

  String get visitorTeamScore {
    return this.schedule.v["s"] != "" ? this.schedule.v["s"].toString() : null;
  }

  String get visitorTeamRecord {
    return this.schedule.v["re"] != "" ? this.schedule.v["re"] : null;
  }
}
