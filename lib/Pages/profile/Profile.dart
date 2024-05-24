import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cs290_app/Pages/leaderBoard.dart';
import 'package:cs290_app/Pages/profile/edit_profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final _db = FirebaseFirestore.instance;

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final currentUser = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xfff6ccbe),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.close,
                size: 30,
                color: Colors.white,
              ),
            ),
          ),
        ],
        elevation: 0.0,
      ),
      body: Stack(
        children: [
          Expanded(
            child: StreamBuilder<DocumentSnapshot>(
              stream: _db.collection("Users").doc(currentUser.email).snapshots(),
              builder: (BuildContext context, snapshot) {
                if (snapshot.hasData) {
                  final userdata = snapshot.data?.data() as Map<String, dynamic>?;
                  final imgUrl = userdata?['img'];

                  return Container(
                    color: Color(0xfff6ccbe),
                    child: CustomScrollView(
                      scrollDirection: Axis.vertical,
                      slivers: [
                        SliverFillRemaining(
                          hasScrollBody: false,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15, bottom: 30),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 20),
                                      child: Center(
                                        child: Container(
                                          width: double.infinity,
                                          height: 167,
                                          decoration: BoxDecoration(
                                            color: Color(0xffE1A99A),
                                            borderRadius: BorderRadius.circular(12),
                                            border: Border.all(width: 2, color: Color(0xffDAFBFC)),
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  imgUrl != null && imgUrl.isNotEmpty
                                                      ? ClipRRect(
                                                    borderRadius: BorderRadius.circular(100),
                                                    child: CircleAvatar(
                                                      radius: 50,
                                                      backgroundImage: NetworkImage(imgUrl),
                                                    ),
                                                  )
                                                      : CircleAvatar(
                                                    radius: 50,
                                                    backgroundImage: AssetImage("images/toppng 1.png"),
                                                  ),

                                                ],
                                              ),
                                              SizedBox(width: 10),
                                              Text(
                                                "${userdata?["firstname"] ?? ''} ${userdata?['lastname'] ?? ''} ",
                                                style: GoogleFonts.roboto(
                                                  fontSize: 32,
                                                  fontWeight: FontWeight.w900,
                                                  color: Colors.white,
                                                  shadows: <Shadow>[
                                                    Shadow(
                                                      offset: Offset(5.0, 5.0),
                                                      blurRadius: 1.0,
                                                      color: Colors.black26,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 25),
                                    SizedBox(height: 35),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 25, right: 25),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            'images/cross.png',
                                            height: 102,
                                            width: 113,
                                          ),
                                          SizedBox(width: 20),
                                          Column(
                                            children: [
                                              Text(
                                                "Play Streak",
                                                style: GoogleFonts.roboto(
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.w900,
                                                  color: Colors.white,
                                                  shadows: <Shadow>[
                                                    Shadow(
                                                      offset: Offset(4.0, 4.0),
                                                      blurRadius: 0.5,
                                                      color: Colors.black26,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Text(
                                                "3 days in a row",
                                                style: GoogleFonts.roboto(
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.w900,
                                                  color: Colors.white,
                                                  shadows: <Shadow>[
                                                    Shadow(
                                                      offset: Offset(4.0, 4.0),
                                                      blurRadius: 0.5,
                                                      color: Colors.black26,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    SizedBox(height: 100),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => Scoreboard()),
                                            );
                                          },
                                          child: Text(
                                            "View Ladderboard",
                                            style: GoogleFonts.roboto(
                                              fontSize: 32,
                                              fontWeight: FontWeight.w900,
                                              color: Colors.white,
                                              shadows: <Shadow>[
                                                Shadow(
                                                  offset: Offset(4.0, 4.0),
                                                  blurRadius: 0.5,
                                                  color: Colors.black26,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 50),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(builder: (context) => Edit_Profile()),
                                            );
                                          },
                                          child: Text(
                                            "Edit Profile",
                                            style: GoogleFonts.roboto(
                                              fontSize: 24,
                                              fontWeight: FontWeight.w900,
                                              color: Colors.white,
                                              shadows: <Shadow>[
                                                Shadow(
                                                  offset: Offset(4.0, 4.0),
                                                  blurRadius: 0.5,
                                                  color: Colors.black26,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error ${snapshot.error}'));
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
          ),
          StreamBuilder<DocumentSnapshot>(
            stream: _db.collection("Leaderscore").doc(currentUser.email).snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final userpoints = snapshot.data?.data() as Map<String, dynamic>?;
                return Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'images/free-star-bookmark-favorite-shape-rank-16-28621 1.png',
                              height: 102,
                              width: 113,
                            ),
                            SizedBox(width: 20),
                            Text(
                              "Total Points",
                              style: GoogleFonts.roboto(
                                fontSize: 24,
                                fontWeight: FontWeight.w900,
                                color: Colors.white,
                                shadows: <Shadow>[
                                  Shadow(
                                    offset: Offset(4.0, 4.0),
                                    blurRadius: 0.5,
                                    color: Colors.black26,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Text(
                          userpoints?["points"].toString() ?? "0",
                          style: GoogleFonts.roboto(
                            fontSize: 24,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                            shadows: <Shadow>[
                              Shadow(
                                offset: Offset(4.0, 4.0),
                                blurRadius: 0.5,
                                color: Colors.black26,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'images/free-star-bookmark-favorite-shape-rank-16-28621 1.png',
                              height: 102,
                              width: 113,
                            ),
                            SizedBox(width: 20),
                            Text(
                              "Total Points",
                              style: GoogleFonts.roboto(
                                fontSize: 24,
                                fontWeight: FontWeight.w900,
                                color: Colors.white,
                                shadows: <Shadow>[
                                  Shadow(
                                    offset: Offset(4.0, 4.0),
                                    blurRadius: 0.5,
                                    color: Colors.black26,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "0",
                          style: GoogleFonts.roboto(
                            fontSize: 24,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                            shadows: <Shadow>[
                              Shadow(
                                offset: Offset(4.0, 4.0),
                                blurRadius: 0.5,
                                color: Colors.black26,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
