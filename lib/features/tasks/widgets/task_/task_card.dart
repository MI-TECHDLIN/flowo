import 'package:flowo/constants/constant.dart';
import 'package:flowo/data/models/task_model.dart';
import 'package:flowo/features/focus_timer/focus_timer.dart';
import 'package:flowo/features/tasks/task_functions.dart';
import 'package:flowo/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TaskCard extends StatefulWidget {
  const TaskCard({super.key, required this.task});
  final TaskModel task;

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  //decription_converter
  String decript(TaskModel t) {
    final des = t.description;
    if (des.isEmpty) return '';
    return des;
  }

  //head_color
  Color headcolor(int priority) {
    if (priority == 3) {
      return Color(0xffEF4444);
    } else if (priority == 2)
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
    final color = headcolor(widget.task.priority);
    bool isCheck = widget.task.isCompleted;
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
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      key: Key(widget.task.id),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  top: 3,
                  bottom: 3,
                  left: 0,
                  child: Container(
                    width: 4,
                    decoration: BoxDecoration(
                      color: widget.task.isCompleted
                          ? const Color(0xff5AC578)
                          : color,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (v) => FocusTimer(task: widget.task),
                      ),
                    ),
                  },
                  child: Card(
                    elevation: 1,
                    shadowColor: const Color(0x52FFFFFF),
                    color: const Color.fromARGB(251, 255, 255, 255),
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
                                fillColor: WidgetStateColor.resolveWith(
                                  (s) {
                                    return getcheckboxcolor(s);
                                  },
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadiusGeometry.circular(5),
                                ),
                                side: const BorderSide(
                                  color: Color(0xFFC89FF5),
                                  style: BorderStyle.solid,
                                ),
                                value: isCheck,
                                onChanged: (_) => controller.toggleTask(
                                  controller.currentUserId.isNotEmpty
                                      ? controller.currentUserId
                                      : kTestUserId,
                                  widget.task,
                                ),
                              ),
                            ),

                            //title
                            Expanded(
                              child: Text(
                                capitlaise(widget.task.title),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: widget.task.isCompleted
                                      ? FontWeight.w200
                                      : FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                        //description
                        if (widget.task.description.isNotEmpty)
                          Container(
                            margin: const EdgeInsets.fromLTRB(15, 0, 15, 4),
                            child: Text(
                              capitlaise(decript(widget.task)),
                              style: TextStyle(
                                fontWeight: widget.task.isCompleted
                                    ? FontWeight.w300
                                    : FontWeight.normal,
                              ),
                            ),
                          ),

                        Container(
                          margin: const EdgeInsets.fromLTRB(15, 2, 4, 15),
                          child: Wrap(
                            spacing: 10,
                            runSpacing: 6,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              //TaskPriority
                              Container(
                                alignment: Alignment.center,
                                height: 23,
                                width: 90,
                                decoration: BoxDecoration(
                                  color: widget.task.isCompleted
                                      ? const Color(0xffC8F0DC)
                                      : bgcolor(widget.task.priority),
                                  borderRadius: BorderRadius.circular(
                                    8,
                                  ),
                                ),
                                child: Text(
                                  textpriority(widget.task.priority),
                                  style: TextStyle(
                                    color: widget.task.isCompleted
                                        ? const Color(0xff5AC578)
                                        : textcolor(
                                            widget.task.priority,
                                          ),
                                  ),
                                ),
                              ),
                              //tasktime && duration
                              Container(
                                decoration: BoxDecoration(
                                  color: const Color(0x7BF3E8FF),
                                  borderRadius: BorderRadius.circular(
                                    12,
                                  ),
                                ),
                                height: 30,
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      MainAxisAlignment.center,
                                  children: [
                                    //task_time,
                                    Text(
                                      widget.task.time,
                                      style: const TextStyle(
                                        color: Color(0xffAA64DC),
                                      ),
                                    ),
                                    const SizedBox(width: 3),
                                    const Text(
                                      '·',
                                      style: TextStyle(fontSize: 22),
                                    ),

                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                        horizontal: 4,
                                        vertical: 0,
                                      ),
                                      child: const Icon(
                                        Icons.access_time,
                                        color: Color(0xffC89FF5),
                                        size: 15,
                                      ),
                                    ),

                                    Text(
                                      duration_conv(
                                        widget.task.duration!.toInt(),
                                      ),
                                      style: const TextStyle(
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
          ),
          if (!widget.task.isCompleted) ...[
            const SizedBox(width: 4),
            IconButton.outlined(
              onPressed: () {
                controller.deleteTask(
                  controller.currentUserId.isNotEmpty
                      ? controller.currentUserId
                      : kTestUserId,
                  widget.task.id,
                );
              },
              icon: const Icon(Icons.delete_forever),
            ),
          ],
        ],
      ),
    );
  }
}
