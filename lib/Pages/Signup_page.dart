// ignore_for_file: unused_local_variable

import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cs290_app/Pages/HomePage.dart';
import 'package:cs290_app/Pages/LoginPage.dart';
import 'package:cs290_app/Pages/play.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final _emilController = TextEditingController();
final _passwordController = TextEditingController();
final _FirstNameController = TextEditingController();
final _LastNameController = TextEditingController();
final _db = FirebaseFirestore.instance;

class SignUp_Page extends StatelessWidget {
  const SignUp_Page({super.key});

  // Future addUserDetails(String firstname, String lastname, String email) async {
  //   await FirebaseFirestore.instance.collection('Users').add({
  //     'firstname': firstname,
  //     'lastname': lastname,
  //     'email': email,
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFECABC),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 70),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.close,
                      size: 30,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),

              //title
              const SizedBox(
                height: 20,
              ),

              Image.asset(
                'images/Sign up.png',
                scale: 1.2,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Image.asset(
                  'images/7 2.png',
                  scale: 2,
                ),
              ),

              const SizedBox(
                height: 10,
              ),

              //text  field

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  height: 57,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      textAlign: TextAlign.center,
                      controller: _FirstNameController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'First name',
                        hintStyle: TextStyle(
                            color: Color(
                              0xff8F8A8A,
                            ),
                            fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  height: 57,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      textAlign: TextAlign.center,
                      controller: _LastNameController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Last  name',
                        hintStyle: TextStyle(
                            color: Color(
                              0xff8F8A8A,
                            ),
                            fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 10,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  height: 57,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      textAlign: TextAlign.center,
                      controller: _emilController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Email',
                        hintStyle: TextStyle(
                            color: Color(
                              0xff8F8A8A,
                            ),
                            fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  height: 57,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      textAlign: TextAlign.center,
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: ' Password',
                        hintStyle: TextStyle(
                            color: Color(
                              0xff8F8A8A,
                            ),
                            fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 15,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: GestureDetector(
                  onTap: () async {
                    try {
                      UserCredential userCredential = await FirebaseAuth
                          .instance
                          .createUserWithEmailAndPassword(
                              email: _emilController.text,
                              password: _passwordController.text);

                      // FirebaseFirestore.instance
                      //     .collection("Users")
                      //     .doc(userCredential.user!.email)
                      //     .set({
                      //   'firstname': _FirstNameController.text,
                      //   'lastname': _LastNameController.text,
                      //   'email': _emilController,
                      // });

                      await FirebaseFirestore.instance
                          .collection("Users")
                          .doc(userCredential.user!.email)
                          .set({
                        "firstname": _FirstNameController.text,
                        "lastname": _LastNameController.text,
                        "email": _emilController.text,
                        "img": ""
                      });

                      // addUserDetails(_FirstNameController.text,
                      //     _LastNameController.text, _emilController.text);

                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ));
                    } on FirebaseAuthException catch (e) {
                      if (e.code == "weak-password") {
                        print("The password provided is to weak");
                        showDialog(
                            context: context,
                            builder: (context) {
                              return const AlertDialog(
                                title: Text('The Password is weeak'),
                              );
                            });
                      } else if (e.code == "email-already-in-use") {
                        print("The account is already exist for that email.");
                        showDialog(
                            context: context,
                            builder: (context) {
                              return const AlertDialog(
                                title: Text('The account is Already in use '),
                              );
                            });
                      }
                    }
                    appMusic();
                  },
                  child: Container(
                    height: 60,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: const Color(0xffB6DCEB),
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                      child: Text(
                        "Register",
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: double.infinity,
                      height: 1,
                      color: const Color(0xff8F8A8A),
                    ),
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ));
                      },
                      child: const Text(
                        "Click here to sign In ",
                        style: TextStyle(
                            color: Color(0xff8F8A8A),
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      )),
                  const SizedBox(
                    width: 3,
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: double.infinity,
                      height: 1,
                      color: const Color(0xff8F8A8A),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  appMusic() async {
    final player = AudioPlayer();

    await player.play(
      AssetSource('mixkit-game-level-music-689.wav'),
    );
    player.setReleaseMode(ReleaseMode.loop);
  }
}
