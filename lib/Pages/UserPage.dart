import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';

class User extends StatefulWidget {
  const User({super.key});

  @override
  State<User> createState() => _UserState();
}

class _UserState extends State<User> {
  dynamic ImgId=Random().nextInt(9)+1;
  @override
  Widget build(BuildContext context) {
    return Center(

      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        // crossAxisAlignment: CrossAxisAlignment.s,


        children: [
          Container(height: MediaQuery.of(context).size.height/3,
          width: MediaQuery.of(context).size.width/1.5,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),child:Image.asset("Images/cid$ImgId.png")),

          Container(height: MediaQuery.of(context).size.height/3,
            width: MediaQuery.of(context).size.width/1.5,
            decoration: const BoxDecoration(
                color: Colors.red
            ),child:const Text("sid"),),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              TextButton(
                onPressed: () {
                  print("Reset button pressed");
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(const Color(0xff003652)),
                ),
                child: Text(
                  "RESET",
                  style: GoogleFonts.mukta(
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white, // Text color
                    ),
                  ),
                ),
              ),

              SizedBox(width: MediaQuery.of(context).size.width/5),
              TextButton(
                onPressed: () {
                  print("Submit button pressed");
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(const Color(0xff003652)),
                ),
                child: Text(
                  "SUBMIT",
                  style: GoogleFonts.mukta(
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white, // Text color
                    ),
                  ),
                ),
              ),


            ],)

        ],

      ),
    );
  }
}
