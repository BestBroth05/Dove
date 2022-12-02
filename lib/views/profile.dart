import 'package:best_mod/views/colorimetria.dart';
import 'package:best_mod/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../controllers/auth_firebase.dart';
import '../widgets/text_frave.dart';

final User? user = Auth().currentUser;

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Profile"),
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(174, 217, 224, 1),
            fontFamily: "Pacifico",
            fontSize: 20,
          ),
          backgroundColor: Color.fromRGBO(250, 243, 221, 1),
        ),
        backgroundColor: Color.fromRGBO(250, 243, 221, 1),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(0.0),
              child: Image.asset(
                'Assets/woman.png',
                width: 100,
                height: 100,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "¡Hello!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(174, 217, 224, 1),
                fontFamily: "Pacifico",
              ),
            ),
            const SizedBox(height: 20),
            Text(
              user!.email!,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(174, 217, 224, 1),
                fontFamily: "Pacifico",
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "What can we do for you?!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(174, 217, 224, 1),
                fontFamily: "Pacifico",
              ),
            ),
            _ButtonCustom(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => Colorimetria())));
              },
              text: 'Ir a Colorimetria',
              icon: 'colors.png',
            ),
            const SizedBox(height: 20),
            _ButtonCustom(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => HomePage())));
              },
              text: 'Ir a Pagina Principal',
              icon: 'home.png',
            ),
          ],
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
