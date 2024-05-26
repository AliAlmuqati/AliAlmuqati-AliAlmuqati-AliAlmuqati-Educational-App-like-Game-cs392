

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class edite_Email extends StatefulWidget {
  const edite_Email({super.key});

  @override
  State<edite_Email> createState() => _edite_EmailState();
}

class _edite_EmailState extends State<edite_Email> {
  TextEditingController controller=TextEditingController();

  bool ischeck=false;
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: size.width*0.8,
        height: size.height*0.25,
        decoration: BoxDecoration(
          color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.blue, blurRadius: 15)],
        ),

       // color: Colors.amber,
       child: Column( crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:10.0),
              child: Text('Add the new Email',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
            ),
            IconButton(onPressed: (){
              Navigator.pop(context); 
            }, icon:Icon(Icons.close,color: Colors.black38,)),
            


          ],),

        Padding(
         padding: EdgeInsets.symmetric(horizontal: 20), 
          child: Text('new Email address'),
        ),
        Container(
          height: size.height*0.06,
          padding: EdgeInsets.symmetric(horizontal: 10),
         margin: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black45)
          ),
          child: TextField(
            controller: controller,
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'new Email',
              border: InputBorder.none,
            ),
          ),
        ),
       
        SizedBox(height: size.height*0.02,),

        Row( mainAxisAlignment: MainAxisAlignment.end,
          children: [
          MaterialButton(
            onPressed: ()async{ 
              await FirebaseAuth.instance.currentUser!.updateEmail(controller.text);
              print("password update successfully");
               Navigator.pop(context); 

             
               },
            child: Text('Save',style: TextStyle(color: Colors.white),),color: Colors.blue, shape:StadiumBorder(side: BorderSide(color: Colors.white)) ,),
          SizedBox(width: size.width*0.01,),
            MaterialButton(onPressed: (){  Navigator.pop(context);   },child: Text('close'),color: Colors.white54,shape:StadiumBorder(side: BorderSide(color: Colors.black45))),
            SizedBox(width: size.width*0.01,),
        ],)
       
          
        


       ],),

        

      ),
    ) ;
  }
}