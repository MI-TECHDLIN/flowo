import 'package:flowo/constants/constant.dart';
import 'package:flutter/material.dart';

class AiSuggestionScreen extends StatelessWidget {
  const AiSuggestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.fromLTRB(20, 0, 20, 0),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(child: Text("Today's Focus")),
              SizedBox(height: 15),
              Center(
                child: Container(
                  height: 220,
                  width: 355,

                  decoration: BoxDecoration(
                    color: Color(0x90F3E8FF),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Color(0xffD4B5F5), width: 2.0),
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 20, 0, 6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              height: 32,
                              width: 80,
                              decoration: BoxDecoration(
                                color: Color(0xBEBB90E9),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: whitetext('Top Pick', 15),
                            ),
                            Container(
                              height: 30,
                              width: 85,
                              decoration: BoxDecoration(
                                color: Color(0xA3FFFFFF),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.alarm, size: 15),
                                  SizedBox(width: 3),
                                  Text(
                                    '45 mins',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(15, 0, 10, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            blacktext(
                              'Finish project proposal',
                              22,
                              color: 0xff2D3E50,
                            ),
                            SizedBox(height: 5),
                            blacktext(
                              'This is your highest-priority task due today.',
                              14,
                              color: 0x916B7C8F,
                            ),
                            blacktext(
                              'Completing it firstwill free up mental energy for the rest of the day.',
                              14,
                              color: 0x916B7C8F,
                            ),

                            Container(
                              margin: EdgeInsets.only(top: 11),
                              height: 44,
                              width: 310,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: WidgetStatePropertyAll(
                                    Color(0xffC89FF5),
                                  ),
                                ),
                                onPressed: null,
                                child: whitetext('Start this task', 16),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              blacktext('Other Suggestions', 20),
              SizedBox(height: 10),
              Container(
                height: 115,
                width: 350,
                decoration: BoxDecoration(color: Color(0xffFFFFFF)),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 75),
                      alignment: Alignment.center,
                      height: 35,

                      decoration: BoxDecoration(
                        color: Color(0xfFa8d8f0),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      width: 35,
                      child: blacktext('2', 18),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        blacktext('Review design mockups', 20),

                        SizedBox(
                          width: 295,
                          child: Text(
                            'Blocking the team -- unblocking the fress up 3 others',

                            maxLines: 10,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          height: 35,
                          width: 115,
                          decoration: BoxDecoration(
                            color: Color(0xC2A8D8F0),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.access_time_rounded),
                              Text('40 mins'),
                            ],
                          ),
                        ),
                      ],
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
