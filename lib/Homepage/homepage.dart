import 'package:dating_app/Introduction/model/content_model.dart';
import 'package:dating_app/user_about/AboutUser.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'homepageModel.dart';

class HomePage extends StatefulWidget{
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                const SizedBox(
                  height:20,
                ),
                _header(context),
                Row(
                  children: [
                    Container(
                      // color: Colors.indigo,
                        margin: const EdgeInsets.fromLTRB(16, 10, 18, 10),
                        width: MediaQuery.of(context).size.width/(5/3.8),
                        child: search_bar()
                    ),
                    InkWell(
                      onTap: (){
                        _bottomSheet(context);
                      },
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: const Color(0xffF26B8A),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(Icons.filter_list , color: CupertinoColors.white,),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: SizedBox(
                      height: 550,
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const AboutUser()));
                        },
                        child: PageView.builder(
                          itemCount: contents1.length,
                          controller: _pageController,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onPanUpdate: (details) {
                                if (details.delta.dx > 0) {
                                  // Swiping to the right
                                  print('Swiped right');
                                  // Add your logic for a positive swipe (like marking as liked)
                                } else if (details.delta.dx < 0) {
                                  // Swiping to the left
                                  print('Swiped left');
                                  // Add your logic for a negative swipe (like marking as disliked)
                                }
                              },
                              child: Container(
                                margin: const EdgeInsets.symmetric(horizontal: 18, vertical:20),
                                // padding: EdgeInsets.only(bottom: 40),
                                height: 500,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    // color: Colors.indigo,
                                    image: DecorationImage(
                                        image: NetworkImage("${contents1[index].image}"),
                                        fit: BoxFit.fitWidth
                                    )
                                ),
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 430,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 12 , right: 12),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Column(
                                            // mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("Alia, 22" , style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),),
                                              Text("Tattoo Artist" , style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal, color: Colors.white),),
                                            ],
                                          ),
                                          Container(
                                              height: 25,
                                              width: 25,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.circular(5)
                                              ),
                                              child: Center(child: Icon(Icons.more_vert , color: Colors.grey.shade600,size: 20,))
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
            
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Positioned(
              bottom: 0,
              left: 110,
              right: 0,
              top: MediaQuery.of(context).size.height/1.42,
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        boxShadow: [BoxShadow(
                          color: Colors.grey.withOpacity(0.2), // shadow color
                          spreadRadius: 8, // spread radius
                          blurRadius: 15, // blur radius
                          offset: const Offset(0, 2),
                        )]
                    ),
                    child: CircleAvatar(
                      radius: 28,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.cancel , color: Colors.redAccent,),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        boxShadow: [BoxShadow(
                          color: Colors.grey.withOpacity(0.2), // shadow color
                          spreadRadius: 8, // spread radius
                          blurRadius: 15, // blur radius
                          offset: const Offset(0, 2),
                        )]
                    ),
                    child: CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.favorite_rounded,size: 35 , color: Colors.pinkAccent.shade200,),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        boxShadow: [BoxShadow(
                          color: Colors.grey.withOpacity(0.2), // shadow color
                          spreadRadius: 8, // spread radius
                          blurRadius: 15, // blur radius
                          offset: const Offset(0, 2),
                        )]
                    ),
                    child: CircleAvatar(
                      radius: 28,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.star , color: Colors.orange,),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    
    );
  }

  Widget _header(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(left: 18, right: 20 ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.pink.shade50,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(Icons.location_on_rounded , color: Colors.redAccent),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Location",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("India, New Delhi" , style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.grey.shade400),),
                    ],
                  ),
                ],
              ),
            ],
          ),

          const Icon(Icons.notification_important_rounded , size: 30,)


        ],
      ),
    );
  }

  Widget search_bar(){
    var searchController = TextEditingController();
    return
      TextFormField(
        controller: searchController,
        decoration: InputDecoration(
          // helperMaxLines: 7,

          filled: true,
          fillColor: Colors.grey.shade200,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                  color: Colors.white
              )
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                  color: Colors.white
              )
          ),


          hintText:  'Search',
          hintStyle: const TextStyle(fontFamily: 'Classic' ,fontSize: 15, fontWeight: FontWeight.w400 , color: Colors.grey),
          contentPadding: const EdgeInsets.all(20),
          prefixIcon: const Icon(Icons.search , color: Colors.grey),),

      );

  }

  Future _bottomSheet(BuildContext context){
    int counter = 0;
    List<String> arr = ['man' ,' woman', 'others' ];
    RangeValues _values = const RangeValues(0, 30);
    RangeValues _ageValues = const RangeValues(18, 35);

    RangeLabels _labels = RangeLabels(_values.start.toString(), _values.end.toString());
    RangeLabels _ageLabels = RangeLabels(_ageValues.start.toString(), _ageValues.end.toString());
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context, builder: (context){
      return Container(
        height: 605,
        child: Column(
          children: [
            SizedBox(
              height: 5,
            ),
            Image.asset('assets/images/dating_rectangle.jpg' , scale: 4,),
            Container(
              height: 590,
              padding: const EdgeInsets.only(top: 30, left: 18, right: 18),
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image.asset("assets/images/slashbar.png" , scale: 3.5,),
                    const Text("Filter" , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold ),),
                    Divider(height: 20,thickness: 1, color: Colors.grey.shade300,),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 70,
                      decoration: BoxDecoration(

                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: Colors.pinkAccent.shade200,
                            width: 1,
                          )
                      ),
                      child: ListTile(
                        title: Text("Location", style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.pinkAccent.shade200),),
                        subtitle: const Text("Hawaii", style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),),
                        trailing: const Icon(Icons.arrow_drop_down_outlined),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text("Distance" , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold ),),
                    RangeSlider(
                      values: _values,
                      onChanged: (RangeValues newValues) {
                        setState(() {
                          _values = newValues;
                        });
                      },
                      min: 0,
                      max: 60,
                      divisions: 12, // Optional: Set the number of divisions between the min and max values
                      labels: _labels,
                      activeColor: const Color(0xffF26B8A),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text("Age" , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold ),),
                    RangeSlider(
                      values: _ageValues,
                      onChanged: (RangeValues newValues) {
                        setState(() {
                          _ageValues = newValues;
                        });
                      },
                      min: 0,
                      max: 60,
                      divisions: 60, // Optional: Set the number of divisions between the min and max values
                      labels: _ageLabels,
                      activeColor: const Color(0xffF26B8A),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text("Interested In" , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold ),),
                    const SizedBox(
                      height: 14,
                    ),
                    SizedBox(
                      height: 40,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 3,
                        itemBuilder: (BuildContext context, int index) {
                          return Row(
                            children: [
                              InkWell(
                                onTap: (){
                                  setState(() {
                                    counter = index;
                                  });
                                  // counter = !counter;
                                },
                                child: Container(
                                  height: 40,
                                  width: MediaQuery.of(context).size.width/(3.7/1),
                                  decoration: BoxDecoration(
                                    color: counter == index? Color(0xffF26B8A): Colors.white,
                                    borderRadius:counter==index? BorderRadius.circular(8):BorderRadius.circular(15),
                                    border: counter==index ? Border.all(width: 1, color: const Color(0xffF26B8A)): Border.all(width: 1, color: const Color(0xffF26B8A)),
                                  ),
                                  child: Center(child: Text(arr[index] , style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal ),)),
                                ),
                              ),
                              SizedBox(
                                width: 16,
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width/(2.3/1),
                          decoration: BoxDecoration(
                            // color: Colors.green,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                  width: 1,
                                  color: Colors.grey
                              )
                          ),

                          child:const Center(child: Text("Clear All" , style: TextStyle(fontSize: 18 , fontWeight: FontWeight.normal ),)),

                        ),
                        Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width/(2.3/1),
                          decoration: BoxDecoration(
                            // color: Colors.green,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                  width: 1,
                                  color: Colors.grey
                              )
                          ),

                          child:const Center(child: Text("Apply" , style: TextStyle(fontSize: 18 , fontWeight: FontWeight.normal ),)),

                        ),

                      ],
                    ),
                  ],

                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}