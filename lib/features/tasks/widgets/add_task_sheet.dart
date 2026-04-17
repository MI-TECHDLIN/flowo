import 'package:flowo/features/tasks/widgets/priority_chip.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../task_controller.dart';
import '../../../main.dart';

class AddTaskSheet extends StatefulWidget {
  const AddTaskSheet({super.key});

  @override
  State<AddTaskSheet> createState() => _AddTaskSheetState();
}

class _AddTaskSheetState extends State<AddTaskSheet> {
  final _titleCOntroller = TextEditingController();
  final _descriptioncontroller = TextEditingController();
  int _selectedpriority = 2;
  bool _isSaving = false;
  @override
  void dispose() {
    _titleCOntroller.dispose();
    _descriptioncontroller.dispose();
    super.dispose();
  }

  Future<void> save() async {
    final title = _titleCOntroller.text.trim();
    if (title.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a task title')),
      );
      return;
    }

    setState(() {
      _isSaving = true;
    });
    await context.read<TaskController>().addTask(
      kTestUserId,
      title,
      _descriptioncontroller.text.trim(),
    );
    if (mounted) Navigator.pop(context);
  }

  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 24,
        right: 24,
        top: 24,
        bottom: MediaQuery.of(context).viewInsets.bottom + 24,
      ),
      child: Column(
        children: [
          //this header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'New Task',
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.close),
              ),
              SizedBox(height: 16),

              //textfield space where user input texts
              TextField(
                controller: _titleCOntroller,
                autofocus: true,
                autocorrect: true,
                decoration: InputDecoration(
                  labelText: 'Task title',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),

              //description field this would beupdated nextphase
              TextField(
                controller: _descriptioncontroller,
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: 'Description (optional)',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),

              //prorotylevelcheck
              Text('Priority', style: Theme.of(context).textTheme.labelLarge),
              const SizedBox(height: 8),

              Row(
                children: [
                  PriorityChip(
                    label: "High",
                    value: 1,
                    color: Colors.red,
                    selected: _selectedpriority == 1,
                    onTap: () => setState(() {
                      _selectedpriority = 1;
                    }),
                  ),
                  const SizedBox(width: 8),
                  PriorityChip(
                    label: 'Medium',
                    value: 2,
                    color: Colors.orange,
                    selected: _selectedpriority == 2,
                    onTap: () => setState(() => _selectedpriority = 2),
                  ),
                  const SizedBox(width: 8),
                  PriorityChip(
                    label: 'Low',
                    value: 3,
                    color: Colors.green,
                    selected: _selectedpriority == 3,
                    onTap: () => setState(() => _selectedpriority = 3),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              //aavewidget
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: _isSaving ? null : save,
                  child: _isSaving
                      ? SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : Text('Add Task'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
