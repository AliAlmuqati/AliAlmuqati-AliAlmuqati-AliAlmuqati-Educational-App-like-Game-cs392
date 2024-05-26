import 'package:cs290_app/Pages/Levelend.dart';
import 'package:cs290_app/Pages/Tutorial1.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'dart:math' as math;

class Questions3 extends StatefulWidget {
  final int previousPoints;
  final String Question;
  final String option1;
  final String option2;
  final String option3;
  final String correctAns;
  final bool L1;
  final bool L2;
  final bool L3;
  final bool L4;
  final bool L5;
  final bool L6;
  final bool L7;
  final bool L8;
  final bool L9; // Points from previous screen

  const Questions3(
      {Key? key,
      required this.previousPoints,
      required this.Question,
      required this.option1,
      required this.option2,
      required this.option3,
      required this.correctAns,
      required this.L1,
      required this.L2,
      required this.L3,
      required this.L4,
      required this.L5,
      required this.L6,
      required this.L7,
      required this.L8,
      required this.L9})
      : super(key: key);

  @override
  State<Questions3> createState() => _Questions3State();
}

class _Questions3State extends State<Questions3> {
  bool isselected = false;
  bool isselected2 = false;
  bool isselected3 = false;
  int currentPoints = 0; // Current points earned in this screen

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int totalPoints =
        currentPoints + widget.previousPoints; // Total points earned

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Tutorial 3",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xfff6ccbe),
        automaticallyImplyLeading: false,
        leading: const Icon(Icons.arrow_back_ios, color: Colors.white),
        actions: [
          const Icon(Icons.more_vert, color: Colors.white),
        ],
      ),
      backgroundColor: const Color(0xfff6ccbe),
      body: SafeArea(
        child: Column(
          children: [
            LinearPercentIndicator(
              width: size.width * 0.94,
              animation: true,
              animationDuration: 60,
              lineHeight: 20.0,
              addAutomaticKeepAlive: true,
              percent: 0.6,
              backgroundColor: const Color(0xff10CCCC),
              progressColor: const Color(0xffB7DBEB),
            ),
            SizedBox(height: size.height * 0.05),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              margin: const EdgeInsets.symmetric(horizontal: 30),
              height: size.height * 0.35,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(40)),
              child: Center(
                  child: Text(widget.Question,
                      style:
                          const TextStyle(color: Colors.black, fontSize: 35))),
            ),
            SizedBox(height: size.height * 0.05),
            InkWell(
              onTap: () {
                setState(() {
                  isselected = true;
                  if (isselected) {
                    if (checkAnswer(widget.option1)) {
                      currentPoints++;
                      totalPoints = currentPoints +
                          widget
                              .previousPoints; // Increment points if the answer is correct
                    }
                  }
                });
                print("total points $currentPoints");
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Levelend(
                        point: totalPoints,
                        L1: widget.L1,
                        L2: widget.L2,
                        L3: widget.L3,
                        L4: widget.L4,
                        L5: widget.L5,
                        L6: widget.L6,
                        L7: widget.L7,
                        L8: widget.L8,
                        L9: widget.L9,
                      ),
                    ));
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                margin:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                height: size.height * 0.06,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: isselected
                        ? const Color(0xff10cccc)
                        : const Color(0xfff6ccbe),
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                    child: Text(widget.option1,
                        style: const TextStyle(
                            color: Colors.white, fontSize: 18))),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  isselected2 = true;
                  if (isselected2) {
                    if (checkAnswer(widget.option2)) {
                      currentPoints++;
                      totalPoints = currentPoints +
                          widget
                              .previousPoints; // Increment points if the answer is correct
                    }
                  }
                });
                print("total points $totalPoints");
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Levelend(
                        point: totalPoints,
                        L1: widget.L1,
                        L2: widget.L2,
                        L3: widget.L3,
                        L4: widget.L4,
                        L5: widget.L5,
                        L6: widget.L6,
                        L7: widget.L7,
                        L8: widget.L8,
                        L9: widget.L9,
                      ),
                    ));
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                margin:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                height: size.height * 0.06,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: isselected2
                        ? const Color(0xff10cccc)
                        : const Color(0xfff6ccbe),
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                    child: Text(widget.option2,
                        style: const TextStyle(
                            color: Colors.white, fontSize: 18))),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  isselected3 = true;
                  if (isselected3) {
                    if (checkAnswer(widget.option3)) {
                      currentPoints++;
                      totalPoints = currentPoints +
                          widget
                              .previousPoints; // Increment points if the answer is correct
                    }
                  }
                });
                print("total points $currentPoints");
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Levelend(
                        point: totalPoints,
                        L1: widget.L1,
                        L2: widget.L2,
                        L3: widget.L3,
                        L4: widget.L4,
                        L5: widget.L5,
                        L6: widget.L6,
                        L7: widget.L7,
                        L8: widget.L8,
                        L9: widget.L9,
                      ),
                    ));
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                margin:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                height: size.height * 0.06,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: isselected3
                        ? const Color(0xff10cccc)
                        : const Color(0xfff6ccbe),
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                    child: Text(widget.option3,
                        style: const TextStyle(
                            color: Colors.white, fontSize: 18))),
              ),
            ),
            SizedBox(height: size.height * 0.02),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Tutorial1()));
              },
              child: CustomPaint(
                size: const Size(70, 70),
                painter: HexagonPainter(
                    borderColor: Colors.white,
                    borderWidth: 2,
                    hexagonColor: const Color(0xff10cccc)),
                child: const Padding(
                  padding: EdgeInsets.all(17.0),
                  child:
                      Icon(Icons.question_mark, size: 30, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  bool checkAnswer(String selectedAnswer) {
    // Function to check if the answer is correct
    return selectedAnswer == "${widget.correctAns}"; // Change to your correct answer logic
  }
}

class HexagonPainter extends CustomPainter {
  final Color borderColor;
  final Color hexagonColor;
  final double borderWidth;
  final double shadowBlurRadius;
  final Color shadowColor;

  HexagonPainter({
    required this.borderColor,
    required this.hexagonColor,
    required this.borderWidth,
    this.shadowBlurRadius = 12.0,
    this.shadowColor = Colors.grey,
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
      ..color = hexagonColor
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

    canvas.drawPath(path, shadowPaint);
    canvas.drawPath(path, paint);
    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
