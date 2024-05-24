// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cs290_app/Pages/Mapgame.dart';
import 'package:cs290_app/Pages/profile/Profile.dart';
import 'package:cs290_app/Pages/settings_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    bool L1 = false;
    bool L2 = false;
    bool L3 = false;
    bool L4 = false;
    bool L5 = false;
    bool L6 = false;
    bool L7 = false;
    bool L8 = false;
    bool L9 = false;
    return Scaffold(
      backgroundColor: const Color(0xffFECABC),
      body: SingleChildScrollView(
          child: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection("Levels")
            .doc(FirebaseAuth.instance.currentUser?.email)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final leveldata = snapshot.data?.data() as Map<String, dynamic>?;
            return Padding(
              padding: const EdgeInsets.only(top: 90),
              child: Column(
                children: [
                  Image.asset(
                    'images/7 2.png',
                    scale: 1.7,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Center(
                      child: Padding(
                    padding: EdgeInsets.only(bottom: 50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Mapgame(
                                    level1: leveldata?["Level1"] ?? false,
                                    level2: leveldata?["Level2"] ?? false,
                                    level3: leveldata?["level3"] ?? false,
                                    level4: leveldata?["level4"] ?? false,
                                    level5: leveldata?["level5"] ?? false,
                                    level6: leveldata?["level6"] ?? false,
                                    level7: leveldata?["level7"] ?? false,
                                    level8: leveldata?["level8"] ?? false,
                                    level9: leveldata?["level9"] ?? false,
                                  ),
                                ));
                          },
                          child: Card(
                            shadowColor: Colors.black,
                            elevation: 17,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: Container(
                              height: 61,
                              width: 276,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: const [
                                        Colors.white,
                                        Color(0xff484848),
                                      ])),
                              child: Center(
                                child: Text(
                                  "Play",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Profile(),
                                ));
                          },
                          child: Card(
                            shadowColor: Colors.black,
                            elevation: 17,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: Container(
                              height: 61,
                              width: 276,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: const [
                                        Colors.white,
                                        Color(0xff484848),
                                      ])),
                              child: Center(
                                child: Text(
                                  "Profile",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SettingsScreen()));
                          },
                          child: Card(
                            shadowColor: Colors.black,
                            elevation: 17,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: Container(
                              height: 61,
                              width: 276,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: const [
                                        Colors.white,
                                        Color(0xff484848),
                                      ])),
                              child: Center(
                                child: Text(
                                  "Settings",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ))
                ],
              ),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.only(top: 90),
              child: Column(
                children: [
                  Image.asset(
                    'images/7 2.png',
                    scale: 1.7,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Center(
                      child: Padding(
                    padding: EdgeInsets.only(bottom: 50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Mapgame(
                                    level1: L1,
                                    level2: L2,
                                    level3: L3,
                                    level4: L4,
                                    level5: L5,
                                    level6: L6,
                                    level7: L7,
                                    level8: L8,
                                    level9: L9,
                                  ),
                                ));
                          },
                          child: Card(
                            shadowColor: Colors.black,
                            elevation: 17,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: Container(
                              height: 61,
                              width: 276,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: const [
                                        Colors.white,
                                        Color(0xff484848),
                                      ])),
                              child: Center(
                                child: Text(
                                  "Play",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Profile(),
                                ));
                          },
                          child: Card(
                            shadowColor: Colors.black,
                            elevation: 17,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: Container(
                              height: 61,
                              width: 276,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: const [
                                        Colors.white,
                                        Color(0xff484848),
                                      ])),
                              child: Center(
                                child: Text(
                                  "Profile",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/Profile');
                          },
                          child: Card(
                            shadowColor: Colors.black,
                            elevation: 17,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: Container(
                              height: 61,
                              width: 276,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: const [
                                        Colors.white,
                                        Color(0xff484848),
                                      ])),
                              child: Center(
                                child: Text(
                                  "Settings",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ))
                ],
              ),
            );
          }
        },
      )),
    );
  }
}
