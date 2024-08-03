import 'package:first_project/presentation/widgets/nav_drawer.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Screen'),
      ),
      drawer: const NavDrawer(),
      body: const Center(
        child: Text('Profile Screen Content'),
      ),
    );
  }
}
