//TODO: make sure i get a better modalsheet for the ios
//TODO: for now i will use the flutter natvie bootom shett laster migrate to smooth sheet bottomshet
//TODO: tag feature for each task as the next push
//TODO: replace for iteration with map for heading tasks
import 'package:flowo/features/tasks/widgets/add_task_sheet.dart';
import 'package:flowo/features/tasks/widgets/task_/task_bottomsheet.dart';
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
    final total_count = todo.length + completed.length;
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
                          'You have $total_count tasks today',
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
                      //completed tasks
                      TaskCount(
                        Color.fromARGB(51, 255, 62, 142),
                        completed.length.toString(),
                        'Done today',
                        Color(0xFFC394F4),
                      ),
                      //totalcount
                      TaskCount(
                        Color(0x76C8F0DC),
                        total_count.toString(),
                        'Remaining',
                        Color(0xFF5AC578),
                      ),
                      //remaining
                      TaskCount(
                        Color(0x9AFFE5CC),
                        todo.length.toString(),
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

                //completedtask
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
              isScrollControlled: true,
              backgroundColor: Colors.white,
              context: context,
              builder: (b) {
                return botttomsheet();
              },
            );
          },
          child: Container(child: Icon(Icons.add)),
        ),
      ),
    );
  }
}
