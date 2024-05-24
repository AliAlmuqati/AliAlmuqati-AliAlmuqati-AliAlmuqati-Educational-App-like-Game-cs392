// ignore_for_file: non_constant_identifier_names, file_names

import 'package:audioplayers/audioplayers.dart';
import 'package:cs290_app/Pages/HomePage.dart';
import 'package:cs290_app/Pages/Signup_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

final _emilController = TextEditingController();
final _passwordController = TextEditingController();

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void _EroorMesage_Email() {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            title: Text('The Email proveded is not  in use '),
            content: Text('You can register with us now!'),
          );
        });
  }

  void _EroorMesage_Password() {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            title: Text('The Password proveded is Incorrect '),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    Future signUserIn() async {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: _emilController.text, password: _passwordController.text);
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          _EroorMesage_Email();
          //print("No user found for that email.");
        } else if (e.code == 'wrong-password') {
          //print("Wrong password provided for that user");
          _EroorMesage_Password();
        }
      }
    }

    return Scaffold(
        backgroundColor: const Color(0xffFECABC),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 70),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
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
                  'images/Sign in.png',
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
                        controller: _passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Password',
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
                    onTap: () {
                      signUserIn();
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
                          "Sign In",
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
                                builder: (context) => SignUp_Page(),
                              ));
                        },
                        child: const Text(
                          "Click here to sign up ",
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
        ));
  }

  appMusic() async {
    final player = AudioPlayer();

    await player.play(
      AssetSource('mixkit-game-level-music-689.wav'),
    );
    player.setReleaseMode(ReleaseMode.loop);
  }
}
