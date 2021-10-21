import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:score_card/model/scheduleModel.dart';

class ScheduleService {
  // static const platform = const MethodChannel('com.example.heat_v1/service');
  // List<News> news = [];

  Future<List<dynamic>> getSchedule() async {
    // final newslist = await platform.invokeMethod('newsfeed');
    final response = await http.get(
      Uri.parse(
          'http://api.digitalfanexperience.com/v1/nba/app/graphql?device=ios&version=1.0.0&query={schedules(,year:2021,season_id:"01",league_id:"00"){year,gametime,game_state,stt,v{tn,s,re},h{tn,s,re}}}'),
      headers: {"sport_key": "dfeeb180681a61d609a", "env_key": "dev"},
    );
    print("object");

    final result = jsonDecode(response.body);
    print(result);

    return result["data"]["schedules"]
        .map<Schedule>((json) => Schedule.fromJson(json))
        .toList();
  }
}
