import 'package:flutter/material.dart';

class TaskCard extends StatefulWidget {
  const TaskCard();

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  bool isCheck = false;
  Color getcheckboxcolor(Set<WidgetState> states) {
    '''
this function is a widgetstate constraint used to get statecolor

''';
    const Set<WidgetState> interactwithstate = <WidgetState>{
      WidgetState.selected,
    };
    if (states.any(interactwithstate.contains)) {
      return Color(0xFF5AC578);
    }
    return Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Text("Today's Tasks", style: TextStyle(fontSize: 18)),
              Positioned(
                top: 5,
                child: Container(
                  height: 100,
                  width: 4,
                  decoration: BoxDecoration(
                    color: Color(0xFFEF4444),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              Card(
                elevation: 0,
                color: Color(0xFFFFFFFF),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Transform.scale(
                              scale: 1.2,
                              child: Checkbox(
                                fillColor: WidgetStateColor.resolveWith((s) {
                                  return getcheckboxcolor(s);
                                }),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadiusGeometry.circular(
                                    5,
                                  ),
                                ),
                                side: BorderSide(
                                  color: Color(0xFFC89FF5),
                                  style: BorderStyle.solid,
                                ),
                                value: isCheck,
                                onChanged: (bool? s) {
                                  return setState(() {
                                    isCheck = s!;
                                  });
                                },
                              ),
                            ),

                            Text(
                              'FInish project proposal',
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15),
                        child: Text(
                          'Write sections 2-4 and  executive summary',
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        margin: EdgeInsets.only(left: 15),
                        child: Row(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              height: 23,
                              width: 90,
                              decoration: BoxDecoration(
                                color: Color(0xFFFFDCDC),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text('High Priority'),
                            ),
                            SizedBox(width: 30),
                            Text('Work'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
    ;
  }
}
