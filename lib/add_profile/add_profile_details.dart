import 'dart:io';

import 'package:dating_app/Widgets/customButton.dart';
import 'package:dating_app/add_profile/gender.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class AddProfileDetails extends StatefulWidget {
  const AddProfileDetails({super.key});

  @override
  State<AddProfileDetails> createState() => _AddProfileDetailsState();
}

class _AddProfileDetailsState extends State<AddProfileDetails> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController address = TextEditingController();

  late FocusNode _namefocusNode = FocusNode();
  late FocusNode _emailfocusNode = FocusNode();
  late FocusNode _numberfocusNode = FocusNode();
  late FocusNode _dobfocusNode = FocusNode();
  late FocusNode _addressfocusNode = FocusNode();


  late OutlineInputBorder _namefocusNodeBorder;
  late OutlineInputBorder _emailfocusNodeBorder;
  late OutlineInputBorder _numberfocusNodeBorder;
  late OutlineInputBorder _dobfocusNodeBorder;
  late OutlineInputBorder _addressfocusNodeBorder;


  File? image;
  DateTime selectedDate = DateTime.now();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();




  Future<void> _getImage() async{
    final pickedFile = await ImagePicker().pickImage(source:ImageSource.gallery);
    setState(() {
      if(pickedFile != null){
        image =  File(pickedFile.path);
      }
    });
  }
  Future<void> selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1950),
      lastDate: DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor:const Color(0xffF26B8A), // Your custom color
            hintColor: const Color(0xffF26B8A),// Your custom color
            colorScheme: const ColorScheme.light(primary:Color(0xffF26B8A)),
            buttonTheme: const ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        final formattedDate = DateFormat("d MMM, yyyy").format(picked);
        dob.text = formattedDate;
      });

    }
  }

  @override
  void initState() {
    _namefocusNode = FocusNode();
    _emailfocusNode = FocusNode();
    _numberfocusNode = FocusNode();
    _dobfocusNode = FocusNode();
    _addressfocusNode = FocusNode();
    _namefocusNodeBorder = OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.grey,
      ),
      borderRadius: BorderRadius.circular(8.0),
    );
    _emailfocusNodeBorder = OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.grey,
      ),
      borderRadius: BorderRadius.circular(8.0),
    );
    _numberfocusNodeBorder = OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.grey,
      ),
      borderRadius: BorderRadius.circular(8.0),
    );
    _dobfocusNodeBorder = OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.grey,
      ),
      borderRadius: BorderRadius.circular(8.0),
    );
    _addressfocusNodeBorder = OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.grey,
      ),
      borderRadius: BorderRadius.circular(8.0),
    );
    super.initState();
  }
  @override
  void dispose(){
    _namefocusNode.dispose();
    _emailfocusNode.dispose();
    _numberfocusNode.dispose();
    _dobfocusNode.dispose();
    _addressfocusNode.dispose();
    super.dispose();
  }
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
                Padding(
                  padding: const EdgeInsets.only(left: 18.0, bottom: 5),
                  child: const Text(
                    "Add Profile Details",style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25
                  ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0, bottom: 30),
                  child: Text(
                    "Please add your profile details here",style: TextStyle(
                    color: Colors.grey[400],
                    fontWeight: FontWeight.w400,
                    fontSize: 18
                  ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    _getImage();
                  },
                  child: Center(
                    child: CircleAvatar(
                      backgroundColor: Colors.grey[400],
                      backgroundImage: (image!=null) ? FileImage(image!) : null,
                      radius: 60,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, right: 15,left: 15),
                  child: SizedBox(
                      width:double.infinity,
                      child: Focus(
                        onFocusChange: (bool hasFocus){
                          setState(() {
                            _namefocusNodeBorder = hasFocus
                                ? OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0xffF26B8A),
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            )
                                : OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.pink,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            );
                          });
                        },
                        child: TextField(
                          focusNode: _namefocusNode,
                          controller: name,
                          cursorColor: const Color(0xffF26B8A),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            enabledBorder: _namefocusNodeBorder,
                            focusedBorder: _namefocusNodeBorder,
                            hintText: "Name",
                            hintStyle: const TextStyle(color: Color(0xffF26B8A)),
                          ),
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, right: 15,left: 15),
                  child: SizedBox(
                      width:double.infinity,
                      child: Focus(
                        onFocusChange: (bool hasFocus){
                          setState(() {
                            _emailfocusNodeBorder = hasFocus
                                ? OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: const Color(0xffF26B8A),
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            )
                                : OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.pink,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            );
                          });
                        },
                        child: TextField(
                          focusNode: _emailfocusNode,
                          controller: email,
                          cursorColor: const Color(0xffF26B8A),
                          decoration: InputDecoration(
              
                            filled: true,
                            fillColor: Colors.white,
                            enabledBorder: _emailfocusNodeBorder,
                            focusedBorder: _emailfocusNodeBorder,
                            hintText: "Email address",
                            hintStyle: const TextStyle(color: Color(0xffF26B8A)),

                          ),
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, right: 15,left: 15),
                  child: SizedBox(
                      width:double.infinity,
                      child: Focus(
                        onFocusChange: (bool hasFocus){
                          setState(() {
                            // email1 = hasFocus?const Color(0xffF26B8A):Colors.black45;
                            _numberfocusNodeBorder = hasFocus
                                ? OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: const Color(0xffF26B8A),
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            )
                                : OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.pink,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            );
                          });
                        },
                        child: TextField(
                          focusNode: _numberfocusNode,
                          controller: number,
                          cursorColor: const Color(0xffF26B8A),
                          decoration: InputDecoration(
                            // prefixIcon: Icon(Icons.email,color: email1),
                            filled: true,
                            fillColor: Colors.white,
                            enabledBorder: _numberfocusNodeBorder,
                            focusedBorder: _numberfocusNodeBorder,
                            hintText: "Mobile Number",
                            hintStyle: const TextStyle(color: Color(0xffF26B8A)),

                          ),
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, right: 15,left: 15),
                  child: SizedBox(
                      width:double.infinity,
                      child: Focus(
                        onFocusChange: (bool hasFocus){
                          setState(() {
                            // email1 = hasFocus?const Color(0xffF26B8A):Colors.black45;
                            _dobfocusNodeBorder = hasFocus
                                ? OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: const Color(0xffF26B8A),
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            )
                                : OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.pink,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            );
                          });
                        },
                        child: TextField(
                          focusNode: _dobfocusNode,
                          controller: dob,
                          cursorColor: const Color(0xffF26B8A),
                          onTap: (){
                            selectDate(context);
                          },
                          readOnly: true,
                          decoration: InputDecoration(
                            // prefixIcon: Icon(Icons.email,color: email1),
                            suffixIcon: const Icon(Icons.calendar_month_sharp, color: Color(0xffF26B8A),),
                            filled: true,
                            fillColor: Colors.white,
                            enabledBorder: _dobfocusNodeBorder,
                            focusedBorder: _dobfocusNodeBorder,
                            hintText: "Date Of Birth",
                            hintStyle: const TextStyle(color: Color(0xffF26B8A)),

                          ),
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, right: 15,left: 15),
                  child: SizedBox(
                      width:double.infinity,
                      child: Focus(
                        onFocusChange: (bool hasFocus){
                          setState(() {
                            // email1 = hasFocus?const Color(0xffF26B8A):Colors.black45;
                            _addressfocusNodeBorder = hasFocus
                                ? OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: const Color(0xffF26B8A),
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            )
                                : OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.pink,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            );
                          });
                        },
                        child: TextField(
                          focusNode: _addressfocusNode,
                          controller: address,
                          cursorColor: const Color(0xffF26B8A),
                          decoration: InputDecoration(
                            // prefixIcon: Icon(Icons.email,color: email1),
                            filled: true,
                            fillColor: Colors.white,
                            enabledBorder: _addressfocusNodeBorder,
                            focusedBorder: _addressfocusNodeBorder,
                            hintText: "Enter Address",
                            hintStyle: const TextStyle(color: Color(0xffF26B8A)),

                          ),
                        ),
                      )),
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
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const Gender()));
              },),
            ),
          )
        ],
      ),
    );
  }

}
