//TODO: try get a better progress widget this is good but no efficent
//TODO: in prod ship a new feature for a only minute time sugeestion or only hour time suggestiion
import 'dart:async';

import 'package:flowo/constants/constant.dart';
import 'package:flowo/features/timer/timer_card.dart';
import 'package:flutter/material.dart';
import 'package:goal_progress_indicator/goal_progress_indicator.dart';

class FocusTimer extends StatefulWidget {
  const FocusTimer({super.key});

  @override
  State<FocusTimer> createState() => _focustimerState();
}

class _focustimerState extends State<FocusTimer> {
  int initialseconds = 10800;

  int get minutes => initialseconds ~/ 60;

  int get hours => minutes ~/ 60;

  int get rminutes => minutes % 60;
  Timer? timer;
  // bool iscounting = false;
  void countdownfunc() {
    timer = Timer.periodic(Duration(seconds: 1), (v) {
      '''
for a start working a simple implementation fecth
from seconds and parse and converts to hour and minutes:
getters would only display hours and mins for now the app is getting busy
''';

      setState(() {
        if (initialseconds > 0 || timer != null) {
          initialseconds--;
          // iscounting = true;
          print(initialseconds);
        } else if (initialseconds == 0) {
          timer!.cancel();
        }
      });
    });
  }

  Widget conu = SingleChildScrollView(
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
                  iconwidget(
                    Icons.device_hub_rounded,
                    'Est. 90 mins',
                    color: 0xffF5A34A,
                  ),
                ],
              ),
            ],
          ),

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
                    Expanded(
                      flex: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                height: 96,
                                width: 120,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color(0x82F3E8FF),
                                ),

                                child: Text(
                                  '1',
                                  style: TextStyle(
                                    fontSize: 58,
                                    color: Color(0xffAA64DC),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(height: 4),
                              Text('hour'),
                            ],
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

                          Column(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                height: 96,
                                width: 120,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color(0x6CD3E8FF),
                                ),

                                child: Text(
                                  '38',
                                  style: TextStyle(
                                    fontSize: 58,
                                    color: Color(0xff3CA05A),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(height: 4),
                              Text('min'),
                            ],
                          ),
                        ],
                      ),
                    ),
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
                          Text('25 min session'),

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
                          Text('75 min total remaining'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.symmetric(vertical: 18, horizontal: 12),
            child: Column(
              children: [
                Text('Session progress', style: TextStyle(fontSize: 16)),
              ],
            ),
          ),

          GoalProgressIndicator(
            showLabels: false,
            showMilestoneCircles: false,
            startValue: 0,
            currentValue: 49,
            targetValue: 50,
            style: GoalProgressIndicatorStyles.gradient(
              colors: [Color(0xffAA64DC0), Color(0xffC89FF5)],
            ),
          ),
        ],
      ),
    ),
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    countdownfunc();
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

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 280,
                  width: 280,
                  child: CircularProgressIndicator(),
                ),
                Text(
                  '$hours h :$rminutes min',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 45),
                ),
                SizedBox(height: 30),
              ],
            ),
            SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue,
                  ),
                  width: 50,
                  child: Icon(Icons.play_arrow, size: 40, color: Colors.white),
                ),
                SizedBox(width: 20),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue,
                  ),
                  width: 50,
                  child: Icon(Icons.stop, size: 35, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
