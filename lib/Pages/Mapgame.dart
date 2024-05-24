import 'package:flutter/material.dart';
import 'package:cs290_app/Pages/HomePage.dart';
import 'package:cs290_app/Pages/Questions.dart';
import 'package:cs290_app/Pages/Tutorial1.dart';
import 'package:cs290_app/Pages/Tutorial2.dart'; // تأكد من استيراد Tutorial2
import 'dart:math' as math;

class Mapgame extends StatefulWidget {
  bool level1;
  bool level2;
  bool level3;
  bool level4;
  bool level5;
  bool level6;
  bool level7;
  bool level8;
  bool level9;

  Mapgame(
      {super.key,
      required this.level1,
      required this.level2,
      required this.level3,
      required this.level4,
      required this.level5,
      required this.level6,
      required this.level7,
      required this.level8,
      required this.level9});

  @override
  State<Mapgame> createState() => _MapgameState();
}

class _MapgameState extends State<Mapgame> {
  bool L1 = false;
  bool L2 = false;
  bool L3 = false;
  bool L4 = false;
  bool L5 = false;
  bool L6 = false;
  bool L7 = false;
  bool L8 = false;
  bool L9 = false;

  Future<bool> _onWillPop() async {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(), // تغيير HomePage إلى MainPage إذا كانت هي الصفحة المطلوبة
      ),
    );
    return Future.value(false);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Map 1",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xfff6ccbe),
          automaticallyImplyLeading: false,
          leading: IconButton(
              onPressed: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(), // تغيير HomePage إلى MainPage إذا كانت هي الصفحة المطلوبة
                  )),
              icon: const Icon(Icons.arrow_back_ios, color: Colors.white)),
          actions: [
            const Icon(Icons.more_vert, color: Colors.white),
          ],
        ),
        backgroundColor: const Color(0xfff6ccbe),
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(height: size.height * 0.15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            L1 = false;
                            L2 = false;
                            L3 = false;
                            L4 = false;
                            L5 = false;
                            L6 = false;
                            L7 = false;
                            L8 = false;
                            L9 = false;
                          });
                          print("level9 $L9");
                          if (widget.level9) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Questions(
                                    Question:
                                        "The dumay data of Level 10 and option 1",
                                    option1: "true",
                                    option2: "false",
                                    option3: "nothong to say",
                                    correctoption: "false",
                                    L2: L2,
                                    L1: L1,
                                    L3: L3,
                                    L4: L4,
                                    L5: L5,
                                    L6: L6,
                                    L7: L7,
                                    L8: L8,
                                    L9: L9,
                                  ),
                                ));
                          } else {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return const AlertDialog(
                                    title: Text('please complete level 9'),
                                  );
                                });
                          }
                        },
                        child: CustomPaint(
                          size: const Size(70, 70), // Adjust size as needed
                          painter: HexagonPainter(
                              borderColor: Colors.white,
                              borderWidth: 2,
                              hexagonColor: widget.level9
                                  ? const Color(0xffb7dbeb)
                                  : const Color(0xfff6ccbe)),
                          child: Padding(
                            padding: const EdgeInsets.all(17.0),
                            child: widget.level9
                                ? const Text(
                                    "10",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.white),
                                  )
                                : const Icon(
                                    Icons.lock,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 80,
                      )
                    ],
                  ),
                  SizedBox(
                    width: widget.level9 ? 10 : 0,
                  ),
                  Column(
                    children: [
                      Container(
                        width: 40,
                        height: 2,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        height: 80,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            L1 = false;
                            L2 = false;
                            L3 = false;
                            L4 = false;
                            L5 = false;
                            L6 = false;
                            L7 = false;
                            L8 = false;
                            L9 = true;
                          });
                          print("level9 $L9");
                          if (widget.level8) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Questions(
                                    Question:
                                        "The dumay data of Level 9 and option 1",
                                    option1: "true",
                                    option2: "false",
                                    option3: "nothong to say",
                                    correctoption: "false",
                                    L2: L2,
                                    L1: L1,
                                    L3: L3,
                                    L4: L4,
                                    L5: L5,
                                    L6: L6,
                                    L7: L7,
                                    L8: L8,
                                    L9: L9,
                                  ),
                                ));
                          } else {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return const AlertDialog(
                                    title: Text('please complete level 8'),
                                  );
                                });
                          }
                        },
                        child: CustomPaint(
                          size: const Size(70, 70), // Adjust size as needed
                          painter: HexagonPainter(
                              borderColor: Colors.white,
                              borderWidth: 2,
                              hexagonColor: widget.level8
                                  ? const Color(0xffb7dbeb)
                                  : const Color(0xfff6ccbe)),
                          child: Padding(
                            padding: const EdgeInsets.all(17.0),
                            child: widget.level8
                                ? const Text(
                                    "9",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.white),
                                  )
                                : const Icon(
                                    Icons.lock,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 80,
                      )
                    ],
                  ),
                  SizedBox(
                    width: widget.level7 ? 10 : 0,
                  ),
                  Column(
                    children: [
                      Container(
                        width: 40,
                        height: 2,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        height: 80,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            L1 = false;
                            L2 = false;
                            L3 = false;
                            L4 = false;
                            L5 = false;
                            L6 = false;
                            L7 = false;
                            L8 = true;
                            L9 = false;
                          });
                          print("level8 $L8");
                          if (widget.level7) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Questions(
                                    Question:
                                        "The dumay data of Level 8 and option 1",
                                    option1: "true",
                                    option2: "false",
                                    option3: "nothong to say",
                                    correctoption: "false",
                                    L2: L2,
                                    L1: L1,
                                    L3: L3,
                                    L4: L4,
                                    L5: L5,
                                    L6: L6,
                                    L7: L7,
                                    L8: L8,
                                    L9: L9,
                                  ),
                                ));
                          } else {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return const AlertDialog(
                                    title: Text('please complete level 7'),
                                  );
                                });
                          }
                        },
                        child: CustomPaint(
                          size: const Size(70, 70), // Adjust size as needed
                          painter: HexagonPainter(
                              borderColor: Colors.white,
                              borderWidth: 2,
                              hexagonColor: widget.level7
                                  ? const Color(0xffb7dbeb)
                                  : const Color(0xfff6ccbe)),
                          child: Padding(
                            padding: const EdgeInsets.all(17.0),
                            child: widget.level7
                                ? const Text(
                                    "8",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.white),
                                  )
                                : const Icon(
                                    Icons.lock,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                          ),
                        ),
                      ),
                      Container(
                        height: 80,
                        width: 2,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  //SizedBox(height: 20),
                ],
              ),

              // SizedBox(height: size.height*0.1),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            L1 = false;
                            L2 = false;
                            L3 = false;
                            L4 = false;
                            L5 = false;
                            L6 = true;
                            L7 = false;
                            L8 = false;
                            L9 = false;
                          });
                          print("level6 $L6");
                          if (widget.level5) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Questions(
                                    Question:
                                        "The dumay data of Level 6 and option 1",
                                    option1: "true",
                                    option2: "false",
                                    option3: "nothong to say",
                                    correctoption: "false",
                                    L2: L2,
                                    L1: L1,
                                    L3: L3,
                                    L4: L4,
                                    L5: L5,
                                    L6: L6,
                                    L7: L7,
                                    L8: L8,
                                    L9: L9,
                                  ),
                                ));
                          } else {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return const AlertDialog(
                                    title: Text('please complete level 5'),
                                  );
                                });
                          }
                        },
                        child: CustomPaint(
                          size: const Size(70, 70), // Adjust size as needed
                          painter: HexagonPainter(
                              borderColor: Colors.white,
                              borderWidth: 2,
                              hexagonColor: widget.level5
                                  ? const Color(0xffb7dbeb)
                                  : const Color(0xfff6ccbe)),
                          child: Padding(
                            padding: const EdgeInsets.all(17.0),
                            child: widget.level5
                                ? const Text(
                                    "6",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.white),
                                  )
                                : const Icon(
                                    Icons.lock,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                          ),
                        ),
                      ),
                      Container(
                        height: 80,
                        width: 2,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: widget.level5 ? 10 : 0,
                  ),
                  Column(
                    children: [
                      Container(
                        width: 40,
                        height: 2,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        height: 80,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Tutorial2(),
                              ));
                        },
                        child: CustomPaint(
                          size: const Size(70, 70), // Adjust size as needed
                          painter: HexagonPainter(
                              borderColor: Colors.white,
                              borderWidth: 2,
                              hexagonColor: const Color(0xff10cccc)),
                          child: const Padding(
                            padding: EdgeInsets.all(17.0),
                            child: Icon(
                              Icons.question_mark,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 80,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: 40,
                        height: 2,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        height: 80,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            L1 = false;
                            L2 = false;
                            L3 = false;
                            L4 = false;
                            L5 = false;
                            L6 = false;
                            L7 = true;
                            L8 = false;
                            L9 = false;
                          });
                          print("level7 $L7");
                          if (widget.level6) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Questions(
                                    Question:
                                        "The dumay data of Level 7 and option 1",
                                    option1: "true",
                                    option2: "false",
                                    option3: "nothong to say",
                                    correctoption: "false",
                                    L2: L2,
                                    L1: L1,
                                    L3: L3,
                                    L4: L4,
                                    L5: L5,
                                    L6: L6,
                                    L7: L7,
                                    L8: L8,
                                    L9: L9,
                                  ),
                                ));
                          } else {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return const AlertDialog(
                                    title: Text('please complete level 6'),
                                  );
                                });
                          }
                        },
                        child: CustomPaint(
                          size: const Size(70, 70), // Adjust size as needed
                          painter: HexagonPainter(
                              borderColor: Colors.white,
                              borderWidth: 2,
                              hexagonColor: widget.level6
                                  ? const Color(0xffb7dbeb)
                                  : const Color(0xfff6ccbe)),
                          child: Padding(
                            padding: const EdgeInsets.all(17.0),
                            child: widget.level6
                                ? const Text(
                                    "7",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.white),
                                  )
                                : const Icon(
                                    Icons.lock,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 80,
                      )
                    ],
                  ),
                  //SizedBox(height: 20),
                ],
              ),
              //SizedBox(height: size.height*0.1),
              //.............................................Row2.....................................................

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            L1 = false;
                            L2 = false;
                            L3 = false;
                            L4 = false;
                            L5 = true;
                            L6 = false;
                            L7 = false;
                            L8 = false;
                            L9 = false;
                          });
                          print("level5 $L5");
                          if (widget.level4) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Questions(
                                    Question:
                                        "The dumay data of Level 5 and option 1",
                                    option1: "true",
                                    option2: "false",
                                    option3: "nothong to say",
                                    correctoption: "false",
                                    L2: L2,
                                    L1: L1,
                                    L3: L3,
                                    L4: L4,
                                    L5: L5,
                                    L6: L6,
                                    L7: L7,
                                    L8: L8,
                                    L9: L9,
                                  ),
                                ));
                          } else {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return const AlertDialog(
                                    title: Text('please complete level 4'),
                                  );
                                });
                          }
                        },
                        child: CustomPaint(
                          size: const Size(70, 70), // Adjust size as needed
                          painter: HexagonPainter(
                              borderColor: Colors.white,
                              borderWidth: 2,
                              hexagonColor: widget.level4
                                  ? const Color(0xffb7dbeb)
                                  : const Color(0xfff6ccbe)),
                          child: Padding(
                            padding: const EdgeInsets.all(17.0),
                            child: widget.level4
                                ? const Text(
                                    "5",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.white),
                                  )
                                : const Icon(
                                    Icons.lock,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 80,
                      )
                    ],
                  ),
                  SizedBox(
                    width: widget.level4 ? 10 : 0,
                  ),
                  Column(
                    children: [
                      Container(
                        width: widget.level2 ? 38 : 40,
                        height: 2,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        height: 80,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            L1 = false;
                            L2 = false;
                            L3 = false;
                            L4 = true;
                            L5 = false;
                            L6 = false;
                            L7 = false;
                            L8 = false;
                            L9 = false;
                          });
                          print("level4 $L4");
                          if (widget.level3) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Questions(
                                    Question:
                                        "The dumay data of Level 4 and option 1",
                                    option1: "true",
                                    option2: "false",
                                    option3: "nothong to say",
                                    correctoption: "false",
                                    L2: L2,
                                    L1: L1,
                                    L3: L3,
                                    L4: L4,
                                    L5: L5,
                                    L6: L6,
                                    L7: L7,
                                    L8: L8,
                                    L9: L9,
                                  ),
                                ));
                          } else {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return const AlertDialog(
                                    title: Text('please complete level 3'),
                                  );
                                });
                          }
                        },
                        child: CustomPaint(
                          size: const Size(70, 70), // Adjust size as needed
                          painter: HexagonPainter(
                              borderColor: Colors.white,
                              borderWidth: 2,
                              hexagonColor: widget.level3
                                  ? const Color(0xffb7dbeb)
                                  : const Color(0xfff6ccbe)),
                          child: Padding(
                            padding: const EdgeInsets.all(17.0),
                            child: widget.level3
                                ? const Text(
                                    "4",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.white),
                                  )
                                : const Icon(
                                    Icons.lock,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 80,
                      )
                    ],
                  ),
                  SizedBox(
                    width: widget.level3 ? 10 : 0,
                  ),
                  Column(
                    children: [
                      Container(
                        width: widget.level3 ? 48 : 42,
                        height: 2,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        height: 80,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            L1 = false;
                            L2 = false;
                            L3 = true;
                            L4 = false;
                            L5 = false;
                            L6 = false;
                            L7 = false;
                            L8 = false;
                            L9 = false;
                          });
                          print("level3 $L3");
                          if (widget.level2) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Questions(
                                    Question:
                                        "The dumay data of Level 3 and option 1",
                                    option1: "true",
                                    option2: "false",
                                    option3: "nothong to say",
                                    correctoption: "false",
                                    L2: L2,
                                    L1: L1,
                                    L3: L3,
                                    L4: L4,
                                    L5: L5,
                                    L6: L6,
                                    L7: L7,
                                    L8: L8,
                                    L9: L9,
                                  ),
                                ));
                          } else {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return const AlertDialog(
                                    title: Text('please complete level 2'),
                                  );
                                });
                          }
                        },
                        child: CustomPaint(
                          size: const Size(70, 70), // Adjust size as needed
                          painter: HexagonPainter(
                              borderColor: Colors.white,
                              borderWidth: 2,
                              hexagonColor: widget.level2
                                  ? const Color(0xffb7dbeb)
                                  : const Color(0xfff6ccbe)),
                          child: Padding(
                            padding: const EdgeInsets.all(17.0),
                            child: widget.level2
                                ? const Text(
                                    "3",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.white),
                                  )
                                : const Icon(
                                    Icons.lock,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                          ),
                        ),
                      ),
                      Container(
                        height: 80,
                        width: 2,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  //SizedBox(height: 20),
                ],
              ),

              //.................................................Row1 .......................
              // SizedBox(height: size.height*0.1),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 5,
                  ),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            L1 = true;
                            L2 = false;
                            L3 = false;
                            L4 = false;
                            L5 = false;
                            L6 = false;
                            L7 = false;
                            L8 = false;
                            L9 = false;
                          });
                          print("level1 $L1");
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Questions(
                                  Question:
                                      "The dumay data of Level 1 and option 1",
                                  option1: "true",
                                  option2: "false",
                                  option3: "nothong to say",
                                  correctoption: "false",
                                  L2: L2,
                                  L1: L1,
                                  L3: L3,
                                  L4: L4,
                                  L5: L5,
                                  L6: L6,
                                  L7: L7,
                                  L8: L8,
                                  L9: L9,
                                ),
                              ));
                        },
                        child: CustomPaint(
                          size: const Size(70, 70), // Adjust size as needed
                          painter: HexagonPainter(
                              borderColor: Colors.white,
                              borderWidth: 2,
                              hexagonColor: const Color(0xffb7dbeb)),
                          child: const Padding(
                            padding: EdgeInsets.all(17.0),
                            child: Text(
                              "1",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 80,
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Column(
                    children: [
                      Container(
                        width: 39,
                        height: 2,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        height: 80,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            L1 = false;
                            L2 = true;
                            L3 = false;
                            L4 = false;
                            L5 = false;
                            L6 = false;
                            L7 = false;
                            L8 = false;
                            L9 = false;
                          });
                          print("level2 $L2");
                          if (widget.level1) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Questions(
                                    Question:
                                        "The dumay data of Level 2 and option 1",
                                    option1: "true",
                                    option2: "false",
                                    option3: "nothong to say",
                                    correctoption: "false",
                                    L2: L2,
                                    L1: L1,
                                    L3: L3,
                                    L4: L4,
                                    L5: L5,
                                    L6: L6,
                                    L7: L7,
                                    L8: L8,
                                    L9: L9,
                                  ),
                                ));
                          } else {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return const AlertDialog(
                                    title: Text('please complete level 1'),
                                  );
                                });
                          }
                        },
                        child: CustomPaint(
                          size: const Size(70, 70), // Adjust size as needed
                          painter: HexagonPainter(
                              borderColor: Colors.white,
                              borderWidth: 2,
                              hexagonColor: widget.level1
                                  ? const Color(0xffb7dbeb)
                                  : const Color(0xfff6ccbe)),
                          child: Padding(
                            padding: const EdgeInsets.all(17.0),
                            child: widget.level1
                                ? const Text(
                                    "2",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.white),
                                  )
                                : const Icon(
                                    Icons.lock,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 80,
                      )
                    ],
                  ),
                  SizedBox(
                    width: widget.level1 ? 10 : 0,
                  ),
                  Column(
                    children: [
                      Container(
                        width: 42,
                        height: 2,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        height: 80,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Tutorial1(),
                              ));
                        },
                        child: CustomPaint(
                          size: const Size(70, 70), // Adjust size as needed
                          painter: HexagonPainter(
                              borderColor: Colors.white,
                              borderWidth: 2,
                              hexagonColor: const Color(0xff10cccc)),
                          child: const Padding(
                            padding: EdgeInsets.all(17.0),
                            child: Icon(
                              Icons.question_mark,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 80,
                      )
                    ],
                  ),
                  //SizedBox(height: 20),
                ],
              ),

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     CustomPaint(
              //       size: Size(70, 70), // Adjust size as needed
              //       painter:HexagonPainter(borderColor: Colors.white,borderWidth: 2,hexagonColor: Color(0xffb7dbeb)),
              //       child:Padding(
              //         padding: const EdgeInsets.all(17.0),
              //         child: Text("1",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w900,color: Colors.white),),
              //       ),
              //     ),
              //     SizedBox(width: 10,),
              //     Container(width: 40,height: 2,color: Colors.white,),
              //     CustomPaint(
              //       size: Size(70, 70), // Adjust size as needed
              //       painter:HexagonPainter(borderColor: Colors.white,borderWidth: 2,hexagonColor: Color(0xfff6ccbe) ),
              //       child:Padding(
              //         padding: const EdgeInsets.all(17.0),
              //         child: Icon(Icons.lock,size: 30,color: Colors.white,),
              //       ),
              //     ),
              //     Container(width: 40,height: 2,color: Colors.white,),
              //     CustomPaint(
              //
              //       size: Size(70, 70), // Adjust size as needed
              //       painter: HexagonPainter(borderColor: Colors.white,borderWidth: 2, hexagonColor: Color(0xff10cccc)),
              //       child:Padding(
              //         padding: const EdgeInsets.all(17.0),
              //         child: Icon(Icons.lock,size: 30,color: Colors.white,),
              //       ),
              //     ),
              //     //SizedBox(height: 20),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

//.......................................... for the shape ........................................................................

class HexagonPainter extends CustomPainter {
  final Color borderColor;
  final Color hexagonColor; // New parameter for fill color
  final double borderWidth;
  final double shadowBlurRadius;
  final Color shadowColor;

  HexagonPainter({
    required this.borderColor,
    required this.hexagonColor, // Required fill color
    required this.borderWidth,
    this.shadowBlurRadius = 12.0, // Default value for shadow blur radius
    this.shadowColor = Colors.grey, // Default value for shadow color
  });

  @override
  void paint(Canvas canvas, Size size) {
    final List<Offset> points = List.generate(
      6,
      (i) {
        final double x = size.width / 2 + 35 * math.cos(math.pi / 3 * i);
        final double y = size.height / 2 + 35 * math.sin(math.pi / 3 * i);
        return Offset(x, y);
      },
    );
    final path = Path()..moveTo(points[5].dx, points[5].dy);
    for (int i = 0; i < 6; i++) {
      path.lineTo(points[i].dx, points[i].dy);
    }
    path.close();

    final Paint paint = Paint()
      ..color = hexagonColor // Set the fill color
      ..strokeWidth = borderWidth
      ..style = PaintingStyle.fill;

    final Paint borderPaint = Paint()
      ..color = borderColor
      ..strokeWidth = borderWidth
      ..style = PaintingStyle.stroke;

    final shadowPaint = Paint()
      ..color = shadowColor
      ..maskFilter = MaskFilter.blur(
        BlurStyle.normal,
        shadowBlurRadius,
      );

    canvas.drawPath(path, shadowPaint); // Draw shadow
    canvas.drawPath(path, paint);
    canvas.drawPath(path, borderPaint); // Draw the border
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
