//TODO: try get a better progress widget this is good but no efficent
//TODO: in prod ship a new feature for a only minute time sugeestion or only hour time suggestiion
//TODO: currently using seststae() for rebuilds migrate latert o change notifier
import 'dart:async';
import 'package:flowo/constants/constant.dart';
import 'package:flowo/features/focus_timer/time_card.dart';
import 'package:flutter/material.dart';
import 'package:goal_progress_indicator/goal_progress_indicator.dart';
import 'package:flowo/features/focus_timer/play_card.dart';

class FocusTimer extends StatefulWidget {
  const FocusTimer({super.key});

  @override
  State<FocusTimer> createState() => _focustimerState();
}

class _focustimerState extends State<FocusTimer> {
  int totalseconds = 10800;
  int sessionseconds = 10800;

  ///static
  static int constsec = 10800;
  static int consttotalmin = constsec ~/ 60;
  static int constmin = (constsec ~/ 60) % 60;
  static int consthour = constsec ~/ 3600;

  //dynamic
  int get minutes => totalseconds ~/ 60;
  int get diffmin => consttotalmin - minutes;
  int get hours {
    return minutes ~/ 60;
  }

  int get rminutes => minutes % 60;
  bool iscounting = false;
  Timer? timer;
  // bool iscounting = false;

  void stop() {
    setState(() {
      timer!.cancel();
      timer = null;
      totalseconds = sessionseconds;
      iscounting = false;
    });
  }

  void play() {
    timer = Timer.periodic(Duration(seconds: 1), (v) {
      '''
for a start working a simple implementation fecth
from seconds and parse and converts to hour and minutes:
getters would only display hours and mins for now the app is getting busy
''';

      setState(() {
        if (totalseconds > 0 || timer != null) {
          totalseconds--;
          iscounting = true;
        } else if (totalseconds == 0) {
          timer!.cancel();
          iscounting = false;
          timer = null;
          totalseconds = constsec;
        }
      });
    });
  }

  void pause() {
    setState(() {
      timer!.cancel();
      timer = null;
      iscounting = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFFFF),
        shadowColor: Color(0xffFFFFFF),
        elevation: 1,
        toolbarHeight: 70,
        leadingWidth: 80,
        leading: Container(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 5, 5, 8),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(17),
              ),
              elevation: 5,
              color: Color(0xffF3E8FF),

              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.arrow_back_rounded, color: Color(0xffAA64DC)),
              ),
            ),
          ),
        ),

        title: Text('Focus Timer'),
        centerTitle: true,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 20),
            alignment: Alignment.center,
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              color: Color(0xffF3E8FF),
              borderRadius: BorderRadius.circular(15),
            ),
            child: IconButton(
              onPressed: null,
              icon: Icon(Icons.more_horiz_rounded),
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 20, 20, 0),
          child: Column(
            children: [
              SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 10,

                        width: 10,
                        decoration: BoxDecoration(
                          color: Color(0xffEF4444),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      SizedBox(width: 5),
                      blacktext('Currently focusing on', 17, color: 0xff6B7C8f),
                      SizedBox(width: 5),
                      taskwidget(0xffFFDCDC, 0xfffEF4444, 'High Priority'),
                    ],
                  ),

                  SizedBox(height: 1),

                  Text(
                    'Finish project proposal',
                    style: TextStyle(
                      color: Color(0xff2D3E50),
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      iconwidget(
                        Icons.access_time,
                        'Due 9:00 AM',
                        color: 0xffC89FF5,
                      ),
                      SizedBox(width: 20),
                      Container(
                        height: 20,
                        child: Row(
                          children: [
                            Icon(
                              Icons.device_hub_rounded,
                              color: Color(0xffF5A34A),
                              size: 17,
                            ),

                            Text(
                              constmin == 0 || consthour >= 1
                                  ? 'Est. $consthour hours '
                                  : 'Est. $consthour hour $constmin min',
                              style: TextStyle(
                                fontSize: 17,
                                color: Color(0xff6B7C8F),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              //time card
              Container(
                margin: EdgeInsets.only(top: 25),
                height: 260,
                width: 390,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                  elevation: 2,
                  surfaceTintColor: const Color.fromARGB(141, 255, 255, 255),
                  shadowColor: const Color(0x46FFFFFF),
                  color: const Color(0xFFFFFFFF),

                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //sessions
                        Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 9,
                                width: 9,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Color(0xff5AC578),
                                ),
                              ),
                              SizedBox(width: 8),
                              Text('Session 2 of 4'),

                              Container(
                                margin: EdgeInsets.symmetric(
                                  vertical: 0,
                                  horizontal: 8,
                                ),
                                width: 5,
                                height: 5,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Color(0xff6B7C8f),
                                ),
                              ),
                              Text('Running'),
                            ],
                          ),
                        ),
                        //hour-min widget
                        Expanded(
                          flex: 2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              //hour
                              timewidget(
                                '$hours',
                                'hour',
                                0xffF3E8FF,
                                0xffAA64DC,
                              ),

                              Container(
                                margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                child: Text(
                                  ':',
                                  style: TextStyle(
                                    letterSpacing: 3,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 40,
                                    color: Color(0xffC89FF5),
                                  ),
                                ),
                              ),
                              //min
                              timewidget(
                                '$rminutes',
                                'min',
                                0xffE8F6EE,
                                0xff3CA05A,
                              ),
                            ],
                          ),
                        ),
                        //time header
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.timer_sharp,
                                color: Color(0xffC89FF5),
                                size: 15,
                              ),
                              SizedBox(width: 5),
                              Text('$totalseconds min session'),
                              Container(
                                height: 5,
                                width: 5,
                                decoration: BoxDecoration(
                                  color: Color(0xff6B7C8F),
                                  borderRadius: BorderRadius.circular(2),
                                ),
                                margin: EdgeInsets.symmetric(
                                  vertical: 0,
                                  horizontal: 7,
                                ),
                              ),
                              Text('$consttotalmin min total remaining'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              //time progress indicator
              Container(
                margin: EdgeInsets.symmetric(vertical: 18, horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Session progress', style: TextStyle(fontSize: 18)),
                    SizedBox(height: 10),
                    GoalProgressIndicator(
                      showLabels: false,
                      showMilestoneCircles: false,
                      startValue: 0,
                      currentValue: diffmin.toDouble(),
                      targetValue: consttotalmin.toDouble(),
                      style: GoalProgressIndicatorStyles.gradient(
                        colors: [Color(0xffAA64DC0), Color(0xffC89FF5)],
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.only(right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Container(
                            height: 38,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(133, 200, 240, 220),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            width: 135,

                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Take a break',
                                  style: TextStyle(color: Color(0xff3CA05A)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10),

                    PlayCard(
                      ontap: () {
                        if (iscounting == false) {
                          play();
                        } else if (iscounting = true) {
                          pause();
                        } else {
                          null;
                        }
                      },
                      iscounting == false
                          ? Icons.play_arrow
                          : Icons.pause_outlined,
                    ),

                    SizedBox(width: 20),
                    PlayCard(
                      ontap: () {
                        Dialog(
                          child: Text('Are you sure want to end this session'),
                        );
                        iscounting == true ? stop() : null;
                      },
                      Icons.stop_outlined,
                      height: 53,
                      width: 53,
                      iconsize: 33,
                      bgcolor: 0xffFFDCDC,
                      iconcolor: 0xB4EF4444,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
