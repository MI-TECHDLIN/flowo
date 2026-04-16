import 'package:flutter/material.dart';
import '../../data/models/task_model.dart';
import '../../data/services/task_service.dart';

class TaskController extends ChangeNotifier {
  final TaskService _taskService = TaskService();
  List<TaskModel> _tasks = [];
  bool _isloading = false;
  String? _error;

  //a reasd only accesss
  List<TaskModel> get tasks => _tasks;
  bool get isLoading => _isloading;
  String? get error => _error;

  //this domain splits tasks to completed and not complemeted session
  List<TaskModel> get activetasks =>
      _tasks.where((t) => !t.isCompleted).toList();
  //compleete
  List<TaskModel> get completeedtasks =>
      _tasks.where((t) => !t.isCompleted).toList();

  //thhis listens to the firestore dbs
  void listenTOtasks(String userId) {
    _isloading = true;
    notifyListeners();

    _taskService
        .gettasks(userId)
        .listen(
          (tasks) {
            _tasks = tasks;
            _isloading = false;
            _error = null;
            notifyListeners();
          },
          onError: (e) {
            _error = e.toString();
            _isloading = false;
            notifyListeners();
          },
        );
  }

  //ADD  a neww task to the tasks
  Future<void> addTask(String userId, String title, String description) async {
    final task = TaskModel(id: '', title: title, createdAt: DateTime.now());
    await _taskService.addTask(userId, task);
  }

  // Toggle complete/incomplete
  Future<void> toggleTask(String userId, TaskModel task) async {
    await _taskService.toggleComplete(userId, task);
  }

  //delete a exisiting task form the dbs
  Future<void> deleteTask(String userId, String taskid) async {
    await _taskService.deleteTask(userId, taskid);
  }

  //updatetask
  Future<void> updateTask(String userId, TaskModel task) async {
    await _taskService.updateTask(userId, task);
  }
}
