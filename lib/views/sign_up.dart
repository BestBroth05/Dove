import 'package:best_mod/Authenticator.dart';
import 'package:best_mod/controllers/auth_firebase.dart';
import 'package:best_mod/views/home_page.dart';
import 'package:best_mod/views/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../widgets/text_frave.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String? errorMessage = "";
  final TextEditingController controllerUserEmail = TextEditingController();
  final TextEditingController controllerUserPassword = TextEditingController();
  final TextEditingController controllerUserName = TextEditingController();

  Future<void> signOut() async {
    try {
      await Auth().signOut(
          email: controllerUserEmail.text,
          password: controllerUserPassword.text);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    bool _showPassword = false;
    return Scaffold(
        appBar: AppBar(
          title: Text('Sign In'),
          backgroundColor: Color.fromRGBO(94, 100, 114, 1),
        ),
        backgroundColor: Color.fromRGBO(250, 243, 221, 1),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 210,
                    color: Color.fromRGBO(94, 100, 114, 1),
                  ),
                  Positioned(
                    top: 110,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(250, 243, 221, 1),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 110,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(94, 100, 114, 1),
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(40.0)),
                          border: Border.all(
                              color: Color.fromRGBO(94, 100, 114, 1),
                              width: 0)),
                    ),
                  ),
                  Positioned(
                    top: 160,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(250, 243, 221, 1),
                          borderRadius:
                              BorderRadius.only(topLeft: Radius.circular(40.0)),
                          border: Border.all(
                              color: Color.fromRGBO(250, 243, 221, 1))),
                    ),
                  ),
                  Positioned(
                    top: 55,
                    left: 20,
                    child: Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(250, 243, 221, 1),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(0.0),
                          child: Image.asset(
                            'Assets/Dove_Logo.png',
                          ),
                        )),
                  ),
                  Positioned(
                      top: 75,
                      left: 100,
                      child: const TextFrave(
                          text: 'Welcome to the family DOV´É',
                          fontSize: 20,
                          color: Color.fromRGBO(250, 243, 221, 1))),
                ],
              ),
              /* MaterialButton(
                onPressed: () async {
                  User? user =
                      await Authenticator.iniciarSecion(context: context);
                  print(user?.displayName);
                },
                color: Colors.white,
                child: Image.asset('Assets/googleIcon.png'),
              ),*/

              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  controller: controllerUserName,
                  decoration: InputDecoration(labelText: 'User Name'),
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  controller: controllerUserEmail,
                  decoration: InputDecoration(
                      labelText: 'Email Address',
                      suffixIcon: Icon(Icons.alternate_email_outlined)),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  controller: controllerUserPassword,
                  decoration: InputDecoration(
                      labelText: 'Password',
                      suffixIcon: Icon(_showPassword == false
                          ? Icons.visibility_off
                          : Icons.visibility)),
                  onTap: () {
                    setState(() {
                      _showPassword = !_showPassword;
                    });
                  },
                  obscureText: _showPassword == false ? true : false,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  height: 55,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(174, 217, 224, 1),
                      borderRadius: BorderRadius.circular(7.0)),
                  child: TextButton(
                    onPressed: (() {
                      FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: controllerUserEmail.text,
                              password: controllerUserPassword.text)
                          .then((value) => {
                                print("Created new account"),
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) => HomePage())))
                              });
                    }),
                    child: const TextFrave(
                        text: 'Sign Up', color: Colors.white, fontSize: 22),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class _ButtonCustom extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final String icon;

  const _ButtonCustom(
      {required this.onPressed, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: InkWell(
        onTap: onPressed,
        splashColor: Color(0xffEFF3F6),
        child: Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7.0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Color(0xffA0A5B9).withOpacity(0.35),
                    spreadRadius: 1,
                    blurRadius: 20)
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('Assets/$icon', height: 20),
              const SizedBox(width: 15.0),
              TextFrave(text: text, color: Color(0xffA0A5B9), fontSize: 16)
            ],
          ),
        ),
      ),
    );
  }
}
