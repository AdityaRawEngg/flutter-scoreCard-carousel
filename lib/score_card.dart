library score_card;

import 'package:flutter/material.dart';
import 'package:score_card/modelView/scheduleVm.dart';
import 'package:score_card/view/scoreCarousel.dart';

class ScoreCard extends StatelessWidget {
  final String sport_key, env_key;
  ScoreCard({this.env_key, this.sport_key});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // future: fetchWidgetsData("https://0696-103-171-6-215.ngrok.io/"),
      future:
          ScheduleVM().fetchSchedule(env_key: env_key, sport_key: sport_key),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          List<ScheduleModel> data = [];
          for (var i = 1; i < 4; i++) {
            try {
              data.add(snapshot.data.firstWhere((element) =>
                  element.gameState != "tbd" &&
                  element.gameStatus == i.toString()));
            } catch (e) {
              data.add(snapshot.data.firstWhere((element) =>
                  element.gameState != "tbd" && element.gameStatus == "1"));
            }
          }
          data.sort((a, b) => a.gameStatus.compareTo(b.gameStatus));
          return ScoreCarousel(
            data: data,
          );
        } else if (snapshot.hasError) {
          print(snapshot.error);
          return Text("Some error has occured");
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
