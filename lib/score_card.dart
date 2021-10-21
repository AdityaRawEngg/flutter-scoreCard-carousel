library score_card;

import 'package:flutter/material.dart';
import 'package:score_card/modelView/scheduleVm.dart';
import 'package:score_card/view/scoreCarousel.dart';

class ScoreCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // future: fetchWidgetsData("https://0696-103-171-6-215.ngrok.io/"),
      future: ScheduleVM().fetchSchedule(),
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
