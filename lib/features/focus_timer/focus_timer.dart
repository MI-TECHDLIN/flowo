import 'package:flowo/constants/constant.dart';
import 'package:flutter/material.dart';

class FocusTimer extends StatefulWidget {
  const FocusTimer({super.key});

  @override
  State<FocusTimer> createState() => _focustimerState();
}

class _focustimerState extends State<FocusTimer> {
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
                height: 277,
                width: 390,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                  surfaceTintColor: const Color.fromARGB(141, 255, 255, 255),
                  shadowColor: const Color(0x00FFFFFF),
                  color: const Color(0xFFFFFFFF),

                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
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
                              Text('Remaining'),
                            ],
                          ),
                        ),
                        Expanded(
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
                                        fontSize: 50,
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
                            children: [Icon(Icons.timer_sharp)],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
