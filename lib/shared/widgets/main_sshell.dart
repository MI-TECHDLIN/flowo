import 'package:flowo/features/daily_flow/daily_flow_screen.dart';
import 'package:flowo/features/progress/progrees_screen.dart';
import 'package:flowo/features/tasks/tasks_screen.dart';
import 'package:flutter/material.dart';

class MainSshell extends StatefulWidget {
  const MainSshell({super.key});

  @override
  State<MainSshell> createState() => _MainSshellState();
}

class _MainSshellState extends State<MainSshell> {
  int _currentindex = 0;
  final List<Widget> _screens = [
    TasksScreen(),
    DailyFlowScreen(),
    ProgreesScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            icon: Icon(Icons.calendar_today_outlined),
            label: 'Daily Flow',
            selectedIcon: Icon(Icons.calendar_today),
          ),
          NavigationDestination(
            icon: Icon(Icons.bar_chart_outlined),
            label: 'Progress',
            selectedIcon: Icon(Icons.bar_chart),
          ),
        ],
      ),
    );
  }
}
