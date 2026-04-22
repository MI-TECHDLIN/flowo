import 'package:flowo/features/tasks/taskfunctions.dart';
import 'package:flowo/main.dart';
import 'package:flutter/material.dart';
import 'package:flowo/dtata/models/task_model.dart';
import 'package:provider/provider.dart';
// ─── Task Card ────────────────────────────────────────────────────────────────
// Each task is a card with:
// - Priority color indicator (left border)
// - Title + description
// - Checkbox to toggle
// - Swipe to delete (Dismissible)
//i added a dissimble widget for easy UX experience easy sliding for deleting

class TaskCard extends StatelessWidget {
  final TaskModel task;
  const TaskCard({required this.task});

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
