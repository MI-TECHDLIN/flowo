import 'package:flowo/constants/constant.dart';
import 'package:flowo/features/tasks/task_functions.dart';
import 'package:flowo/features/tasks/widgets/task_/task_field.dart';
import 'package:flowo/features/tasks/widgets/task_/task_priority.dart';
import 'package:flowo/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class botttomsheet extends StatefulWidget {
  const botttomsheet({super.key});

  @override
  State<botttomsheet> createState() => _botttomsheetState();
}

class _botttomsheetState extends State<botttomsheet> {
  TimeOfDay time = TimeOfDay(hour: 10, minute: 10);
  static const TimeOfDay consttime = TimeOfDay(hour: 10, minute: 10);

  String changestring({String? text, TimeOfDay? time}) {
    if (text!.contains('day'))
      return text;
    else {
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
        height: 45,
        width: 164,
        decoration: BoxDecoration(
          color: Color(bgcolor),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Color(bordercolor), width: 2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,

          children: [
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Icon(icon, color: Color(0xffC89FF5), size: 18),
            ),
            SizedBox(width: 10),
            blacktext(
              changestring(text: label, time: time),
              17,
              color: 0xFF000000,
            ),
          ],
        ),
      ),
    );
  }

  priority selectedPriority = priority.state;
  final titilecontroller = TextEditingController();
  final decription_controller = TextEditingController();

  int priorityint = 2;

  bool issaving = false;

  //task sa-ved here
  Future<void> save_task() async {
    final title = titilecontroller.text.trim();
    final description = decription_controller.text.trim();
    if (title.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Please enter a task title')));
      return;
    }
    setState(() {
      issaving = true;
    });

    await context.read<TaskController>().addTask(
      kTestUserId,
      title,
      description,
      priorityint,
    );

    if (!context.mounted) return;
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        // color: Colors.white,
        height: 570,
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Text(
                  'New Task',
                  style: TextStyle(
                    fontFamily: 'inter',
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Text(
                "What's on your mind?",
                style: TextStyle(fontWeight: FontWeight.w300),
              ),
              SizedBox(height: 10),
              TaskField(
                hinttext: 'e.g. Finish the weekly report 📋',
                controller: titilecontroller,
                text: 'Task title',
                vertical: 10,
                horizontal: 10,
              ),
              SizedBox(height: 10),

              TaskField(
                hinttext: 'Add some details...',
                controller: decription_controller,
                text: 'Description (optional)',

                horizontal: 50,
              ),
              SizedBox(height: 10),

              Text('Priority'),
              SizedBox(height: 7),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TaskPriority(
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
                  TaskPriority(
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
                  TaskPriority(
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
                ],
              ),

              Container(
                margin: EdgeInsets.only(top: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(child: Text('Date & Time')),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        timerwudget(
                          () => {},
                          Icons.calendar_today_rounded,
                          label: 'Today',
                        ),
                        timerwudget(
                          () {
                            showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            ).then((value) {
                              setState(() {
                                time = value!;
                              });
                            });
                          },
                          Icons.access_time,
                          time: time,

                          bgcolor: 0xffF3E8FF,
                          bordercolor: 0xffD4B5F5,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Color(0xffF5F8FA),
                          borderRadius: BorderRadius.circular(27),
                          border: Border.all(color: Color(0xffD2DAE4)),
                        ),
                        height: 50,
                        width: 100,
                        child: Text('Cancel', style: TextStyle(fontSize: 15)),
                      ),
                    ),
                    SizedBox(width: 30),
                    GestureDetector(
                      onTap: () {
                        save_task();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Color(0xffC89FF5),
                          borderRadius: BorderRadius.circular(27),
                        ),
                        height: 54,
                        width: 227,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.add, color: Colors.white),

                            issaving
                                ? CircularProgressIndicator()
                                : Text(
                                    'Add Task',
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                          ],
                        ),
                      ),
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
