import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ScoreCarouselItem extends StatelessWidget {
  final String homeScore,
      homeRecord,
      visitorScore,
      visitorRecord,
      gameTime,
      gameStatus,
      gameState;

  const ScoreCarouselItem(
      {Key key,
      this.homeRecord,
      this.homeScore,
      this.visitorRecord,
      this.visitorScore,
      this.gameTime,
      this.gameStatus,
      this.gameState})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(gameStatus);
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
                    homeScore,
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
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        'some logo'.toUpperCase(),
                        style: TextStyle(fontSize: 12),
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
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        '$gameStatus | $gameTime',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        'HOME',
                        style: TextStyle(
                            fontSize: 11,
                            color: Color(
                              0xffFF868E96,
                            ),
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        'TNT OT-> BALLY SPORTS SUN',
                        style: TextStyle(
                          fontSize: 9,
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
                    visitorScore,
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
