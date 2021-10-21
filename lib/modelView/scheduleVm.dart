import 'package:score_card/model/scheduleModel.dart';
import 'package:score_card/services/getSchedule.dart';
import 'package:timeago/timeago.dart' as timeago;

class ScheduleVM {
  List<ScheduleModel> schedule = [];

  Future<List<ScheduleModel>> fetchSchedule() async {
    final result = await ScheduleService().getSchedule();

    this.schedule = result.map((data) => ScheduleModel(data)).toList();
    return this.schedule;
  }
}

class ScheduleModel {
  final Schedule schedule;

  ScheduleModel(this.schedule);

  String get year {
    return this.schedule.year.toString() ?? "";
  }

  String get gameState {
    return this.schedule.game_state ?? "";
    // return timeago.format(DateTime.parse(this.schedule.game_state),
    //     locale: 'en_short');
  }

  String get gameStatus {
    return this.schedule.stt ?? "";
    // if(this.schedule.stt)
    // return this.schedule.stt;
    // return timeago.format(DateTime.parse(this.schedule.game_state),
    //     locale: 'en_short');
  }

  String get gameTime {
    // return this.schedule.gameTime
    return timeago.format(DateTime.parse(this.schedule.gametime),
        locale: 'en_short');
  }

  String get homeTeamName {
    return this.schedule.h["tn"] ?? "";
  }

  String get homeTeamScore {
    return this.schedule.h["s"] ?? "";
  }

  String get homeTeamRecord {
    return this.schedule.h["re"] ?? "";
  }

  String get visitorTeamName {
    return this.schedule.v["tn"] ?? "";
  }

  String get visitorTeamScore {
    return this.schedule.v["s"] ?? "";
  }

  String get visitorTeamRecord {
    return this.schedule.v["re"] ?? "";
  }
}
