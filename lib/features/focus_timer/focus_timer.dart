//TODO: try get a better progress widget this is good but no efficent
//TODO: in prod ship a new feature for a only minute time sugeestion or only hour time suggestiion
//TODO: currently using seststae() for rebuilds migrate latert o change notifier
import 'package:flowo/data/models/task_model.dart';
import 'package:flowo/features/focus_timer/reusable_btn.dart';
import 'dart:async';
import 'package:flowo/constants/constant.dart';
import 'package:flowo/features/focus_timer/time_card.dart';
import 'package:flowo/features/tasks/task_functions.dart';
import 'package:flutter/material.dart';
import 'package:goal_progress_indicator/goal_progress_indicator.dart';
import 'package:flowo/features/focus_timer/play_card.dart';
import 'package:provider/provider.dart';

class FocusTimer extends StatefulWidget {
  const FocusTimer({super.key, required this.task});
  final TaskModel task;

  @override
  State<FocusTimer> createState() => _focustimerState();
}

class _focustimerState extends State<FocusTimer> {
  //late since it is a stateful widget it would be iitialized later
  late int statevalue;
  late int conv = statevalue * 60;
  late int totalseconds = conv;
  late int sessionseconds = conv;

  ///static
  late int constsec = conv;
  late int consttotalmin = constsec ~/ 60;
  late int constmin = (constsec ~/ 60) % 60;
  late int consthour = constsec ~/ 3600;

  //dynamic
  int get minutes => totalseconds ~/ 60;
  int get diffmin => consttotalmin - minutes;
  int get hours {
    return minutes ~/ 60;
  }

  //remaining minutes............
  int get rminutes => minutes % 60;

  //bool
  bool iscounting = false;

