import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data/models/task_model.dart';
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

// ─── Empty State ─────────────────────────────────────────────────────────────
// Shown when the user has no tasks yet.
// Good UX — never show a blank screen without guidance.
class _EmptyState extends StatelessWidget {
  final VoidCallback onAdd;
  const _EmptyState({required this.onAdd});

  @override
  Widget build(BuildContext context) {
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

// ─── Task List ────────────────────────────────────────────────────────────────
// Splits tasks into Active and Completed sections.
// Uses a single ListView with section headers — no nested scrolling needed.
class _TaskList extends StatelessWidget {
  final TaskController controller;
  const _TaskList({required this.controller});

  @override
  Widget build(BuildContext context) {
    final active = controller.activetasks;
    final completed = controller.completeedtasks;

    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 100),
      children: [
        // Active tasks section
        if (active.isNotEmpty) ...[
          _SectionHeader(title: 'Active', count: active.length),
          const SizedBox(height: 8),
          ...active.map((task) => _TaskCard(task: task)),
          const SizedBox(height: 16),
        ],

        // Completed tasks section
        if (completed.isNotEmpty) ...[
          _SectionHeader(title: 'Completed', count: completed.length),
          const SizedBox(height: 8),
          ...completed.map((task) => _TaskCard(task: task)),
        ],
      ],
    );
  }
}

// ─── Section Header ────────────────────────────────────────────────────
class _SectionHeader extends StatelessWidget {
  final String title;
  final int count;
  const _SectionHeader({required this.title, required this.count});

  @override
  Widget build(BuildContext context) {
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

// ─── Task Card ────────────────────────────────────────────────────────────────
// Each task is a card with:
// - Priority color indicator (left border)
// - Title + description
// - Checkbox to toggle
// - Swipe to delete (Dismissible)
//i added a dissimble widget for easy UX experience easy sliding for deleting

class _TaskCard extends StatelessWidget {
  final TaskModel task;
  const _TaskCard({required this.task});

  // Maps priority int to a color
  Color _priorityColor(int priority) {
    switch (priority) {
      case 1:
        return Colors.red;

      case 2:
        return Colors.orange;
      case 3:
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  String _priorityLabel(int priority) {
    switch (priority) {
      case 1:
        return 'High';
      case 2:
        return 'Medium';
      case 3:
        return 'Low';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.read<TaskController>();
    final color = _priorityColor(task.priority);

    // Dismissible wraps the card to enable swipe-to-delete
    // direction: endToStart = swipe left to delete
    //for each id we tap through the taslkid
    return Dismissible(
      key: Key(task.id),
      direction: DismissDirection.endToStart,
      onDismissed: (_) => controller.deleteTask(kTestUserId, task.id),
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: Colors.red.shade400,
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Icon(Icons.delete_outline, color: Colors.white),
      ),
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: Theme.of(
            context,
          ).colorScheme.surfaceContainerHighest.withOpacity(0.4),
          borderRadius: BorderRadius.circular(16),
          // Priority color shows as left border
          border: Border(left: BorderSide(color: color, width: 4)),
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 4,
          ),
          // Checkbox on the left
          leading: Checkbox(
            value: task.isCompleted,
            activeColor: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            onChanged: (_) => controller.toggleTask(kTestUserId, task),
          ),
          title: Text(
            task.title,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              decoration: task.isCompleted ? TextDecoration.lineThrough : null,
              color: task.isCompleted ? Colors.grey : null,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (task.description.isNotEmpty) ...[
                const SizedBox(height: 2),
                Text(
                  task.description,
                  style: TextStyle(
                    color: task.isCompleted
                        ? Colors.grey.shade400
                        : Colors.grey.shade600,
                    fontSize: 12,
                  ),
                ),
              ],
              const SizedBox(height: 4),
              // Priority badge
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  _priorityLabel(task.priority),
                  style: TextStyle(
                    color: color,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
