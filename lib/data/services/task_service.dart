import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/task_model.dart';

class TaskService {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  //references to a user's task collection
  CollectionReference _tasksRef(String userId) {
    return _firebaseFirestore
        .collection('users')
        .doc(userId)
        .collection('tasks');
  }

  //create -aadd anew task
  Future<void> addTask(String userId, TaskModel task) async {
    await _tasksRef(userId).add(task.toFirestore());
  }

  //Read - Stream of all tasks livefeed
  Stream<List<TaskModel>> gettasks(String userID) {
    '''
this function works with the listentotask 
gettask serves as a pipe to send live updates from the firestore
with listentotask listens to it and updates the notfylister
''';
    return _tasksRef(
      userID,
    ).orderBy('createdAt', descending: true).snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => TaskModel.fromFirestore(doc)).toList();
    });
  }

  //update-editi an existingtask
  Future<void> updateTask(String userID, TaskModel task) async {
    await _tasksRef(userID).doc(task.id).update(task.toFirestore());
  }

  //delete task
  Future<void> deleteTask(String userId, String taskid) async {
    _tasksRef(userId).doc(taskid).delete();
  }

  //toggle/clcick
  // TOGGLE — mark complete/incomplete
  Future<void> toggleComplete(String userId, TaskModel task) async {
    await _tasksRef(
      userId,
    ).doc(task.id).update({'isCompleted': !task.isCompleted});
  }
}
