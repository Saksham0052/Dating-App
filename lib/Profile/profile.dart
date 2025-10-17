import 'package:dating_app/widgets/customButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DatingProfilePage extends StatefulWidget {
  const DatingProfilePage({super.key});

  @override
  State<DatingProfilePage> createState() => _DatingProfilePageState();
}

class _DatingProfilePageState extends State<DatingProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _customAppBar(),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            const CircleAvatar(
              radius: 35,
              backgroundImage: AssetImage("assets/images/profilefordatingapp.jpg"),

            ),
            const SizedBox(
              height: 10,
            ),
            const Text("Mark Johnson" , style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),),
            const Text("markjohnson@gmail.com" , style: TextStyle( color: Colors.grey , fontSize: 16, fontWeight: FontWeight.normal),),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 450,
              child: ListView(
                children: [
                  const ListTile(
                    leading: Icon(Icons.person , size: 30,),
                    title: Text("Personal Detail" , style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),),
                    trailing: Icon(Icons.arrow_right , size: 30,),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18, right: 18),
                    child: Divider(height: 20,thickness: 1, color: Colors.grey.shade300,),
                  ),
                  const ListTile(
                    leading: Icon(Icons.settings , size: 30,),
                    title: Text("Settings" , style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),),
                    trailing: Icon(Icons.arrow_right , size: 30,),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18, right: 18),
                    child: Divider(height: 20,thickness: 1, color: Colors.grey.shade300,),
                  ),
                  const ListTile(
                    leading: Icon(Icons.browser_updated_rounded , size: 30,),
                    title: Text("Terms & Conditions" , style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),),
                    trailing: Icon(Icons.arrow_right , size: 30,),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18, right: 18),
                    child: Divider(height: 20,thickness: 1, color: Colors.grey.shade300,),
                  ),
                  const ListTile(
                    leading: Icon(Icons.notification_important_sharp , size: 30,),
                    title: Text("Privacy Policy" , style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),),
                    trailing: Icon(Icons.arrow_right , size: 30,),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18, right: 18),
                    child: Divider(height: 20,thickness: 1, color: Colors.grey.shade300,),
                  ),
                  const ListTile(
                    leading: Icon(Icons.remove_red_eye_rounded , size: 30,),
                    title: Text("About Us" , style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),),
                    trailing: Icon(Icons.arrow_right , size: 30,),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18, right: 18),
                    child: Divider(height: 20,thickness: 1, color: Colors.grey.shade300,),
                  ),
                  const ListTile(
                    leading: Icon(Icons.logout , size: 30,),
                    title: Text("Logout" , style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),),
                    trailing: Icon(Icons.arrow_right , size: 30,),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18, right: 18),
                    child: Divider(height: 20,thickness: 1, color: Colors.grey.shade300,),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  PreferredSizeWidget _customAppBar(){
    return AppBar(
      title: const Text("My Profile" , style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),),
      centerTitle: true,
    );
  }
}