import 'package:flowo/features/tasks/taskfunctions.dart';
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
    return SizedBox(
      // color: Colors.white,
      height: 560,
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
            SizedBox(height: 20),
            TaskField(controller: titilecontroller, text: 'Task title'),
            SizedBox(height: 10),

            TaskField(
              controller: decription_controller,
              text: 'Description (optional)',
              vertical: 50,
              horizontal: 20,
            ),
            SizedBox(height: 20),

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
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.only(left: 30),
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
                  SizedBox(width: 20),
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
    );
  }
}
