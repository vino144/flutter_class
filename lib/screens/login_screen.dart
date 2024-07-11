import 'package:first_project/screens/myhomescreen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _validate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
        automaticallyImplyLeading: false,
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
                        //Navigator.of(context).pushReplacementNamed('/home');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyHomeScreen(
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
    );
  }
}
