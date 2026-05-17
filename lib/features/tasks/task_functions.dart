import 'package:flowo/data/models/suggestiion_response,.dart';
import 'package:flowo/data/services/ai_service.dart';
import 'package:flutter/material.dart';
import 'package:flowo/data/models/task_model.dart';
import 'package:flowo/data/services/task_service.dart';

class TaskController extends ChangeNotifier {
  //this are private properity they can only be read
  final TaskService _taskService = TaskService();
  List<TaskModel> _tasks = [];
  var aiservice = AiService();

  //ai_variables
  bool _isloadingsug = false;
  bool get isloadingsug => _isloadingsug;
  SuggestionResponse? _suggestion;
  SuggestionResponse get suggestion => _suggestion!;

  //state_variables
  bool _isloading = false;
  String? _error;
  String errortaskmessge() {
    final errormessgae = 'there a is a netwok issue';
    return errormessgae;
  }

  //a reasd only accesss function my datas can be manupulated
  List<TaskModel> get tasks => _tasks;
  bool get isLoading => _isloading;
  String? get error => _error;

  //this function splits tasks to completed and not complemeted session
  List<TaskModel> get activetasks =>
      _tasks.where((t) => !t.isCompleted).toList();

  //compleete
  List<TaskModel> get completeedtasks =>
      _tasks.where((t) => t.isCompleted).toList();

  //thhis listens to the firestore dbs
  void listenTOtasks(String userId) {
    _isloading = true;
    notifyListeners();
    '''
Any update made on firestore this functions basicalyy listens to it
it wworks with our stream ... listentiask function acts as the listener 
''';

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

  //fetchsuggetion
  Future<void> fetchSuggestions() async {
    if (activetasks.isEmpty) return;

    _isloadingsug = true;
    notifyListeners();

    try {
      _suggestion = await aiservice.getSuggestions(activetasks);
    } catch (e) {
      _error = e.toString();
    } finally {
      _isloadingsug = false;
      notifyListeners();
    }
  }

  //ADD  a neww task to the tasks
  Future<void> addTask(
    String userId,
    String title,
    String description,
    int duration,
    TimeOfDay time,
    int priority,
    BuildContext context,
  ) async {
    final task = TaskModel(
      id: '',
      time: time.format(context).toString(),
      title: title,
      description: description,
      duration: duration,
      priority: priority,
      createdAt: DateTime.now(),
    );
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
