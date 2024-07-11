import 'package:first_project/nav_drawer.dart';
import 'package:first_project/widgets/grid_view_widget.dart';
import 'package:flutter/material.dart';

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Feedback Screen'),
        ),
        drawer: const NavDrawer(),
        body: const GridViewWidget());
  }
}
