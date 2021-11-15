import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ScoreCarouselItem extends StatelessWidget {
  final String homeScore,
      homeRecord,
      visitorScore,
      visitorRecord,
      gameTime,
      gameStatus,
      gameState,
      homeTeamName,
      visitorTeamName,
      arena_name;

  const ScoreCarouselItem(
      {Key key,
      this.homeRecord,
      this.homeScore,
      this.visitorRecord,
      this.visitorScore,
      this.gameTime,
      this.gameStatus,
      this.gameState,
      this.homeTeamName,
      this.visitorTeamName,
      this.arena_name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Team Name");
    print(gameState);
    return Container(
      height: 140.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            flex: 1,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    homeScore ?? homeTeamName,
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SvgPicture.asset('assets/images/logo1.svg'),
                  ),
                  Text(
                    homeRecord,
                    style: TextStyle(
                        fontSize: 11.0,
                        color: Color(0xffFF6C7680),
                        fontWeight: FontWeight.w700),
                  )
                ],
              ),
            ),
          ),
          Expanded(
              flex: 3,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Padding(
                    //   padding: const EdgeInsets.only(top: 8.0),
                    //   child: Text(
                    //     'some logo'.toUpperCase(),
                    //     style: TextStyle(fontSize: 12),
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        'some logo'.toUpperCase(),
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'OpenSans',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        gameState == "active"
                            ? 'LIVE'
                            : gameState.toString().toUpperCase(),
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.red,
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        '$gameStatus | $gameTime',
                        style: TextStyle(fontSize: 16, letterSpacing: -1),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        homeTeamName == "Heat" ? "HOME" : "AWAY",
                        style: TextStyle(
                            fontSize: 11,
                            fontFamily: 'OpenSans',
                            color: Color(
                              0xffFF868E96,
                            ),
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        arena_name,
                        style: TextStyle(
                          fontSize: 9,
                          fontFamily: 'OpenSans',
                          color: Color(0xffFFADB5BD),
                        ),
                      ),
                    )
                  ],
                ),
              )),
          Flexible(
            flex: 1,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    visitorScore != null ? visitorScore : visitorTeamName,
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SvgPicture.asset('assets/images/logo1.svg'),
                  ),
                  Text(
                    visitorRecord,
                    style: TextStyle(
                        fontSize: 11.0,
                        color: Color(0xffFF6C7680),
                        fontWeight: FontWeight.w700),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
