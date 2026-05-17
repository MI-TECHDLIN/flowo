import 'package:flowo/constants/constant.dart';
import 'package:flutter/material.dart';

class AiCard extends StatelessWidget {
  const AiCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          bottom: 0,
          right: 63,
          child: Container(
            width: 320,
            height: 120,
            decoration: BoxDecoration(
              color: Color(0xffE86E6E),
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
        Card(
          shadowColor: Colors.white,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 119,
                width: 320,
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 60),
                      alignment: Alignment.center,
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xffC89FF5),
                      ),
                      child: Text(
                        '1',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Finish project proposal',
                            style: TextStyle(
                              color: Color(0xff2D3E50),
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            alignment: Alignment.topLeft,

                            height: 40,
                            width: 208,
                            child: Text(
                              capitlaise(
                                ' Due today  and blocking client review -- finishing this clears the biggest task on your plate. ',
                              ),
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Container(
                                height: 20,
                                width: 65,
                                decoration: BoxDecoration(
                                  color: Color(0xffF1F4F8),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  children: [
                                    Icon(Icons.access_time, size: 14),
                                    SizedBox(child: Text('45 mins')),
                                  ],
                                ),
                              ),
                              SizedBox(width: 20),
                              Container(
                                alignment: Alignment.center,
                                width: 60,
                                height: 20,

                                decoration: BoxDecoration(
                                  color: Color(0xffFDE2E2),

                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.adjust_outlined, size: 13),
                                    SizedBox(width: 2),

                                    SizedBox(child: Text('High')),
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
            ],
          ),
        ),
      ],
    );
  }
}
