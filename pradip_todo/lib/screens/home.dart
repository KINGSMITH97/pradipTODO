import 'package:flutter/material.dart';
import 'package:pradip_todo/constants/colors.dart';
import 'package:pradip_todo/model/todo.dart';
import 'package:pradip_todo/widgets/todo_item.dart';

class Home extends StatefulWidget {
  Home({super.key});

  final todosList = Todo.todoList();

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBgColor,
      appBar: buildAppBar(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          children: [
            searchBox(),
            Expanded(
              child: ListView(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 50, bottom: 20),
                    child: const Text(
                      "All ToDo's",
                      style: TextStyle(
                        letterSpacing: 1,
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  for (Todo todo in widget.todosList) TodoItem(todo: todo),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      toolbarHeight: 50,
      backgroundColor: tdBgColor,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Icon(
            Icons.menu,
            color: tdBlack,
            size: 30,
          ),
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.amber,
            foregroundImage: AssetImage("assets/images/port.jpg"),
          ),
        ],
      ),
    );
  }
}

Widget searchBox() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 8),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
    ),
    child: const TextField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(0),
        prefixIcon: Icon(
          Icons.search,
          color: tdBlack,
          size: 20,
        ),
        prefixIconConstraints: BoxConstraints(maxHeight: 20, minWidth: 25),
        border: InputBorder.none,
        hintText: "Search",
        hintStyle: TextStyle(color: tdGrey),
      ),
    ),
  );
}
