import 'package:flowo/features/daily_flow/daily_flow_screen.dart';
import 'package:flowo/features/progress/progrees_screen.dart';
import 'package:flowo/features/tasks/demo.dart';
import 'package:flowo/features/tasks/taskscreen.dart';
import 'package:flowo/features/tasks/widgets/task_/task_bottomsheet.dart';
import 'package:flutter/material.dart';

class Bottomnav extends StatefulWidget {
  const Bottomnav({super.key});

  @override
  State<Bottomnav> createState() => _BottomnavState();
}

class _BottomnavState extends State<Bottomnav> {
  int _currentindex = 0;
  final List<Widget> _screens = [Taskscreen(), botttomsheet(), ai()];

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
          Container(
            child: IconButton(onPressed: null, icon: Icon(Icons.notifications)),
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

      body: _screens[_currentindex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentindex,
        onDestinationSelected: (index) {
          setState(() {
            _currentindex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.check_circle_outline),
            label: 'Tasks',
            selectedIcon: Icon(Icons.check_circle),
          ),
          NavigationDestination(
            icon: Icon(Icons.add_rounded),
            label: 'Add',
            selectedIcon: Icon(Icons.add),
          ),
          NavigationDestination(
            icon: Icon(Icons.auto_awesome_rounded),
            label: 'Ai',
            selectedIcon: Icon(Icons.auto_awesome),
          ),
        ],
      ),
    );
  }
}