  //timer
  Timer? timer;
  //taskbreak
  Widget take_break() {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        if (iscounting) {
          pause();
        }
      },
      child: Container(
        height: 40,
        padding: const EdgeInsets.symmetric(horizontal: 14),
        decoration: BoxDecoration(
          color: const Color.fromARGB(133, 200, 240, 220),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.free_breakfast_outlined,
              size: 16,
              color: Color(0xff3CA05A),
            ),
            SizedBox(width: 6),
            Text(
              'Take a break',
              style: TextStyle(
                color: Color(0xff3CA05A),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  //minutes_conditions
  String mincondition(int min) {
    if (min <= 9) {
      return '0$min';
    }
    return '$min';
  }

  //dialog function on called;
  Future<void> showplaydialog() {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xffFFDCDC),
                  borderRadius: BorderRadius.circular(30),
                ),
                height: 60,
                width: 60,
                child: const Icon(
                  Icons.stop_outlined,
                  color: Color(0xB4EF4444),
                  size: 40,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'End this session?',
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xff2D3E50),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'You still have $hours:${mincondition(rminutes)} left. Ending will reset the focus time.',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 15,
                  color: Color(0xff687C8F),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: resuablebutton(
                      function: () {
                        Navigator.pop(context);
                      },
                      bgcolor: 0xffC89FF5,
                      textcolor: 0xffFFFFFF,
                      iconcolor: 0xffFFFFFF,
                      icondata: Icons.play_arrow_outlined,
                      label: 'Keep going',
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: resuablebutton(
                      function: () {
                        stop();
                        setState(() {
                          totalseconds = sessionseconds;
                        });
                        Navigator.pop(context);
                      },
                      bgcolor: 0xffFFDCDC,
                      textcolor: 0xffEF4444,
                      iconcolor: 0xffEF4444,
                      icondata: Icons.stop,
                      label: 'End Session',
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  //id_finder for getting index
  String getIndexByiD(List<TaskModel> tasks, String id) {
    for (int i = 0; i < tasks.length; i++) {
      if (id == tasks[i].id) return i.toString();
    }
    return id;
  }

  //stop function for playcard
  void stop() {
    setState(() {
      timer!.cancel();
      timer = null;
      totalseconds = sessionseconds;
      iscounting = false;
    });
  }

  //playfunction for playcard
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

  //pause function for playcard;
  void pause() {
    setState(() {
      timer!.cancel();
      iscounting = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    statevalue = widget.task.duration!.toInt();
  }

  @override
  Widget build(BuildContext context) {
    //controller
    final id = widget.task.id;
    final controller = context.watch<TaskController>();
    final todos = controller.activetasks + controller.completeedtasks;
    final totalCount = todos.length;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFFFF),
        shadowColor: Color(0xffFFFFFF),
        elevation: 1,
        toolbarHeight: 70,
        leadingWidth: 80,
        leading: Padding(
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
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 25),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Container(
                key: Key(widget.task.id),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 6,
                      runSpacing: 4,
                      children: [
                        Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                            color: const Color(0xffEF4444),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        blacktext(
                          'Currently focusing on',
                          17,
                          color: 0xff6B7C8f,
                        ),
                        taskwidget(
                          bgcolor(widget.task.priority),
                          textcolor(widget.task.priority),
                          textpriority(widget.task.priority),
                        ),
                      ],
                    ),

                    const SizedBox(height: 4),

                    Text(
                      capitlaise(widget.task.title),
                      style: const TextStyle(
                        color: Color(0xff2D3E50),
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 16,
                      runSpacing: 6,
                      children: [
                        iconwidget(
                          Icons.access_time,
                          'Due ${widget.task.time}',
                          color: 0xffC89FF5,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.device_hub_rounded,
                              color: Color(0xffF5A34A),
                              size: 17,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              constmin <= 60 || consthour <= 0
                                  ? 'Est. $constmin min'
                                  : 'Est. $consthour hour $constmin min',
                              style: const TextStyle(
                                fontSize: 15,
                                color: Color(0xff6B7C8F),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              //time card
              Container(
                margin: const EdgeInsets.only(top: 25),
                height: 250,
                width: double.infinity,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                  elevation: 2,
                  surfaceTintColor: const Color.fromARGB(141, 255, 255, 255),
                  shadowColor: const Color(0x46FFFFFF),
                  color: const Color(0xFFFFFFFF),

                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        //sessions
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 9,
                              width: 9,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: const Color(0xff5AC578),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Session ${getIndexByiD(todos, id)} of $totalCount',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Color(0xff2D3E50),
                                fontWeight: FontWeight.w500,
                              ),
                            ),

                            Container(
                              margin: const EdgeInsets.symmetric(
                                vertical: 0,
                                horizontal: 8,
                              ),
                              width: 5,
                              height: 5,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: const Color(0xff6B7C8f),
                              ),
                            ),
                            Text(
                              iscounting ? 'Running' : 'Paused',
                              style: TextStyle(
                                fontSize: 14,
                                color: iscounting ? const Color(0xff5AC578) : const Color(0xff6B7C8F),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        //hour-min widget
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            //hour
                            timewidget(
                              '$hours',
                              'hour',
                              0xffF3E8FF,
                              0xffAA64DC,
                            ),

                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 10),
                              padding: const EdgeInsets.only(bottom: 22),
                              child: const Text(
                                ':',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 38,
                                  color: Color(0xffC89FF5),
                                ),
                              ),
                            ),
                            //min
                            timewidget(
                              mincondition(rminutes),
                              'min',
                              0xffE8F6EE,
                              0xff3CA05A,
                            ),
                          ],
                        ),
                        //time header
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.timer_sharp,
                              color: Color(0xffC89FF5),
                              size: 15,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              '$diffmin min session',
                              style: const TextStyle(
                                fontSize: 13,
                                color: Color(0xff6B7C8F),
                              ),
                            ),
                            Container(
                              height: 5,
                              width: 5,
                              decoration: BoxDecoration(
                                color: const Color(0xff6B7C8F),
                                borderRadius: BorderRadius.circular(2),
                              ),
                              margin: const EdgeInsets.symmetric(
                                vertical: 0,
                                horizontal: 7,
                              ),
                            ),
                            Text(
                              '$consttotalmin min total remaining',
                              style: const TextStyle(
                                fontSize: 13,
                                color: Color(0xff6B7C8F),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              //time progress indicator
              Container(
                margin: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Session progress', style: TextStyle(fontSize: 18)),
                    const SizedBox(height: 10),
                    GoalProgressIndicator(
                      showLabels: false,
                      showMilestoneCircles: false,
                      startValue: 0,
                      currentValue: diffmin.toDouble(),
                      targetValue: consttotalmin.toDouble(),
                      style: GoalProgressIndicatorStyles.gradient(
                        colors: const [Color(0xffAA64DC), Color(0xffC89FF5)],
                      ),
                    ),
                  ],
                ),
              ),

              //take a break button
              Container(
                margin: const EdgeInsets.only(top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    take_break(),
                    const SizedBox(width: 14),
                    //break playcard....
                    PlayCard(
                      ontap: () {
                        if (!iscounting) {
                          play();
                        } else {
                          pause();
                        }
                      },
                      !iscounting
                          ? Icons.play_arrow
                          : Icons.pause_outlined,
                    ),

                    const SizedBox(width: 14),

                    //stop
                    PlayCard(
                      ontap: () {
                        setState(() {
                          iscounting = false;
                        });

                        showplaydialog();
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
