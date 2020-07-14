import 'dart:math';

import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Guess What ?",
      home: GuessWhat(),
      theme: ThemeData(
        //accentColor: Colors.white 
        primaryColor: Colors.grey.shade400,
        ),
    );
  }
}

class GuessWhat extends StatefulWidget {
  
  

  @override
  _GuessWhatState createState() => _GuessWhatState();
}

class _GuessWhatState extends State<GuessWhat> {
  
  
    
  
  @override
  Widget build(BuildContext context) {
    
    
    String s ="?";
    var max=0;
    while(max<20){
    max= (Random().nextInt(100));
    }
    var min  = (max-20);
    void resetRange(){
      setState(() {
        while(max<20){
          max= (Random().nextInt(100));
        }
      });
    }
    var keyAnswer =  max-(Random().nextInt(20));
    final TextEditingController t1 = new TextEditingController();
    bool keyCheck = false;
    void check(){
      var temp = int.parse(t1.text);
      
      setState(() {
        if(temp==keyAnswer){
        keyCheck=true;
        print("true");
        
      }else{
        print("false");
      }
      });
    }
    
    print(keyAnswer);

    return Scaffold(
      
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: Text("Guess what's"),
      //   elevation: 0,
      // ),
      body:SafeArea(
              child: Column(
               mainAxisAlignment: MainAxisAlignment.center, 
               children: [
                 
                 Text("Guess what's the \nnumber ?",style: TextStyle(fontSize: 25),textAlign: TextAlign.center,),
                 SizedBox(height:100),
                 Container(
                   padding: EdgeInsets.all(20),

                   decoration: BoxDecoration(
                     color:Colors.grey.shade300,
                     borderRadius: BorderRadius.circular(50)
                   ),
                   child: Text(
                     keyCheck==true ? "$keyAnswer" : "no"
                   ),
                   
                 ),
                 SizedBox(height: 20,),
                 Text("Range : $min - $max"),
                 SizedBox(height: 20,),
                 Container(
                   padding: EdgeInsets.all(20),
                   child: TextFormField(
                     controller: t1,
                     keyboardType: TextInputType.number,
                     decoration: InputDecoration(
                       labelText:"   enter your guess",
                       alignLabelWithHint: false,
                       labelStyle: TextStyle(color: Colors.black,fontSize: 15),
                       border: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(25),
                         
                       ),
                       

                       
                     ),
                   ),
                 ),
                 //SizedBox(height:20),
                 GestureDetector(
                     onTap: (){
                       keyCheck=true;
                       check();
                     },
                     child: Padding(
                       padding: const EdgeInsets.only(left: 20,right: 20),
                       child: Container(
                         width: double.infinity,
                         padding: EdgeInsets.all(15),
                         decoration: BoxDecoration(
                           color:Colors.red,
                           borderRadius: BorderRadius.circular(25)
                           
                         ),
                         child: Center(child: Text("Check",style:TextStyle(color:Colors.white))),
                       ),
                     ),
                 ),
                 SizedBox(height:20),
                 GestureDetector(
                     onTap: (){
                       resetRange();
                     },
                     child: Padding(
                       padding: const EdgeInsets.only(left: 20,right: 20),
                       child: Container(
                         width: double.infinity,
                         padding: EdgeInsets.all(15),
                         decoration: BoxDecoration(
                           color:Colors.red,
                           borderRadius: BorderRadius.circular(25)
                           
                         ),
                         child: Center(child: Text("Try Again",style:TextStyle(color:Colors.white))),
                       ),
                     ),
                 )

               ],
              ),
         
        ),
  
    );
  }
}