import 'package:first_project/grid_view_widget.dart';
import 'package:first_project/sample.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Day 03'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _validate = false;

  int _incrementCounter(String name, int num, bool flag) {
    //Sample objSample = Sample();
    Sample objSample = Sample(_counter);

    print("NAME: $name");
    //_counter++;
    // control flow statements
    // IF Statement

    setState(() {
      _counter++;
    });
    if (_counter == 11 && _counter != 12) {
      print("Hi I am 11");
    } else if (_counter == 13) {
      print("I am not 13");
    } else {
      print("I am not 11");
    }
    // Switch Statement

    switch (_counter) {
      case 13:
        print("I am 13");
        break;
      case 14:
        print("I am 14");
        break;
      default:
        print("I am not 13 or 14");
        break;
    }

    List<int> intList = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    // For Loop
    for (int i = 0; i < intList.length; i++) {
      print(intList[i]);
    }

    return _counter;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                  controller: userNameController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    hintText: 'Enter your username',
                    focusedBorder: const OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.greenAccent, width: 2.0),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    ),
                    errorText: _validate ? "Value Can't Be Empty" : null,
                  )),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: "Password",
                  hintText: "Enter your password",
                  focusedBorder: const OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.greenAccent, width: 2.0),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                  ),
                  errorText: _validate ? "Value Can't Be Empty" : null,
                ),
                obscureText: true,
              ),
              const SizedBox(
                height: 15,
              ),
              MaterialButton(
                onPressed: () {
                  print("Username: ${userNameController.text}");
                  print("Password: ${passwordController.text}");
                  if (userNameController.text.isNotEmpty) {
                    if (passwordController.text.isNotEmpty) {
                      if (userNameController.text == "vinoth" &&
                          passwordController.text == "123456") {
                        setState(() {
                          _validate = false;
                        });
                        print("Welcome Vinoth");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GridViewWidget(
                                    userName: userNameController.text,
                                  )),
                        );
                      }
                    } else {
                      print("Invalid Credentials");
                      setState(() {
                        _validate = true;
                      });
                    }
                  } else {
                    print("Invalid Credentials");
                    setState(() {
                      _validate = true;
                    });
                  }
                },
                color: Colors.amber,
                child: const Text(
                  "Login",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     int answer = _incrementCounter("vinoth", 1, true);
      //     print('answer: $answer');
      //   },
      //   tooltip: 'Increment',
      //   child: const Text("Add"),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
