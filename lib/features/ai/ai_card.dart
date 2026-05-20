import 'package:flowo/constants/constant.dart';
import 'package:flutter/material.dart';

class AiCard extends StatelessWidget {
  AiCard({
    super.key,
    required this.index,
    required this.title,
    required this.reasoning,
    required this.estimatedEffort,
    required this.impactlevel,
  });
  int index;
  String title;
  String reasoning;
  String estimatedEffort;
  String impactlevel;

  /// imported this from constant because of import path issue
  int stringpriority(String priority) {
    switch (priority) {
      case 'Low':
        return 1;
      case 'Medium':
        return 2;
      case 'High':
        return 3;
      default:
        return 2;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            bottom: 0,
            right: 63,
            child: Container(
              width: 320,
              height: 120,
              decoration: BoxDecoration(
                color: textcolor(stringpriority(impactlevel)),
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
                          '$index',
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
                            SizedBox(
                              height: 30,
                              width: 250,
                              child: Text(
                                capitlaise(title),
                                overflow: TextOverflow.ellipsis,

                                //overflow feature for too much text
                                maxLines: 1,

                                style: TextStyle(
                                  color: Color(0xff2D3E50),
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.topLeft,

                              height: 40,
                              width: 208,
                              child: Text(
                                capitlaise(reasoning),
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                Container(
                                  height: 20,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    color: Color(0xffF1F4F8),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.access_time, size: 14),
                                      SizedBox(child: Text(estimatedEffort)),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 20),
                                Container(
                                  alignment: Alignment.center,
                                  width: 80,
                                  height: 20,

                                  decoration: BoxDecoration(
                                    color: bgcolor(stringpriority(impactlevel)),

                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        child: Text(
                                          impactlevel,
                                          style: TextStyle(
                                            color: textcolor(
                                              stringpriority(impactlevel),
                                            ),
                                          ),
                                        ),
                                      ),
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
      ),
    );
  }
}
