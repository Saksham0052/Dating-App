
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../Widgets/customButton.dart';
import '../add_profile/add_profile_details.dart';
import 'forgotpassword.dart';


class Login extends StatefulWidget {
  final String? name;
  const Login({super.key, this.name});
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  late FocusNode _emailfocusNode = FocusNode();
  late FocusNode _passwordfocusNode = FocusNode();
  late OutlineInputBorder _emailfocusNodeBorder;
  late OutlineInputBorder _passwordfocusNodeBorder;

  Color lock = Colors.black45;
  Color email1 = Colors.black45;

  String selected = "";
  bool LoggedIn = false;
  bool loading = false;


  // Future<void> loginAccount() async {
  //   setState(() {
  //     LoggedIn = true;
  //   });
  //   String Name = name.text.trim();
  //   String Email = email.text.trim();
  //   String Password = password.text.trim();
  //
  //   try {
  //     UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
  //       email: Email,
  //       password: Password,
  //     );
  //     if(userCredential != null){
  //       setState(() {
  //         loading = true;
  //       });
  //       // await Fluttertoast.showToast(
  //       //   msg: "Successfully Logged In",
  //       //   toastLength: Toast.LENGTH_SHORT,
  //       //   gravity: ToastGravity.TOP,
  //       //   timeInSecForIosWeb: 1,
  //       //   backgroundColor: Colors.black45,
  //       //   textColor: Colors.white,
  //       //   fontSize: 16.0,
  //       // );
  //       Future.delayed(Duration(milliseconds: 3000) ,() {
  //         Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage(name: widget.name)));
  //       });
  //       Navigator.popUntil(context, (route) => route.isCurrent);
  //     }
  //     else{
  //       setState(() {
  //         loading = false;
  //       });
  //     }
  //   } catch (error) {
  //     print(error);
  //     Fluttertoast.showToast(
  //       msg: "Login Failed",
  //       toastLength: Toast.LENGTH_SHORT,
  //       gravity: ToastGravity.TOP,
  //       timeInSecForIosWeb: 1,
  //       backgroundColor: Colors.black45,
  //       textColor: Colors.white,
  //       fontSize: 16.0,
  //     );
  //   } finally {
  //     setState(() {
  //       LoggedIn = false;
  //     });
  //   }
  // }

