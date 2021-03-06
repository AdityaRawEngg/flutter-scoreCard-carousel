import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:score_card/model/scheduleModel.dart';

class ScheduleService {
  // static const platform = const MethodChannel('com.example.heat_v1/service');
  // List<News> news = [];

  Future<List<dynamic>> getSchedule({String sport_key, String env_key}) async {
    // final newslist = await platform.invokeMethod('newsfeed');
    final response = await http.get(
      Uri.parse(
          'http://api.digitalfanexperience.com/v1/nba/app/graphql?device=ios&version=1.0.0&query={schedules(league_id: "00", year: 2021, tid: "1610612748"){uid,year,gametime,arena_name,st,logo_url,game_state,h{tid,re,s,tn},v{tid,re,s,tn}}}'),
      headers: {"sport_key": sport_key, "env_key": env_key},
    );
    // print("object");

    final result = jsonDecode(response.body);
    // print(result);

    return result["data"]["schedules"]
        .map<Schedule>((json) => Schedule.fromJson(json))
        .toList();
  }
}
