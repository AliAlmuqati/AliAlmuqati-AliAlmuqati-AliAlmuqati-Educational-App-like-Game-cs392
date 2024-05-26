import 'package:flutter/material.dart';
import 'package:cs290_app/Pages/Question2.dart';
import 'package:cs290_app/Pages/Tutorial1.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'dart:math' as math;

class Questions extends StatefulWidget {
  final String Question;
  final String option1;
  final String option2;
  final String option3;
  final String correctoption;
  final bool L1;
  final bool L2;
  final bool L3;
  final bool L4;
  final bool L5;
  final bool L6;
  final bool L7;
  final bool L8;
  final bool L9;

  const Questions(
      {super.key,
      required this.Question,
      required this.option1,
      required this.option2,
      required this.option3,
      required this.correctoption,
      required this.L1,
      required this.L2,
      required this.L3,
      required this.L4,
      required this.L5,
      required this.L6,
      required this.L7,
      required this.L8,
      required this.L9});

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  bool isselected = false;
  bool isselected2 = false;
  bool isselected3 = false;

  int currentPoints = 0;

  @override
  Widget build(BuildContext context) {
    print("L1 ${widget.L1}");
    print("L2 ${widget.L2}");
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tutorial 1",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Color(0xfff6ccbe),
        automaticallyImplyLeading: false,
        leading: Icon(Icons.arrow_back_ios, color: Colors.white),
        actions: [
          Icon(Icons.more_vert, color: Colors.white),
        ],
      ),
      backgroundColor: Color(0xfff6ccbe),
      body: SafeArea(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LinearPercentIndicator(
              width: size.width * 0.94,
              animation: true,
              animationDuration: 60,
              lineHeight: 20.0,
              addAutomaticKeepAlive: true,
              percent: 0.6,
              backgroundColor: Color(0xff10CCCC),
              progressColor: Color(0xffB7DBEB),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              margin: EdgeInsets.symmetric(horizontal: 30),
              height: size.height * 0.35,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(40)),
              child: Center(
                  child: Text(
                widget.Question,
                style: TextStyle(color: Colors.black, fontSize: 35),
              )),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  isselected = true;
                  if (isselected) {
                    if (checkAnswer("${widget.option1}")) {
                      currentPoints++; // Increment points if the answer is correct
                    }
                  }
                });
                navigateToNextQuestion();
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                height: size.height * 0.06,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: isselected ? Color(0xff10cccc) : Color(0xfff6ccbe),
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                    child: Text(
                  widget.option1,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                )),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  isselected2 = true;
                  if (isselected2) {
                    if (checkAnswer("${widget.option2}")) {
                      currentPoints++; // Increment points if the answer is correct
                    }
                  }
                });
                navigateToNextQuestion();
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                height: size.height * 0.06,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: isselected2 ? Color(0xff10cccc) : Color(0xfff6ccbe),
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                    child: Text(
                  widget.option2,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                )),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  isselected3 = true;
                  if (isselected3) {
                    if (checkAnswer("${widget.option3}")) {
                      currentPoints++; // Increment points if the answer is correct
                    }
                  }
                });
                navigateToNextQuestion();
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                height: size.height * 0.06,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: isselected3 ? Color(0xff10cccc) : Color(0xfff6ccbe),
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                    child: Text(
                  widget.option3,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                )),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Tutorial1(),
                    ));
              },
              child: CustomPaint(
                size: Size(70, 70),
                painter: HexagonPainter(
                    borderColor: Colors.white,
                    borderWidth: 2,
                    hexagonColor: Color(0xff10cccc)),
                child: Padding(
                  padding: const EdgeInsets.all(17.0),
                  child: Icon(
                    Icons.question_mark,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool checkAnswer(String selectedAnswer) {
    return selectedAnswer == "${widget.correctoption}";
  }

  void navigateToNextQuestion() {
    if (widget.L1) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Questions2(
              previousPoints: currentPoints,
              Question: "What is the output of print(2 + 3)?",
              option1: "5",
              option2: "23",
              option3: "Error",
              correctAns: "5",
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
    } else if (widget.L2) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Questions2(
              previousPoints: currentPoints,
              Question: "What is the result of 4 * 5?",
              option1: "20",
              option2: "45",
              option3: "Error",
              correctAns: "20",
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
    } else if (widget.L3) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Questions2(
              previousPoints: currentPoints,
              Question: "Which keyword is used to define a function?",
              option1: "fun",
              option2: "define",
              option3: "def",
              correctAns: "def",
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
    } else if (widget.L4) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Questions2(
              previousPoints: currentPoints,
              Question: "What is the output of print('Hello' + 'World')?",
              option1: "HelloWorld",
              option2: "Hello World",
              option3: "Hello+World",
              correctAns: "HelloWorld",
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
    } else if (widget.L5) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Questions2(
              previousPoints: currentPoints,
              Question: "What does 'str' stand for?",
              option1: "String",
              option2: "Structure",
              option3: "Stream",
              correctAns: "String",
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
    } else if (widget.L6) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Questions2(
              previousPoints: currentPoints,
              Question: "Which of these is a Python list?",
              option1: "{1, 2, 3}",
              option2: "[1, 2, 3]",
              option3: "(1, 2, 3)",
              correctAns: "[1, 2, 3]",
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
    } else if (widget.L7) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Questions2(
              previousPoints: currentPoints,
              Question: "What is the output of 2 ** 3?",
              option1: "6",
              option2: "8",
              option3: "9",
              correctAns: "8",
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
    } else if (widget.L8) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Questions2(
              previousPoints: currentPoints,
              Question: "What is the correct way to declare a variable?",
              option1: "let x = 5",
              option2: "x = 5",
              option3: "int x = 5",
              correctAns: "x = 5",
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
    } else if (widget.L9) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Questions2(
              previousPoints: currentPoints,
              Question: "Which of these is a Python dictionary?",
              option1: "{'a': 1, 'b': 2}",
              option2: "[a: 1, b: 2]",
              option3: "(a: 1, b: 2)",
              correctAns: "{'a': 1, 'b': 2}",
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
    } else {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Questions2(
              previousPoints: currentPoints,
              Question: "What is the output of 10 // 3?",
              option1: "3.33",
              option2: "3",
              option3: "4",
              correctAns: "3",
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
    }
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
