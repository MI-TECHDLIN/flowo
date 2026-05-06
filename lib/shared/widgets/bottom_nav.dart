import 'package:flowo/constants/constant.dart';
import 'package:flowo/features/ai/ai_suggestion_screen.dart';
import 'package:flowo/features/tasks/screens/task_screen.dart';
import 'package:flowo/features/tasks/widgets/task_/task_bottomsheet.dart';
import 'package:flutter/material.dart';

class Bottomnav extends StatefulWidget {
  const Bottomnav({super.key});

  @override
  State<Bottomnav> createState() => _BottomnavState();
}

class _BottomnavState extends State<Bottomnav> {
  int _currentindex = 0;
  final List<Widget> _screens = [
    Taskscreen(),
    Taskscreen(),
    AiSuggestionScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight:
            70, //this was made 70 becuase of  the measurement in andriod

        elevation: 5,

        title: Text('Flowo'),
        actions: [
          IconButton(onPressed: null, icon: Icon(Icons.notifications)),
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

      body: _screens[_currentindex],

      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentindex,
        onDestinationSelected: (index) {
          setState(() {
            _currentindex = index;
          });
        },
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.check_circle_outline),
            label: 'Tasks',
            selectedIcon: Icon(Icons.check_circle),
          ),
          SizedBox(
            child: Column(
              children: [
                IconButton(
                  onPressed: () {
                    addtask(context);
                  },
                  icon: Icon(Icons.add_rounded),
                ),
                Text('Add task'),
              ],
            ),
          ),

          NavigationDestination(
            icon: Icon(Icons.auto_awesome_rounded),
            label: 'Ai Suggestions',
            selectedIcon: Icon(Icons.auto_awesome),
          ),
        ],
      ),
    );
  }
}
