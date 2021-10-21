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
          return ScoreCarousel(
            data: snapshot.data,
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
