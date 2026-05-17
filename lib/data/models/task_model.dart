import 'package:cloud_firestore/cloud_firestore.dart';

class TaskModel {
  final String id;
  final String title;
  final String description;
  final int? duration;
  final bool isCompleted;
  final int priority;
  final String time;
  final DateTime createdAt;
  TaskModel({
    required this.id,
    required this.title,
    this.duration,
    required this.time,
    this.description =
        '', //description would be optional, there would be a default description
    this.isCompleted = false,
    this.priority = 2, //user priority would be measured by 2
    required this.createdAt,
  });
  //taskmodel converted to a firestore
  factory TaskModel.fromFirestore(DocumentSnapshot doc) {
    final firestoredata = doc.data() as Map<String, dynamic>;
    return TaskModel(
      id: doc.id,
      title: firestoredata['title'] ?? '',
      time: firestoredata['time'] ?? '',
      description: firestoredata['description'] ?? '',
      isCompleted: firestoredata['isCompleted'] ?? false,
      priority: firestoredata['priority'] ?? 2,
      duration: firestoredata['duration'] ?? '',
      createdAt: (firestoredata['createdAt'] as Timestamp).toDate(),
    );
  }
  // Convert TaskModel → Map to save to Firestore
  Map<String, dynamic> toFirestore() {
    '''
for reading to the firestoore instead of using Timeofday as datatype  i used 
a string and formated the timeof day because we cant actually get read of timeofday as datatype
''';
    return {
      'title': title,
      'time': time,
      'description': description,
      'duration': duration,
      'isCompleted': isCompleted,
      'priority': priority,
      'createdAt': Timestamp.fromDate(createdAt),
    };
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'descrription': description,
      'priority': priority,
      'is_completed': isCompleted,
    };
  }

  // Create a modified copy of a task
  TaskModel copyWith({
    String? title,
    String? time,
    int? duration,
    String? description,
    bool? isCompleted,
    int? priority,
  }) {
    return TaskModel(
      id: id,
      title: title ?? this.title,
      description: description ?? this.description,
      duration: duration ?? this.duration,
      isCompleted: isCompleted ?? this.isCompleted,
      priority: priority ?? this.priority,
      time: time ?? this.time,
      createdAt: createdAt,
    );
  }
}
