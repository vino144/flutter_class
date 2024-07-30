import 'package:firebase_auth/firebase_auth.dart';
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
  TextEditingController phoneController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

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

                    print('LOGIN SUCCESS');

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
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: phoneController,
                  decoration: InputDecoration(
                    labelText: "Phone Number",
                    hintText: "Enter your Phone Number",
                    focusedBorder: const OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.greenAccent, width: 2.0),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    ),
                    errorText: _validate ? "Value Can't Be Empty" : null,
                  ),
                  obscureText: false,
                ),
                const SizedBox(
                  height: 10,
                ),
                MaterialButton(
                  onPressed: () {
                    print("Phone Numer: ${phoneController.text}");

                    verifyPhoneNumber(phoneController.text);
                    print('LOGIN SUCCESS');
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

  Future<void> verifyPhoneNumber(String phoneNumber) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        // Auto-retrieve verification code
        await _auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        // Verification failed
      },
      codeSent: (String verificationId, int? resendToken) async {
        // Save the verification ID for future use
        String smsCode = 'xxxxxx'; // Code input by the user
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId,
          smsCode: smsCode,
        );
        // Sign the user in with the credential
        await _auth.signInWithCredential(credential);
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
      timeout: const Duration(seconds: 60),
    );
  }
}
