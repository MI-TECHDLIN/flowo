import 'package:flowo/data/models/task_model.dart';
import 'package:flowo/features/tasks/taskfunctions.dart';
import 'package:flowo/features/tasks/widgets/task_/task_priority.dart';
import 'package:flowo/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TaskCard extends StatelessWidget {
  TaskCard({required this.task});
  final TaskModel task;

  String decript(TaskModel t) {
    final des = t.description;
    if (des.isEmpty) return '';
    return des;
  }

  Color headcolor(int priority) {
    if (priority == 3)
      return Color(0xffEF4444);
    else if (priority == 2)
      return Color(0xffF5A34A);
    else if (priority == 1)
      return Color(0xff5AC578);
    return Colors.grey;
  }

  Color textcolor(int priority) {
    if (priority == 3)
      return Color(0xffEF4444);
    else if (priority == 2)
      return Color(0xffF5A34A);
    else if (priority == 1)
      return Color(0xff6B7C8F);
    return Colors.grey;
  }

  Color bgcolor(int priority) {
    if (priority == 3)
      return Color(0xffFFDCDC);
    else if (priority == 2)
      return Color(0xffFFEDD5);
    else if (priority == 1)
      return Color(0xffF5F8FA);
    return Colors.grey;
  }

  String textpriority(int priority) {
    switch (priority) {
      case 1:
        return 'Low';
      case 2:
        return 'Medium';
      case 3:
        return "High Priority";
      default:
        return 'Normal';
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
      key: Key(task.id),
      padding: EdgeInsets.only(left: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Positioned(
                top: 5,
                child: Container(
                  height: 100,
                  width: 4,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),

              Card(
                elevation: 0,
                color: Color(0x6EFFFFFF),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
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

                        Text(task.title, style: TextStyle(fontSize: 18)),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Text(decript(task)),
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
                              color: bgcolor(task.priority),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              textpriority(task.priority),
                              style: TextStyle(color: textcolor(task.priority)),
                            ),
                          ),
                          SizedBox(width: 30),
                          Text('Work'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
