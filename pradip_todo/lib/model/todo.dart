import 'package:flutter/foundation.dart';

class Todo {
  String? id;
  String todoText;
  bool isDone;

  Todo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  static List<Todo> todoList(){
    return [
      Todo(id: "01", todoText: "Clean the room", isDone: true),
      Todo(id: "02", todoText: "Read Clean Architecture", isDone: true),
      Todo(id: "03", todoText: "Talk to Milly"),
      Todo(id: "03", todoText: "Talk to Milly"),
    ];
  }
}
