import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cs290_app/Pages/Mapgame.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


// import 'package:percent_indicator/linear_percent_indicator.dart';

// class Levelend extends StatelessWidget {
//   //late final int points;
//   final int point;
  

//   Levelend({required this.point});
//   @override
//   Widget build(BuildContext context) {
//     bool level1=false;
//     Size size =MediaQuery.of(context).size;
//     return 
//   }
// }
class Levelend extends StatefulWidget {
  final int point;
  final bool L1;
  final bool L2;
  final bool L3;
  final bool L4;
  final bool L5;
  final bool L6;
  final bool L7;
  final bool L8;
  final bool L9;
  const Levelend({super.key, required this.point, required this.L1, required this.L2, required this.L3, required this.L4, required this.L5, required this.L6, required this.L7, required this.L8, required this.L9});

  @override
  State<Levelend> createState() => _LevelendState();
}

class _LevelendState extends State<Levelend> {
  bool level1=false;
  bool level2=false;
  bool level3=false;
  bool level4=false;
  bool level5=false;
  bool level6=false;
  bool level7=false;
  bool level8=false;
  bool level9=false;
  
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Level is end",
          style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Color(0xfff6ccbe),
        automaticallyImplyLeading: false,
        //leading: Icon(Icons.arrow_back_ios, color: Colors.white),
        actions: [
          IconButton(onPressed: () {
            setState(() {
              if(widget.L1){
                level1=true;
              }else if(widget.L2){
                 level1=true;
                level2=true;
               
              }else if(widget.L3){
                level1=true;
                level2=true;
                level3=true;
              }else if(widget.L4){
                level1=true;
                level2=true;
                level3=true;
                level4=true;
              }else if(widget.L5){
                level1=true;
                level2=true;
                level3=true;
                level4=true;
                level5=true;
              }else if(widget.L6){
                level1=true;
                level2=true;
                level3=true;
                level4=true;
                level5=true;
                level6=true;
              }else if(widget.L7){
                level1=true;
                level2=true;
                level3=true;
                level4=true;
                level5=true;
                level6=true;
                level7=true;
              }else if(widget.L8){
                level1=true;
                level2=true;
                level3=true;
                level4=true;
                level5=true;
                level6=true;
                level7=true;
                level8=true;
              }else if(widget.L9){
                 level1=true;
                level2=true;
                level3=true;
                level4=true;
                level5=true;
                level6=true;
                level7=true;
                level8=true;
                level9=true;
              }else{
                level1=true;
                level2=true;
                level3=true;
                level4=true;
                level5=true;
                level6=true;
                level7=true;
                level8=true;
                level9=true;

              }
            });
            

            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Mapgame(
              level1:level1 ,
              level2: level2,
              level3: level3,
              level4: level4,
              level5: level5,
              level6: level6,
              level7: level7,
              level8: level8,
              level9: level9,
              
              ),));
          },    
           icon: Icon(Icons.close, color: Colors.white,size: 40,)),
        ],
      ),
      backgroundColor: Color(0xfff6ccbe),
      body: SafeArea(
        child: Column( mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //............................. addject your progress according to your requirement
            StreamBuilder(
              stream: FirebaseFirestore.instance.collection("Leaderscore").doc(FirebaseAuth.instance.currentUser!.email).snapshots(), 
              builder: (context, snapshot) {
                if(snapshot.hasData){
                  final userpoints = snapshot.data?.data() as Map<String, dynamic>?;
                int totalpoints = userpoints != null && userpoints["points"] != ""
               ? userpoints["points"] + widget.point
                      : 0 + widget.point;


                  return Column(children: [
                    widget.point!=0?  Text("Nice Work",style: TextStyle(color: Colors.white,fontSize: 35,fontWeight: FontWeight.bold),):Text("Very bad Work",style: TextStyle(color: Colors.white,fontSize: 35,fontWeight: FontWeight.bold),),
                
                  Center(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      height: 150,
                      width:150,
                      decoration: BoxDecoration(
                        color: Color(0xff10CCCC),
                        borderRadius: BorderRadius.circular(100)
                    
                      ),
                      
                      child: Center(
                        child: Container(
                          height: 100,
                        width:100,
                         decoration: BoxDecoration(
                          color: Color(0xffB7DBEB),
                          borderRadius: BorderRadius.circular(100)
                        
                        ),
                        child: Icon(Icons.check_sharp,color: Colors.white,size: 50,),
                        
                        ),
                      ) 
                    ),
                  ),
                  SizedBox(height: 10,),
                  RatingBar.builder(
                        initialRating: double.parse(widget.point.toString()),
                                 minRating: 1,
                          direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemSize: 50,
                             itemCount: 3,
                             itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                             itemBuilder: (context, _) => Icon(
                              Icons.star,
                                    color: Colors.amber,
                                                 ),
                           onRatingUpdate: (rating) {
                              print(rating);
                                                     },
  
                                                  ),
SizedBox(height: 40,),
Row( mainAxisAlignment: MainAxisAlignment.center,
  children: [
  Text("You Earned ",style: TextStyle(color: Colors.white,fontSize: 20),),
  Text("${widget.point}",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),)
],),
SizedBox(height: 20,),
StreamBuilder(
  stream: FirebaseFirestore.instance.collection("Users").doc(FirebaseAuth.instance.currentUser!.email).snapshots(),
   builder: (context, snapshot) {
     if(snapshot.hasData){
      final userleaders = snapshot.data?.data() as Map<String, dynamic>?;
      return InkWell(
  onTap: ()async {
    setState(() {
              if(widget.L1){
                level1=true;
              }else if(widget.L2){
                 level1=true;
                level2=true;
               
              }else if(widget.L3){
                level1=true;
                level2=true;
                level3=true;
              }else if(widget.L4){
                level1=true;
                level2=true;
                level3=true;
                level4=true;
              }else if(widget.L5){
                level1=true;
                level2=true;
                level3=true;
                level4=true;
                level5=true;
              }else if(widget.L6){
                level1=true;
                level2=true;
                level3=true;
                level4=true;
                level5=true;
                level6=true;
              }else if(widget.L7){
                level1=true;
                level2=true;
                level3=true;
                level4=true;
                level5=true;
                level6=true;
                level7=true;
              }else if(widget.L8){
                level1=true;
                level2=true;
                level3=true;
                level4=true;
                level5=true;
                level6=true;
                level7=true;
                level8=true;
              }else if(widget.L9){
                 level1=true;
                level2=true;
                level3=true;
                level4=true;
                level5=true;
                level6=true;
                level7=true;
                level8=true;
                level9=true;
              }else{
                level1=true;
                level2=true;
                level3=true;
                level4=true;
                level5=true;
                level6=true;
                level7=true;
                level8=true;
                level9=true;

              }
            });
             await FirebaseFirestore.instance
                          .collection("Leaderscore")
                          .doc(FirebaseAuth.instance.currentUser!.email) 
                          .set({
                        "points": totalpoints,
                        "name":"${userleaders?["firstname"]} ${userleaders?["lastname"]}",
                        "img":userleaders?["img"]??"",
                        
                      });
                      await FirebaseFirestore.instance
                          .collection("Levels")
                          .doc(FirebaseAuth.instance.currentUser!.email) 
                          .set({
                        "Level1":level1 ,
                        "Level2":level2,
                        "level3":level3,
                        "level4":level4,
                        "level5":level5,
                        "level6":level6,
                        "level7":level7,
                        "level8":level8,
                        "level9":level9
                        
                      });
            

            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Mapgame(
              level1:level1 ,
              level2: level2,
              level3: level3,
              level4: level4,
              level5: level5,
              level6: level6,
              level7: level7,
              level8: level8,
              level9: level9,
              
              ),));
  },
  child: Container(
    margin: EdgeInsets.symmetric(horizontal: 30),
    height: 80,
    width: double.infinity,
    decoration: BoxDecoration(
      color: Color(0xff10CCCC),
      borderRadius: BorderRadius.circular(20)
    ),
    child: Center(child: Text("Next Stage",style: TextStyle(color: Colors.white,fontSize: 30),)),
  ),
);
     }else{
     return InkWell(
  onTap: ()async {
    setState(() {
              if(widget.L1){
                level1=true;
              }else if(widget.L2){
                 level1=true;
                level2=true;
               
              }else if(widget.L3){
                level1=true;
                level2=true;
                level3=true;
              }else if(widget.L4){
                level1=true;
                level2=true;
                level3=true;
                level4=true;
              }else if(widget.L5){
                level1=true;
                level2=true;
                level3=true;
                level4=true;
                level5=true;
              }else if(widget.L6){
                level1=true;
                level2=true;
                level3=true;
                level4=true;
                level5=true;
                level6=true;
              }else if(widget.L7){
                level1=true;
                level2=true;
                level3=true;
                level4=true;
                level5=true;
                level6=true;
                level7=true;
              }else if(widget.L8){
                level1=true;
                level2=true;
                level3=true;
                level4=true;
                level5=true;
                level6=true;
                level7=true;
                level8=true;
              }else if(widget.L9){
                 level1=true;
                level2=true;
                level3=true;
                level4=true;
                level5=true;
                level6=true;
                level7=true;
                level8=true;
                level9=true;
              }else{
                level1=true;
                level2=true;
                level3=true;
                level4=true;
                level5=true;
                level6=true;
                level7=true;
                level8=true;
                level9=true;

              }
            });
             await FirebaseFirestore.instance
                          .collection("Leaderscore")
                          .doc(FirebaseAuth.instance.currentUser!.email) 
                          .set({
                        "points": widget.point,
                        "email":"NewUser",
                        "img":"",
                        
                      });
                      await FirebaseFirestore.instance
                          .collection("Levels")
                          .doc(FirebaseAuth.instance.currentUser!.email) 
                          .set({
                        "Level1":level1 ,
                        "Level2":level2,
                        "level3":level3,
                        "level4":level4,
                        "level5":level5,
                        "level6":level6,
                        "level7":level7,
                        "level8":level8,
                        "level9":level9
                        
                      });
            

            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Mapgame(
              level1:level1 ,
              level2: level2,
              level3: level3,
              level4: level4,
              level5: level5,
              level6: level6,
              level7: level7,
              level8: level8,
              level9: level9,
              
              ),));
  },
  child: Container(
    margin: EdgeInsets.symmetric(horizontal: 30),
    height: 80,
    width: double.infinity,
    decoration: BoxDecoration(
      color: Color(0xff10CCCC),
      borderRadius: BorderRadius.circular(20)
    ),
    child: Center(child: Text("Next Stage",style: TextStyle(color: Colors.white,fontSize: 30),)),
  ),
);
     }
   },
   ),
InkWell(
  onTap: () {
    setState(() {
              if(widget.L1){
                level1=true;
              }else if(widget.L2){
                 level1=true;
                level2=true;
               
              }else if(widget.L3){
                level1=true;
                level2=true;
                level3=true;
              }else if(widget.L4){
                level1=true;
                level2=true;
                level3=true;
                level4=true;
              }else if(widget.L5){
                level1=true;
                level2=true;
                level3=true;
                level4=true;
                level5=true;
              }else if(widget.L6){
                level1=true;
                level2=true;
                level3=true;
                level4=true;
                level5=true;
                level6=true;
              }else if(widget.L7){
                level1=true;
                level2=true;
                level3=true;
                level4=true;
                level5=true;
                level6=true;
                level7=true;
              }else if(widget.L8){
                level1=true;
                level2=true;
                level3=true;
                level4=true;
                level5=true;
                level6=true;
                level7=true;
                level8=true;
              }else if(widget.L9){
                 level1=true;
                level2=true;
                level3=true;
                level4=true;
                level5=true;
                level6=true;
                level7=true;
                level8=true;
                level9=true;
              }else{
                level1=true;
                level2=true;
                level3=true;
                level4=true;
                level5=true;
                level6=true;
                level7=true;
                level8=true;
                level9=true;

              }
            });
            

            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Mapgame(
              level1:level1 ,
              level2: level2,
              level3: level3,
              level4: level4,
              level5: level5,
              level6: level6,
              level7: level7,
              level8: level8,
              level9: level9,
              
              ),));
  },
  child: Container(
    margin: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
    height: 80,
    width: double.infinity,
    decoration: BoxDecoration(
      color: Color(0xffB7DBEB),
      borderRadius: BorderRadius.circular(20)
    ),
    child: Center(child: Text("Play Again",style: TextStyle(color: Colors.white,fontSize: 30),)),
  ),
)

                  ],);
                }else{
                  return Column(children: [
                    widget.point!=0?  Text("Nice Work",style: TextStyle(color: Colors.white,fontSize: 35,fontWeight: FontWeight.bold),):Text("Very bad Work",style: TextStyle(color: Colors.white,fontSize: 35,fontWeight: FontWeight.bold),),
                
                  Center(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      height: 150,
                      width:150,
                      decoration: BoxDecoration(
                        color: Color(0xff10CCCC),
                        borderRadius: BorderRadius.circular(100)
                    
                      ),
                      
                      child: Center(
                        child: Container(
                          height: 100,
                        width:100,
                         decoration: BoxDecoration(
                          color: Color(0xffB7DBEB),
                          borderRadius: BorderRadius.circular(100)
                        
                        ),
                        child: Icon(Icons.check_sharp,color: Colors.white,size: 50,),
                        
                        ),
                      ) 
                    ),
                  ),
                  SizedBox(height: 10,),
                  RatingBar.builder(
                        initialRating: double.parse(widget.point.toString()),
                                 minRating: 1,
                          direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemSize: 50,
                             itemCount: 3,
                             itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                             itemBuilder: (context, _) => Icon(
                              Icons.star,
                                    color: Colors.amber,
                                                 ),
                           onRatingUpdate: (rating) {
                              print(rating);
                                                     },
  
                                                  ),
SizedBox(height: 40,),
Row( mainAxisAlignment: MainAxisAlignment.center,
  children: [
  Text("You Earned ",style: TextStyle(color: Colors.white,fontSize: 20),),
  Text("${widget.point}",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),)
],),
SizedBox(height: 20,),
InkWell(
  onTap: ()async {
    setState(() {
              if(widget.L1){
                level1=true;
              }else if(widget.L2){
                 level1=true;
                level2=true;
               
              }else if(widget.L3){
                level1=true;
                level2=true;
                level3=true;
              }else if(widget.L4){
                level1=true;
                level2=true;
                level3=true;
                level4=true;
              }else if(widget.L5){
                level1=true;
                level2=true;
                level3=true;
                level4=true;
                level5=true;
              }else if(widget.L6){
                level1=true;
                level2=true;
                level3=true;
                level4=true;
                level5=true;
                level6=true;
              }else if(widget.L7){
                level1=true;
                level2=true;
                level3=true;
                level4=true;
                level5=true;
                level6=true;
                level7=true;
              }else if(widget.L8){
                level1=true;
                level2=true;
                level3=true;
                level4=true;
                level5=true;
                level6=true;
                level7=true;
                level8=true;
              }else if(widget.L9){
                 level1=true;
                level2=true;
                level3=true;
                level4=true;
                level5=true;
                level6=true;
                level7=true;
                level8=true;
                level9=true;
              }else{
                level1=true;
                level2=true;
                level3=true;
                level4=true;
                level5=true;
                level6=true;
                level7=true;
                level8=true;
                level9=true;

              }
            });
             await FirebaseFirestore.instance
                          .collection("Leaderscore")
                          .doc(FirebaseAuth.instance.currentUser!.email) 
                          .set({
                        "points": widget.point,
                        
                      });
                      await FirebaseFirestore.instance
                          .collection("Levels")
                          .doc(FirebaseAuth.instance.currentUser!.email) 
                          .set({
                        "Level1":level1 ,
                        "Level2":level2,
                        "level3":level3,
                        "level4":level4,
                        "level5":level5,
                        "level6":level6,
                        "level7":level7,
                        "level8":level8,
                        "level9":level9
                        
                      });
            

            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Mapgame(
              level1:level1 ,
              level2: level2,
              level3: level3,
              level4: level4,
              level5: level5,
              level6: level6,
              level7: level7,
              level8: level8,
              level9: level9,
              
              ),));
  },
  child: Container(
    margin: EdgeInsets.symmetric(horizontal: 30),
    height: 80,
    width: double.infinity,
    decoration: BoxDecoration(
      color: Color(0xff10CCCC),
      borderRadius: BorderRadius.circular(20)
    ),
    child: Center(child: Text("Next Stage",style: TextStyle(color: Colors.white,fontSize: 30),)),
  ),
),
InkWell(
  onTap: () {
    setState(() {
              if(widget.L1){
                level1=true;
              }else if(widget.L2){
                 level1=true;
                level2=true;
               
              }else if(widget.L3){
                level1=true;
                level2=true;
                level3=true;
              }else if(widget.L4){
                level1=true;
                level2=true;
                level3=true;
                level4=true;
              }else if(widget.L5){
                level1=true;
                level2=true;
                level3=true;
                level4=true;
                level5=true;
              }else if(widget.L6){
                level1=true;
                level2=true;
                level3=true;
                level4=true;
                level5=true;
                level6=true;
              }else if(widget.L7){
                level1=true;
                level2=true;
                level3=true;
                level4=true;
                level5=true;
                level6=true;
                level7=true;
              }else if(widget.L8){
                level1=true;
                level2=true;
                level3=true;
                level4=true;
                level5=true;
                level6=true;
                level7=true;
                level8=true;
              }else if(widget.L9){
                 level1=true;
                level2=true;
                level3=true;
                level4=true;
                level5=true;
                level6=true;
                level7=true;
                level8=true;
                level9=true;
              }else{
                level1=true;
                level2=true;
                level3=true;
                level4=true;
                level5=true;
                level6=true;
                level7=true;
                level8=true;
                level9=true;

              }
            });
            

            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Mapgame(
              level1:level1 ,
              level2: level2,
              level3: level3,
              level4: level4,
              level5: level5,
              level6: level6,
              level7: level7,
              level8: level8,
              level9: level9,
              
              ),));
  },
  child: Container(
    margin: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
    height: 80,
    width: double.infinity,
    decoration: BoxDecoration(
      color: Color(0xffB7DBEB),
      borderRadius: BorderRadius.circular(20)
    ),
    child: Center(child: Text("Play Again",style: TextStyle(color: Colors.white,fontSize: 30),)),
  ),
)

                  ],);
                  
                }
              },
              )
           
                 


                  
                 
          ],
        ),
      ),
    );
  }
}
























