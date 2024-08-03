import 'package:flutter/material.dart';

class LifecycleDemo extends StatefulWidget {
  @override
  _LifecycleDemoState createState() => _LifecycleDemoState();
}

class _LifecycleDemoState extends State<LifecycleDemo> {
  @override
  void initState() {
    super.initState();
    print('initState');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('didChangeDependencies');
  }

  @override
  void didUpdateWidget(LifecycleDemo oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget');
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
    print('setState');
  }

  @override
  void deactivate() {
    print('deactivate');
    super.deactivate();
  }

  @override
  void dispose() {
    print('dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lifecycle Methods Demo'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            setState(() {});
          },
          child: const Text('Press me to trigger setState'),
        ),
      ),
    );
  }
}