  @override
  void initState() {
    _emailfocusNode = FocusNode();
    _passwordfocusNode = FocusNode();
    _emailfocusNodeBorder = OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.grey,
      ),
      borderRadius: BorderRadius.circular(8.0),
    );
    _passwordfocusNodeBorder = OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.grey,
      ),
      borderRadius: BorderRadius.circular(8.0),
    );
    super.initState();
  }
  @override
  void dispose(){
    _emailfocusNode.dispose();
    _passwordfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: null,
      body:Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bgabovecommon.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                child: SafeArea(
                  child: Container(
                    child: Column(
                      children: [
                        const Text("Welcome Back",
                          maxLines: 3,
                          style:  TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff414040),
                          ),
                        ),
                        const SizedBox(height: 10,),
                        const Text("You can login to continue",
                          textAlign:TextAlign.center,
                          maxLines: 5,
                          style:  TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                            color: Colors.grey,
                          ),
                        ),
                        // const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(top: 60.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: (){
                                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>InsideArticles()));
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: -1.2, // Negative value to contain the shadow within the border
                                        blurRadius: 5,
                                        offset: const Offset(0, 2),
                                      )],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 18.0, bottom: 18,right: 25, left: 25),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Image.asset("assets/images/google.png"),
                                        const SizedBox(width: 10,),
                                        const Text("Google",
                                          textAlign:TextAlign.center,
                                          maxLines: 10,
                                          style:  TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w300,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: (){
                                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>InsideArticles()));
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: CupertinoColors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: -1.1, // Negative value to contain the shadow within the border
                                        blurRadius: 5,
                                        offset: const Offset(0, 2),
                                      )],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 18.0, bottom: 18, right: 25, left: 25),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Image.asset("assets/images/facebook.png", scale: 4,),
                                        const SizedBox(width: 8,),
                                        const Text("Facebook",
                                          textAlign:TextAlign.center,
                                          maxLines: 3,
                                          style:  TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 40,),
                        Text("--------------------------------Or Signup with----------------------------------", style: TextStyle(
                          color: Colors.grey[400]
                        ),),
                        //text fields
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0, right: 15,left: 15),
                          child: SizedBox(
                              width:double.infinity,
                              child: Focus(
                                onFocusChange: (bool hasFocus){
                                  setState(() {
                                    email1 = hasFocus?const Color(0xffF26B8A):Colors.black45;
                                    _emailfocusNodeBorder = hasFocus
                                        ? OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: const Color(0xffF26B8A),
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    )
                                        : OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Colors.grey,
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
                                    prefixIcon: Icon(Icons.email,color: email1),
                                    filled: true,
                                    fillColor: Colors.white,
                                    enabledBorder: _emailfocusNodeBorder,
                                    focusedBorder: _emailfocusNodeBorder,
                                    hintText: "Enter Your email",
                                  ),
                                ),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0, right: 15,left: 15, bottom: 8),
                          child: SizedBox(
                              width:double.infinity,
                              child: Focus(
                                onFocusChange: (bool hasFocus){
                                  setState(() {
                                    lock = hasFocus?const Color(0xffF26B8A):Colors.black45;
                                    _passwordfocusNodeBorder = hasFocus
                                        ? OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color:  Color(0xffF26B8A)
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    )
                                        : OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Colors.grey,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    );
                                  });
                                },
                                child: TextField(
                                  focusNode: _passwordfocusNode,
                                  controller: password,
                                  obscureText: true,
                                  cursorColor: const Color(0xffF26B8A),
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.lock_person, color: lock),
                                    filled: true,
                                    fillColor: Colors.white,
                                    enabledBorder: _passwordfocusNodeBorder,
                                    focusedBorder: _passwordfocusNodeBorder,
                                    hintText: "Enter Your Password",
                                  ),
                                ),
                              )),
                        ),

                        SizedBox(height: 20,),
                        //buttons
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>const AddProfileDetails()));
                          },
                          child: AnimatedContainer(
                            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                            height: 65,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.transparent),
                              color:  const Color(0xffF26B8A),
                              borderRadius: BorderRadius.all(Radius.circular(5),
                              ),),
                            duration: Duration(milliseconds: 200),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 15.0, bottom: 15, right: 25, left: 25),
                              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Center(
                                    child: const Text("Login",style: TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xffFFFFFF)
                                    ),),),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 5.9,),
                        GestureDetector(
                          onTap: (){
                            showModalBottomSheet(
                                backgroundColor: Colors.white,
                                elevation: 0,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                                ),
                                clipBehavior: Clip.antiAlias,
                                context: context,
                                builder: (BuildContext context){
                                  return const forgotpassword();
                                });
                          },
                          child: AnimatedContainer(
                            margin: EdgeInsets.symmetric(vertical: 6, horizontal: 15),
                            height: 65,
                            decoration: BoxDecoration(
                              border: Border.all(color: const Color(0xffF26B8A)),
                              color: Color(0x50FFFFFF),
                              borderRadius: BorderRadius.all(Radius.circular(5),
                              ),),
                            duration: Duration(milliseconds: 200),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 15.0, bottom: 15, right: 25, left: 25),
                              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Center(child: Text("Continue with Phone Number",style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xffF25278)
                                  ),),),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                              margin: const EdgeInsets.only(top:20, bottom: 10),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                          "Don't Have an Account? ",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Color(0xff808080),
                                              fontWeight: FontWeight.w600,
                                              height: 1.5,
                                              fontSize: 15,
                                              fontFamily: 'Lato')),
                                      const SizedBox(width: 3,),
                                      GestureDetector(
                                        onTap: () {
                                          // Navigator.push(context,
                                          //     MaterialPageRoute(builder: (context) => const Register()));
                                        },
                                        child: const Text(
                                            "SIGN UP",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                decoration: TextDecoration.underline,
                                                decorationColor: Color(0xffF26B8A),
                                                color:  Color(0xffF26B8A),
                                                fontWeight: FontWeight.w600,
                                                height: 1.5,
                                                fontSize: 15,
                                                fontFamily: 'Lato')),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          // const Padding(
          //   padding: EdgeInsets.only(bottom: 20.0),
          //   child: Align(
          //     alignment: Alignment.bottomCenter,
          //     child: Text("Don't have an account? Join Us",
          //         style: TextStyle(
          //             color:  Color(0xff0EBE7F),
          //             fontWeight: FontWeight.w400,
          //             fontSize: 15.45)),
          //   ),
          // ),
          // Align(
          //   alignment: Alignment.topLeft,
          //   child: Image.asset("assets/images/bgabovecommon.png",),
          // ),
          // Align(
          //   alignment: Alignment.bottomRight,
          //   child: Image.asset("assets/images/bgcommon.png",),
          // ),
        ],
      ),
    );
  }}
