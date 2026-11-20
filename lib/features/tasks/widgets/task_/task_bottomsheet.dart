import 'package:flowo/constants/constant.dart';
import 'package:flowo/data/services/local_storage_service.dart';
import 'package:flowo/features/tasks/task_functions.dart';
import 'package:flowo/features/tasks/widgets/task_/reusable_increment_btn.dart';
import 'package:flowo/features/tasks/widgets/task_/task_field.dart';
import 'package:flowo/features/tasks/widgets/task_/task_priority.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:numberpicker/numberpicker.dart';

class botttomsheet extends StatefulWidget {
  const botttomsheet({super.key});

  @override
  State<botttomsheet> createState() => _botttomsheetState();
}

class _botttomsheetState extends State<botttomsheet> {
  Widget selcet_number() {
    return NumberPicker(
      minValue: 20,
      maxValue: 1000,
      value: duration,
      onChanged: (value) {
        setState(() {});
      },
    );
  }

  TimeOfDay time = TimeOfDay(hour: 10, minute: 10);
  int duration = 25;
  String changestring({String? text, TimeOfDay? time}) {
    '''
this function checks for Timeoftype or string type
''';
    if (text!.contains('day')) {
      return text;
    } else {
      return time!.format(context).toString();
    }
  }

  Widget timerwudget(
    VoidCallback ontouch,

    IconData icon, {
    String label = '10:00',
    TimeOfDay time = consttime,
    int bgcolor = 0xffF5F8FA,
    int bordercolor = 0xffE8EEF3,
  }) {
    """
am actually having issue put a timeofday type and String in the same widget so am creating a function that returns with a conditions
""";
    return InkWell(
      onTap: ontouch,
      child: Container(
        height: 52,
        decoration: BoxDecoration(
          color: Color(bgcolor),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Color(bordercolor), width: 2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: const Color(0xffC89FF5), size: 18),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                changestring(text: label, time: time),
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Color(0xff2D3E50),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  priority selectedPriority = priority.state;
  final titilecontroller = TextEditingController();
  final decription_controller = TextEditingController();

  //priority
  int priorityint = 2;

  bool issaving = false;

  //task sa-ved here
  Future<void> save_task() async {
    final title = titilecontroller.text.trim();
    final description = decription_controller.text.trim();
    if (title.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a task title')),
      );
      return;
    }

    if (issaving) return;

    setState(() {
      issaving = true;
    });

    final formattedTime = time.format(context);
    final taskController = context.read<TaskController>();
    String targetUserId = taskController.currentUserId;
    if (targetUserId.isEmpty) {
      targetUserId = await LocalStorageService.getUserId();
    }

    try {
      await taskController.addTask(
        targetUserId,
        title,
        description,
        duration,
        formattedTime,
        priorityint,
      );

      if (mounted) {
        Navigator.pop(context);
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          issaving = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to add task: ${e.toString()}')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: const Text(
                'New Task',
                style: TextStyle(
                  fontFamily: 'inter',
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Text(
              "What's on your mind?",
              style: TextStyle(fontWeight: FontWeight.w300),
            ),
            const SizedBox(height: 10),
            TaskField(
              hinttext: 'e.g. Finish the weekly report 📋',
              controller: titilecontroller,
              text: 'Task title',
              vertical: 10,
              horizontal: 10,
            ),
            const SizedBox(height: 10),
            TaskField(
              hinttext: 'Add some details...',
              controller: decription_controller,
              text: 'Description (optional)',
              horizontal: 50,
            ),
            const SizedBox(height: 10),
            const Text('Priority'),
            const SizedBox(height: 7),
            Row(
              children: [
                Expanded(
                  child: TaskPriority(
                    label: 'High',
                    backgroundcolor: 0xffFFDCDC,
                    bordercolor: 0xffEF4444,
                    pointercolor: 0xffEF4444,
                    enu: priority.high,
                    select: selectedPriority,
                    ontap: () {
                      setState(() {
                        selectedPriority = priority.high;
                        priorityint = 3;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TaskPriority(
                    label: 'Medium',
                    backgroundcolor: 0x71F5A24A,
                    bordercolor: 0xffF5A34A,
                    pointercolor: 0xffF5A34A,
                    enu: priority.medium,
                    select: selectedPriority,
                    ontap: () {
                      setState(() {
                        selectedPriority = priority.medium;
                        priorityint = 2;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TaskPriority(
                    label: 'low',
                    backgroundcolor: 0x5D5AC578,
                    bordercolor: 0xff5AC578,
                    pointercolor: 0xff5AC578,
                    enu: priority.low,
                    select: selectedPriority,
                    ontap: () {
                      setState(() {
                        priorityint = 1;
                        selectedPriority = priority.low;
                      });
                    },
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Date & Time'),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: timerwudget(
                          () {
                            showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            ).then((value) {
                              if (value != null) {
                                setState(() {
                                  time = value;
                                });
                              }
                            });
                          },
                          Icons.access_time,
                          time: time,
                          bgcolor: 0xffF5F8FA,
                          bordercolor: 0xffD4B5F5,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          height: 52,
                          decoration: BoxDecoration(
                            color: const Color(0x4ED3E0E9),
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: const Color(0xffD4B5F5),
                              width: 2,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ReusableIncrementBtn(
                                icon: Icons.remove,
                                callback: () {
                                  setState(() {
                                    if (duration > 1) {
                                      duration--;
                                    }
                                  });
                                },
                              ),
                              const SizedBox(width: 6),
                              Text(
                                '$duration min',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Color(0xff2D3E50),
                                ),
                              ),
                              const SizedBox(width: 6),
                              ReusableIncrementBtn(
                                icon: Icons.add,
                                callback: () {
                                  setState(() {
                                    duration++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color(0xffF5F8FA),
                        borderRadius: BorderRadius.circular(27),
                        border: Border.all(color: const Color(0xffD2DAE4)),
                      ),
                      height: 50,
                      child: const Text('Cancel', style: TextStyle(fontSize: 15)),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  flex: 2,
                  child: GestureDetector(
                    onTap: issaving ? null : () => save_task(),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color(0xffC89FF5),
                        borderRadius: BorderRadius.circular(27),
                      ),
                      height: 54,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (issaving)
                            const SizedBox(
                              height: 22,
                              width: 22,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2.5,
                              ),
                            )
                          else ...[
                            const Icon(Icons.add, color: Colors.white),
                            const SizedBox(width: 4),
                            const Text(
                              'Add Task',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
