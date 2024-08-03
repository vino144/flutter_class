import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class PhoneAuthScreen extends StatefulWidget {
  const PhoneAuthScreen({super.key});

  @override
  PhoneAuthScreenState createState() => PhoneAuthScreenState();
}

class PhoneAuthScreenState extends State<PhoneAuthScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();
  String _verificationId = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Phone Authentication')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _phoneController,
              decoration: const InputDecoration(labelText: 'Phone Number'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _verifyPhoneNumber,
              child: const Text('Verify Phone Number'),
            ),
            TextField(
              controller: _codeController,
              decoration: const InputDecoration(labelText: 'Verification Code'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _signInWithPhoneNumber,
              child: const Text('Sign In'),
            ),
            ElevatedButton(
              onPressed: () {
                signInWithGoogle(context);
              },
              child: const Text('Google Sign In'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> signInWithGoogle(BuildContext context) async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    var userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    // Once signed in, return the UserCredential

    print("USERNAME: ${userCredential.user!.displayName}");

    if (userCredential.user != null) {
      print("USER IS NOT NULL");
      Navigator.pushReplacementNamed(context, '/home');
    }

    //return userCredential;
  }

  void _verifyPhoneNumber() async {
    await _auth.verifyPhoneNumber(
      phoneNumber: _phoneController.text,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
        print('LOGIN SUCCESS');
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        } else {
          print('Failed to verify phone number: ${e.message}');
        }
      },
      codeSent: (String verificationId, int? resendToken) {
        print('CODE SENT SUCCESS');
        setState(() {
          _verificationId = verificationId;
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        setState(() {
          _verificationId = verificationId;
        });
      },
    );
  }

  void _signInWithPhoneNumber() async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId,
        smsCode: _codeController.text,
      );
      await _auth.signInWithCredential(credential);
      print('Successfully signed in');
      Navigator.pushReplacementNamed(context, '/home');
    } catch (e) {
      if (e is FirebaseAuthException && e.code == 'invalid-verification-code') {
        print('The verification code is invalid.');
      } else {
        print('Failed to sign in: ${e}');
      }
    }
  }
}
