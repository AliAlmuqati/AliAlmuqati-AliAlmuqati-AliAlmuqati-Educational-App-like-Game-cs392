import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class Scoreboard extends StatelessWidget {
  const Scoreboard({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff6ccbe),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('Leaderscore')
            .orderBy('points', descending: true)
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No data available'));
          }

          return _buildLeaderboard(snapshot.data!);
        },
      ),
    );
  }

  Widget _buildLeaderboard(QuerySnapshot leaderboardData) {
    return CustomScrollView(
      scrollDirection: Axis.vertical,
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 700,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(19),
                  color: Colors.black12,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Leaderboard",
                            style: GoogleFonts.roboto(
                              fontSize: 32,
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                              shadows: <Shadow>[
                                Shadow(
                                    offset: Offset(5.0, 5.0),
                                    blurRadius: 1.0,
                                    color: Colors.black26),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: IconButton(
                              onPressed: () {
                                //Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.close,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 500,
                      child: ListView.builder(
                        physics: AlwaysScrollableScrollPhysics(),
                        padding: EdgeInsets.only(top: 50),
                        shrinkWrap: true,
                        itemCount: leaderboardData.docs.length,
                        itemBuilder: (BuildContext context, int index) {
                          final data = leaderboardData.docs[index].data()
                              as Map<String, dynamic>;
                          final rank = index + 1;
                          final username = data['name'] ?? "User1";
                          final score = data['points'] ?? 0;
                          final image = data["img"] ?? "";

                          return Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 30, right: 30),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            rank.toString(),
                                            style: GoogleFonts.roboto(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w900,
                                              color: Colors.white,
                                              shadows: <Shadow>[
                                                Shadow(
                                                    offset: Offset(5.0, 5.0),
                                                    blurRadius: 1.0,
                                                    color: Colors.black26),
                                              ],
                                            ),
                                          ),
                                          SizedBox(width: 40),
                                          image != ""
                                              ? Image.network(
                                                  image,
                                                  height: 36,
                                                  width: 46,
                                                )
                                              : Image.asset(
                                                  "images/toppng 1.png",
                                                  height: 36,
                                                  width: 46,
                                                ),
                                          SizedBox(width: 40),
                                          Text(
                                            username,
                                            style: GoogleFonts.roboto(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w900,
                                              color: Colors.white,
                                              shadows: <Shadow>[
                                                Shadow(
                                                    offset: Offset(5.0, 5.0),
                                                    blurRadius: 1.0,
                                                    color: Colors.black26),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        score.toString(),
                                        style: GoogleFonts.roboto(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w900,
                                          color: Color(0xffFFD94D),
                                          shadows: <Shadow>[
                                            Shadow(
                                                offset: Offset(5.0, 5.0),
                                                blurRadius: 1.0,
                                                color: Colors.black26),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
