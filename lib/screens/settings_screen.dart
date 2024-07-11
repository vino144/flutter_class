import 'package:first_project/nav_drawer.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings Screen'),
      ),
      drawer: const NavDrawer(),
      body: const Center(
        child: Text('Settings Screen Content'),
      ),
    );
  }
}
