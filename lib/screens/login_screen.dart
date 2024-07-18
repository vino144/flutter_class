import 'package:first_project/screens/bloc/login_bloc.dart';
import 'package:first_project/screens/myhomescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Login Screen'),
            automaticallyImplyLeading: false,
          ),
          body: loginView(context)),
    );
  }

  Widget loginView(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      if (state is LoginLoading) {
        return const Center(child: CircularProgressIndicator());
      }
      if (state is LoginSuccess) {
        return MyHomeScreen(userName: userNameController.text);
      }
      if (state is LoginError) {
        return const Center(child: Text("Error"));
      }
      if (state is LoginInitial) {
        return Center(
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
                    BlocProvider.of<LoginBloc>(context).add(LoginPressed(
                        userNameController.text, passwordController.text));

                    // if (userNameController.text.isNotEmpty) {
                    //   if (passwordController.text.isNotEmpty) {
                    //     if (userNameController.text == "vinoth" &&
                    //         passwordController.text == "123456") {
                    //       setState(() {
                    //         _validate = false;
                    //       });
                    //       print("Welcome Vinoth");
                    //       //Navigator.of(context).pushReplacementNamed('/home');
                    //       Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //             builder: (context) => MyHomeScreen(
                    //                   userName: userNameController.text,
                    //                 )),
                    //       );
                    //     }
                    //   } else {
                    //     print("Invalid Credentials");
                    //     setState(() {
                    //       _validate = true;
                    //     });
                    //   }
                    // } else {
                    //   print("Invalid Credentials");
                    //   setState(() {
                    //     _validate = true;
                    //   });
                    // }
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
        );
      }
      return const Center(child: Text("Error"));
    });
  }
}
