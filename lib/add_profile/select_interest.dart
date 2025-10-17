import 'dart:io';

import 'package:dating_app/Widgets/bottomNavBar.dart';
import 'package:dating_app/Widgets/customButton.dart';
import 'package:dating_app/user_about/AboutUser.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class Interest extends StatefulWidget {
  const Interest({super.key});

  @override
  State<Interest> createState() => _InterestState();
}

class _InterestState extends State<Interest> {

  int current = 0;


  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios_rounded),
      ),
      body: Stack(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20,),
                  const Padding(
                    padding: EdgeInsets.only(left: 18.0, bottom: 5),
                    child: Text(
                      "Select your Interest",style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 25
                    ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0, bottom: 30),
                    child: Text(
                      "Select a few of your interest to match with users "
                          "who have similar things in common.",style: TextStyle(
                        color: Colors.grey[400],
                        fontWeight: FontWeight.w400,
                        fontSize: 18
                    ),
                    ),
                  ),

                  SizedBox(
                    height: 390,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GridView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          crossAxisSpacing: 4.0,
                          mainAxisSpacing: 4.0,
                          childAspectRatio: 0.7,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: (){
                              setState(() {
                                current = index;
                              });
                            },
                            child: AnimatedContainer(
                              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 2),
                              height: 35,
                              decoration: BoxDecoration(
                                border:  current  == index ?Border.all(color: Colors.transparent):Border.all(color: Colors.transparent),
                                color: current ==index?const Color(0xffF26B8A): const Color(0x20F26B8A),
                                borderRadius: current == index ? BorderRadius.all(Radius.circular(10)):BorderRadius.all(Radius.circular(5),
                                ),),
                              duration: const Duration(milliseconds: 200),
                              child: Center(child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Icon(Icons.camera, color: current == index ? CupertinoColors.white: Colors.black54,),
                                    const SizedBox(width: 5,),
                                    Text("Photography",style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: current==index?  const Color(0xffFFFFFF) : Colors.black54
                                    ),),
                                  ],
                                ),
                              ),),
                            ),
                          );
                        },
                      ),
                    ),
                  ),




                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: LoginButton(title: "Continue", onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomeBar()));

              },),
            ),
          )
        ],
      ),
    );
  }

}
