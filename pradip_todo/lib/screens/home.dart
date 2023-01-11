import 'package:flutter/material.dart';
import 'package:pradip_todo/constants/colors.dart';
import 'package:pradip_todo/model/todo.dart';
import 'package:pradip_todo/widgets/todo_item.dart';

class Home extends StatefulWidget {
  Home({super.key});

  final todosList = Todo.todoList();
  final todoController = TextEditingController();

  List<Todo> filteredTodo = [];

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    widget.filteredTodo = widget.todosList;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBgColor,
      appBar: buildAppBar(),
      body: Stack(
        children: [
          Container(
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
                      for (Todo todo in widget.filteredTodo)
                        TodoItem(
                          todo: todo,
                          onTap: () => checkIfTaskComplete(todo),
                          onDelete: () => deleteTask(todo.id),
                        ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin:
                        const EdgeInsets.only(bottom: 20, right: 20, left: 20),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          offset: const Offset(0.0, 0.0),
                          blurRadius: 5.0,
                          spreadRadius: 3,
                        )
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: widget.todoController,
                      decoration: const InputDecoration(
                        hintText: "Add a new ToDo",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20, right: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        widget.todosList.add(
                          Todo(
                            id: DateTime.now().microsecond.toString(),
                            todoText: widget.todoController.text,
                          ),
                        );
                      });
                      widget.todoController.clear();
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: tdBlue,
                      backgroundColor: tdBlue,
                      minimumSize: const Size(60, 60),
                      elevation: 5,
                    ),
                    child: const Text(
                      "+",
                      style: TextStyle(fontSize: 40, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void checkIfTaskComplete(Todo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void deleteTask(String? id) {
    setState(() {
      widget.todosList.removeWhere((task) => task.id == id);
    });
  }

void filterTodoList(String keyWordEnetered){
    List<Todo> result = [];
    if(keyWordEnetered.isEmpty){
      result = widget.todosList;
    }else{
      result = widget.todosList.where((task) => task.todoText.toLowerCase().contains(keyWordEnetered.toLowerCase())).toList();
    }
    setState(() {
      widget.filteredTodo = result;
    });
}

Widget searchBox() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 8),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
    ),
    child: TextField(
      onChanged: (value) => filterTodoList(value),
      decoration: const InputDecoration(
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
