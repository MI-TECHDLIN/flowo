//TODO: make sure i get a better modalsheet for the ios
//TODO: for now i will use the flutter natvie bootom shett laster migrate to smooth sheet bottomshet
//TODO: tag feature for each task as the next push
//TODO: replace for iteration with map for heading tasks
import 'package:flowo/main.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';
import 'taskfunctions.dart';
import 'package:flowo/features/tasks/widgets/task_/task_card.dart';
import 'package:flowo/features/tasks/widgets/task_/task_count.dart';
import 'package:flowo/features/tasks/widgets/task_/task_field.dart';
import 'package:flowo/features/tasks/widgets/task_/task_priority.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Taskscreen extends StatefulWidget {
  const Taskscreen({super.key});

  @override
  State<Taskscreen> createState() => _TaskscreenState();
}

class _TaskscreenState extends State<Taskscreen> {
  DateTime time = DateTime.now();
  String greettingfunc(String name) {
    final htime = int.parse(DateFormat.H().format(time));
    if (htime < 12)
      return 'Good Morning, $name 👋';
    else if (htime < 17)
      return 'Good Afternoon, $name 👋';
    else if (htime < 24)
      return 'Good Evening, $name 👋';
    return '$name';
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(() {
      context.read<TaskController>().listenTOtasks(kTestUserId);
    });
  }

  Widget build(BuildContext context) {
    final _controller = context.watch<TaskController>();
    final todo = _controller.activetasks;
    final completed = _controller.completeedtasks;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight:
              70, //this was made 70 becuase of  the measurement in andriod

          elevation: 5,

          title: Text('Flowo'),
          actions: [
            Container(
              child: IconButton(
                onPressed: null,
                icon: Icon(Icons.notifications),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 20),
              height: 34,
              width: 34,
              decoration: BoxDecoration(
                color: Color(0xFFD4B5F5),
                borderRadius: BorderRadius.circular(17),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // welcome container with greeting function
                Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          greettingfunc('Miracle'),

                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'You have 4 tasks today',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                //task section for completed task,remaining,overdue
                Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TaskCount(
                        Color.fromARGB(51, 255, 62, 142),
                        '3',
                        'Done today',
                        Color(0xFFC394F4),
                      ),
                      TaskCount(
                        Color(0x76C8F0DC),
                        '4',
                        'Remaining',
                        Color(0xFF5AC578),
                      ),
                      TaskCount(
                        Color(0x9AFFE5CC),
                        '1',
                        'Overdue',
                        Color(0xFFF5A24A),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  margin: EdgeInsets.only(left: 11),
                  alignment: Alignment.centerLeft,
                  child: Text("Todo's", style: TextStyle(fontSize: 20)),
                ),
                if (todo.isNotEmpty) ...[
                  for (var task in todo) TaskCard(task: task),
                ],

                Container(
                  margin: EdgeInsets.only(left: 11),
                  alignment: Alignment.centerLeft,
                  child: Text("Completed", style: TextStyle(fontSize: 20)),
                ),
                if (completed.isNotEmpty) ...[
                  ...completed.map((task) => TaskCard(task: task)),
                ],
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              backgroundColor: Colors.white,
              context: context,
              builder: (b) {
                priority selectedPriority = priority.state;
                return StatefulBuilder(
                  builder: (context, setState) {
                    return Container(
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

                            textfield(text: 'Task title'),
                            SizedBox(height: 10),

                            textfield(
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
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: Color(0xffF5F8FA),
                                        borderRadius: BorderRadius.circular(27),
                                        border: Border.all(
                                          color: Color(0xffD2DAE4),
                                        ),
                                      ),
                                      height: 50,
                                      width: 100,
                                      child: Text(
                                        'Cancel',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  GestureDetector(
                                    onTap: null,
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: Color(0xffC89FF5),
                                        borderRadius: BorderRadius.circular(27),
                                      ),
                                      height: 54,
                                      width: 227,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.add, color: Colors.white),

                                          Text(
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
                  },
                );
              },
            );
          },
          child: Container(child: Icon(Icons.add)),
        ),
      ),
    );
  }
}
