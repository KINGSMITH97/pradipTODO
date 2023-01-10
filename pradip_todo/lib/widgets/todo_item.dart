import 'package:flutter/material.dart';
import 'package:pradip_todo/constants/colors.dart';
import 'package:pradip_todo/model/todo.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({super.key, required this.todo});
  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        onTap: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        tileColor: Colors.white,
        leading: const Icon(
          Icons.check_box,
          color: tdBlue,
        ),
        title: Text(
          todo.todoText,
          style: const TextStyle(
            color: tdBlack,
            fontSize: 16,
            decoration: TextDecoration.lineThrough,
          ),
        ),
        trailing: Container(
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: tdRed,
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.delete),
            color: Colors.white,
            iconSize: 18,
          ),
        ),
      ),
    );
  }
}
