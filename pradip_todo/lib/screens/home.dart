import 'package:flutter/material.dart';
import 'package:pradip_todo/constants/colors.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: tdBgColor,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(
              Icons.menu,
              color: tdBlack,
              size: 30,
            ),
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.transparent,
              child: Image.asset("assets/images/port.jpg"),
            ),
          ],
        ),
      ),
      body: Column(
        children: const [
          Text("This is a home screen"),
        ],
      ),
    );
  }
}
