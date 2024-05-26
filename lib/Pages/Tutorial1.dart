import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class Tutorial1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Tutorial 1",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xfff6ccbe),
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white)),
        actions: [
          const Icon(Icons.more_vert, color: Colors.white),
        ],
      ),
      backgroundColor: const Color(0xfff6ccbe),
      body: SafeArea(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //............................. addject your progress according to your requirement
            LinearPercentIndicator(
              width: size.width * 0.94,
              lineHeight: 20.0,
              addAutomaticKeepAlive: true,
              percent: 0.5,
              backgroundColor: const Color(0xff10CCCC),
              progressColor: const Color(0xffB7DBEB),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              margin: const EdgeInsets.symmetric(horizontal: 30),
              height: size.height * 0.5,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: const Color(0xff10CCCC),
                  borderRadius: BorderRadius.circular(20)),
              child: const Center(
                  child: Text(
                
  "Java is a programming language used to create applications and software.\n"
  "A class is a blueprint or model for creating objects.\n"
  "An object is an instance of a class that contains specific properties and behaviors.\n"
  "A method is a function defined inside a class that performs certain operations.\n"
  "Inheritance is a process where one class inherits properties and behaviors from another class.\n"
  ,
                style: TextStyle(color: Colors.white, fontSize: 22),
              )),
            ),
            SizedBox(
              height: size.height * 0.1,
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context); // العودة إلى الشاشة السابقة
              },
              child: Container(
                height: size.height * 0.1,
                width: size.width * 0.45,
                decoration: BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.circular(50)),
                child: const Center(
                    child: Text(
                  "That’s Clear! Next",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
