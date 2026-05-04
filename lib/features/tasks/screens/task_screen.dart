//TODO: make sure i get a better modalsheet for the ios
//TODO: for now i will use the flutter natvie bootom shett laster migrate to smooth sheet bottomshet
//TODO: tag feature for each task as the next push
//TODO: replace for iteration with map for heading tasks
import 'package:flowo/constants/constant.dart';
import 'package:flowo/features/ai/ai_suggestion_screen.dart';
import 'package:flowo/features/tasks/widgets/task_/task_bottomsheet.dart';
import 'package:flowo/main.dart';
import 'package:provider/provider.dart';
import '../task_functions.dart';
import 'package:flowo/features/tasks/widgets/task_/task_card.dart';
import 'package:flowo/features/tasks/widgets/task_/task_count.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Taskscreen extends StatefulWidget {
  const Taskscreen({super.key});

  @override
  State<Taskscreen> createState() => _TaskscreenState();
}

class _TaskscreenState extends State<Taskscreen> {
  DateTime dtime = DateTime.now();
  String greettingfunc(String name) {
    final htime = int.parse(DateFormat.H().format(dtime));
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
                        Color(0x82F3E8FF),
                        completed.length.toString(),
                        'Done today',
                        Color(0xBDC294F4),
                      ),
                      //totalcount
                      TaskCount(
                        Color(0x58C8F0DC),
                        total_count.toString(),
                        'Remaining',
                        Color(0xFF5AC578),
                      ),
                      //remaining
                      TaskCount(
                        Color(0x38FFE5CC),
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
                SizedBox(height: 30),
                Container(
                  height: 100,
                  width: 350,
                  decoration: BoxDecoration(
                    color: Color(0xffC89FF5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            whitetext('✨ Need a focus plan?', 20),
                            SizedBox(height: 5),
                            whitetext(
                              'Let AI suggest your best next task',
                              13,
                              color: 0xffF0DCFF,
                            ),
                          ],
                        ),
                      ),

                      InkWell(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AiSuggestionScreen(),
                          ),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          height: 32,
                          width: 60,

                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Text(
                            'Try it',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xffC89FF5),
                            ),
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
      ),
    );
  }
}
