import 'package:flutter/material.dart';

class SafeAreaClass extends StatelessWidget {
  const SafeAreaClass({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.blue,
          child: Text(
            'This is an example explaining use of SafeArea',
            style: TextStyle(color: Colors.green, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
