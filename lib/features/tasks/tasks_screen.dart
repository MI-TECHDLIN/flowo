import 'package:flowo/features/tasks/task_controller.dart';
import 'package:flowo/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  @override
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(() {
      ''''
i called this future so it gives the init state time for flutter to build fully before reading the state from firestore
''';
      context.read<TaskController>().listenTOtasks(kTestUserId);
    });
  }

  Widget build(BuildContext context) {
    final controller = context.watch<TaskController>();
    '''
this context.watch acts like a stream it listens for updates on the widget  and from nofify listeners and updates the widgets
''';

    if (controller.isLoading) {
      return Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    return Scaffold(
      appBar: AppBar(title: const Text('My Tasks')),
      body: controller.tasks.isEmpty
          ? const Center(child: Text('No task yet'))
          : ListView.builder(
              itemBuilder: (context, index) {
                final task = controller.tasks[index];
                return ListTile(
                  title: Text(task.title),
                  subtitle: Text(task.isCompleted ? 'Completed' : 'Active'),
                  leading: Checkbox(
                    value: task.isCompleted,
                    onChanged: (_) {
                      controller.toggleTask(kTestUserId, task);
                    },
                  ),
                  trailing: IconButton(
                    onPressed: () =>
                        controller.deleteTask(kTestUserId, task.id),
                    icon: Icon(Icons.delete),
                  ),
                );
              },
            ),
    );
  }
}
