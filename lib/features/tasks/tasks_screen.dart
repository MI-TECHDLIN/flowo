import 'package:flowo/features/tasks/widgets/task_/task_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../main.dart';
import 'task_controller.dart';
import 'widgets/add_task_sheet.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<TaskController>().listenTOtasks(kTestUserId);
    });
  }

  void _openAddTask() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) => const AddTaskSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<TaskController>();

    if (controller.isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text(
          'Flowo',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        elevation: 0,
      ),
      body: controller.tasks.isEmpty
          ? _EmptyState(onAdd: _openAddTask)
          : _TaskList(controller: controller),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _openAddTask,
        icon: const Icon(Icons.add),
        label: const Text('Add Task'),
      ),
    );
  }
}

//emptystate
class _EmptyState extends StatelessWidget {
  final VoidCallback onAdd;
  const _EmptyState({required this.onAdd});

  @override
  Widget build(BuildContext context) {
    '''
 Empty State 
-Shown when the user has no tasks yet.
- Good UX — never show a blank screen without guidance for now t he empty state would be simple.
''';
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.check_circle_outline,
            size: 72,
            color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
          ),
          const SizedBox(height: 16),
          Text(
            'No tasks yet',
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(color: Colors.grey),
          ),
          const SizedBox(height: 8),
          TextButton.icon(
            onPressed: onAdd,
            icon: const Icon(Icons.add),
            label: const Text('Add your first task'),
          ),
        ],
      ),
    );
  }
}

//tasklist
class _TaskList extends StatelessWidget {
  final TaskController controller;
  const _TaskList({required this.controller});

  @override
  Widget build(BuildContext context) {
    '''
Task List 
// Splits tasks into Active and Completed sections.
// Uses a single ListView with section headers — no nested scrolling needed.
''';
    final active = controller.activetasks;
    final completed = controller.completeedtasks;

    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 100),
      children: [
        // Active tasks section
        if (active.isNotEmpty) ...[
          _SectionHeader(title: 'To-Do', count: active.length),
          const SizedBox(height: 8),
          ...active.map((task) => TaskCard(task: task)),
          const SizedBox(height: 16),
        ],

        // Completed tasks section
        if (completed.isNotEmpty) ...[
          _SectionHeader(title: 'Completed', count: completed.length),
          const SizedBox(height: 8),
          ...completed.map((task) => TaskCard(task: task)),
        ],
      ],
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  final int count;
  const _SectionHeader({required this.title, required this.count});

  @override
  Widget build(BuildContext context) {
    '''
Section header for count for completed and todo
''';
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: Colors.grey.shade600,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.8,
          ),
        ),
        const SizedBox(width: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            '$count',
            style: Theme.of(
              context,
            ).textTheme.labelSmall?.copyWith(color: Colors.grey.shade600),
          ),
        ),
      ],
    );
  }
}
