import 'package:flowo/constants/constant.dart';
import 'package:flowo/data/models/task_model.dart';
import 'package:flowo/features/focus_timer/focus_timer.dart';
import 'package:flowo/features/tasks/task_functions.dart';
import 'package:flowo/features/tasks/widgets/task_/task_priority.dart';
import 'package:flowo/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TaskCard extends StatelessWidget {
  TaskCard({required this.task});
  final TaskModel task;
  //decription_converter
  String decript(TaskModel t) {
    final des = t.description;
    if (des.isEmpty) return '';
    return des;
  }

  //head_color
  Color headcolor(int priority) {
    if (priority == 3)
      return Color(0xffEF4444);
    else if (priority == 2)
      return Color(0xffF5A34A);
    else if (priority == 1)
      return Color(0xff5AC578);
    return Colors.grey;
  }

  //duration_converter
  String duration_conv(int time) {
    int hour = time ~/ 60;
    int minuite = time % 60;
    if (time >= 60) {
      if (minuite <= 9) {
        return '$hour:0$minuite';
      }
      return '$hour:$minuite';
    } else {
      if (minuite <= 9) {
        return '$hour:0$minuite';
      }
      return '00:$minuite';
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.read<TaskController>();
    final color = headcolor(task.priority);
    bool isCheck = task.isCompleted;
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

    return Container(
      margin: EdgeInsets.only(bottom: 5),
      key: Key(task.id),
      padding: EdgeInsets.only(left: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              //iscompleted
              Positioned(
                top: 3,
                child: Container(
                  height: 118,
                  width: 4,
                  decoration: BoxDecoration(
                    color: task.isCompleted ? Color(0xff5AC578) : color,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),

              InkWell(
                onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (v) => FocusTimer(task: task)),
                  ),
                },
                child: Card(
                  elevation: 1,
                  shadowColor: const Color(0x52FFFFFF),
                  color: Color.fromARGB(251, 255, 255, 255),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          //checkbox
                          Transform.scale(
                            scale: 1.2,
                            child: Checkbox(
                              fillColor: WidgetStateColor.resolveWith((s) {
                                return getcheckboxcolor(s);
                              }),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadiusGeometry.circular(5),
                              ),
                              side: BorderSide(
                                color: Color(0xFFC89FF5),
                                style: BorderStyle.solid,
                              ),
                              value: isCheck,
                              onChanged: (_) =>
                                  controller.toggleTask(kTestUserId, task),
                            ),
                          ),

                          Text(
                            capitlaise(task.title),
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                      //decription
                      Container(
                        margin: EdgeInsets.fromLTRB(15, 0, 0, 4),
                        child: Text(
                          capitlaise(decript(task)),
                          style: TextStyle(),
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.fromLTRB(15, 2, 4, 15),
                        child: Row(
                          children: [
                            //TaskPriority
                            Container(
                              alignment: Alignment.center,
                              height: 23,
                              width: 90,
                              decoration: BoxDecoration(
                                color: task.isCompleted
                                    ? Color(0xffC8F0DC)
                                    : bgcolor(task.priority),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                textpriority(task.priority),
                                style: TextStyle(
                                  color: task.isCompleted
                                      ? Color(0xff5AC578)
                                      : textcolor(task.priority),
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            //tasktime && duration
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0x7BF3E8FF),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              height: 30,
                              width: 150,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    task.time,
                                    style: TextStyle(color: Color(0xffAA64DC)),
                                  ),
                                  SizedBox(width: 3),
                                  Text('·', style: TextStyle(fontSize: 22)),

                                  Container(
                                    margin: EdgeInsets.symmetric(
                                      horizontal: 4,

                                      vertical: 0,
                                    ),
                                    child: Icon(
                                      Icons.access_time,
                                      color: Color(0xffC89FF5),
                                      size: 15,
                                    ),
                                  ),

                                  Text(
                                    duration_conv(task.duration!.toInt()),
                                    style: TextStyle(
                                      color: Color(0xffAA64DC),
                                      fontWeight: FontWeight.w500,
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
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
