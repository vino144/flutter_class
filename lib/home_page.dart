import 'package:flutter/material.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key, required this.userName});
  final String userName;

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            child: Text("Hi ${widget.userName}"),
          ),
          Container(
              alignment: Alignment.topRight,
              child: MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  color: Colors.green,
                  child: const Text("Click to CLose"))),
        ],
      ),
    );
  }
}
