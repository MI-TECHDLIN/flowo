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
    if (htime >= 0) return 'Good morning, $name 👋';
    if (htime >= 12) return 'Good afternoon, $name';
    if (htime >= 16) return 'Good evening, $name';
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
                Container(
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
