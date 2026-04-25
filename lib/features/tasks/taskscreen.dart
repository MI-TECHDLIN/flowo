//TODO: make sure i get a better modalsheet for the ios
//TODO: for now i will use the flutter natvie bootom shett laster migrate to smooth sheet bottomshet

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
  Widget build(BuildContext context) {
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

                TaskCard(), TaskCard(),
                TaskCard(),
                TaskCard(),
                TaskCard(),
                TaskCard(),
                TaskCard(),
                TaskCard(),
                TaskCard(),
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
                return Container(
                  // color: Colors.white,
                  height: 550,
                  width: double.infinity,
                  child: SingleChildScrollView(
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
                          Text('Task title'),
                          SizedBox(height: 10),
                          TextField(
                            decoration: InputDecoration(
                              // isCollapsed: ,
                              fillColor: Colors.white,
                              focusColor: Colors.blueAccent,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),

                                borderSide: BorderSide(
                                  color: Color(0xFF8E32F0),
                                ),
                              ),

                              enabled: true,

                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(
                                  color: Color(0xffC89FF5),
                                ),
                              ),
                              hintText: 'e.g. Finish the weekly report 📋',
                              hintStyle: TextStyle(fontWeight: FontWeight.w200),
                              filled: true,
                            ),
                          ),
                          SizedBox(height: 20),
                          TextField(
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 50,
                                horizontal: 10,
                              ),
                              // isCollapsed: ,
                              fillColor: Colors.white,
                              focusColor: Colors.blueAccent,

                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),

                                borderSide: BorderSide(
                                  color: Color(0xFF8E32F0),
                                ),
                              ),

                              enabled: true,

                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(
                                  color: Color(0xffC89FF5),
                                ),
                              ),
                              hintText: 'e.g. Finish the weekly report 📋',
                              hintStyle: TextStyle(fontWeight: FontWeight.w200),
                              filled: true,
                            ),
                          ),

                          Text('Priority'),
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 8,
                                        width: 8,
                                        color: Color(0xffEF4444),
                                      ),

                                      Text('High'),
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
