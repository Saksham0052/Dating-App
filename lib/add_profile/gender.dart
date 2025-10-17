import 'dart:io';

import 'package:dating_app/Widgets/customButton.dart';
import 'package:dating_app/add_profile/select_interest.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class Gender extends StatefulWidget {
  const Gender({super.key});

  @override
  State<Gender> createState() => _GenderState();
}

class _GenderState extends State<Gender> {

  int current = 0;


  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

   var genderArr = [Icons.male , Icons.female];

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
                    padding: const EdgeInsets.only(left: 18.0, bottom: 5),
                    child: const Text(
                      "Select Gender",style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 25
                    ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0, bottom: 30),
                    child: Text(
                      "Please Select Your Gender",style: TextStyle(
                        color: Colors.grey[400],
                        fontWeight: FontWeight.w400,
                        fontSize: 18
                    ),
                    ),
                  ),

                  Center(
                    child: SizedBox(
                      height: 650,
                      width: 190,
                      child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: 2,
                          itemBuilder: (context, index){
                            return GestureDetector(
                              onTap: (){
                                setState(() {
                                  current= index;
                                });
                              },
                              child: AnimatedContainer(
                                margin: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                                width: 100,
                                height: 150,
                                decoration: BoxDecoration(
                                  color: current ==index?const Color(0xffF26B8A): const Color(0x20F26B8A),
                                  borderRadius: current == index ? BorderRadius.all(Radius.circular(20)):BorderRadius.all(Radius.circular(20)),
                                ),
                                duration: Duration(milliseconds: 200),

                                child: Center(child: current==index?  Icon(genderArr[index], color: Color(0xffFFFFFF),size: 60,):  Icon(genderArr[index], color: Colors.black,size: 60,),),
                              ),
                            );
                          }
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
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const Interest()));
              },),
            ),
          )
        ],
      ),
    );
  }

}
