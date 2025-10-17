import 'dart:async';
import 'package:dating_app/Introduction/intro1.dart';
import 'package:flutter/material.dart';


// ignore: camel_case_types
class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  _splashScreen createState() => _splashScreen();
}

class _splashScreen extends State<splashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(
      const Duration(seconds: 5),
          () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const Introduction()
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: null,
      body: Stack(
        children: [
          // Align(
          //   alignment: Alignment.topLeft,
          //   child: Image.asset("assets/images/bgabovecommon.png",),
          // ),
          Align(
            alignment: Alignment.center,
            child: Icon(Icons.favorite, color: Color(0xffF25278), size: 60,),
          ),
          // Align(
          //   alignment: Alignment.bottomRight,
          //   child: Image.asset("assets/images/bgcommon.png",),
          // ),
        ],
      ),
    );
  }

}
