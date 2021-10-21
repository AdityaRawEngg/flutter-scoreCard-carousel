import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:page_view_indicators/page_view_indicators.dart';
import 'package:score_card/modelView/scheduleVm.dart';
import 'package:score_card/view/scoreCarouselItem.dart';

class ScoreCarousel extends StatefulWidget {
  final List<ScheduleModel> data;
  const ScoreCarousel({Key key, this.data}) : super(key: key);

  @override
  _ScoreCarouselState createState() => _ScoreCarouselState();
}

class _ScoreCarouselState extends State<ScoreCarousel> {
  final _currentPageNotifier = ValueNotifier<int>(0);
  int currentIndex = 0;
  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    print("Data of widget");
    print(widget.data[currentIndex].visitorTeamName);
    print(widget.data[currentIndex].gameTime);
    print(widget.data[currentIndex].gameStatus);
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 140.0,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 5.0)]),
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: 140.0,
                child: CarouselSlider(
                  carouselController: _controller,
                  options: CarouselOptions(
                      autoPlayInterval: Duration(seconds: 5),
                      // autoPlayAnimationDuration: Duration(seconds: 2),
                      initialPage: currentIndex,
                      autoPlay: true,
                      viewportFraction: 1,
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentIndex = index;
                          _currentPageNotifier.value = index;
                        });
                      }),
                  items: [
                    for (int i = 0; i < 3; i++)
                      ScoreCarouselItem(
                        homeScore: widget.data[currentIndex].homeTeamScore,
                        homeRecord: widget.data[currentIndex].homeTeamRecord,
                        visitorRecord:
                            widget.data[currentIndex].visitorTeamRecord,
                        visitorScore:
                            widget.data[currentIndex].visitorTeamScore,
                        gameTime: widget.data[currentIndex].gameTime,
                        gameStatus: widget.data[currentIndex].gameStatus,
                        gameState: widget.data[currentIndex].gameState,
                      )
                  ],
                ),
              ),
              Positioned(
                  left: 0.0,
                  right: 0.0,
                  bottom: 0.0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CirclePageIndicator(
                      dotSpacing: 3.0,
                      size: 5.0,
                      selectedSize: 5.0,
                      itemCount: 3,
                      currentPageNotifier: _currentPageNotifier,
                    ),
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
