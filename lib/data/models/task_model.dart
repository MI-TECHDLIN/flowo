import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flowo/constants/constant.dart';

class TaskModel {
  final String id;
  final String title;
  final String description;
  final bool isCompleted;
  final int priority;
  final TimeOfDay time;
  final DateTime createdAt;
  TaskModel({
    required this.id,
    required this.title,
    this.time = consttime,
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
      createdAt: (firestoredata['createdAt'] as Timestamp).toDate(),
    );
  }
  // Convert TaskModel → Map to save to Firestore
  Map<String, dynamic> toFirestore() {
    return {
      'title': title,
      'time': time,
      'description': description,
      'isCompleated': isCompleted,
      'priority': priority,
      'createdAt': Timestamp.fromDate(createdAt),
    };
  }

  // Create a modified copy of a task
  TaskModel copyWith({
    String? title,
    String? description,
    bool? isCompleted,
    int? priority,
  }) {
    return TaskModel(
      id: id,
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
      priority: priority ?? this.priority,
      time: time,
      createdAt: createdAt,
    );
  }
}
