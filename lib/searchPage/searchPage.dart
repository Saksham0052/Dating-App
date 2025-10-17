import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  var searchController = TextEditingController();
  int current = 0;
  List<String> searchResult = []; // List to store search results
  List<String> data = ["Shashank", "Saloni Verma", "John", "Doe"]; // Your data list

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(height:10,),
              Row(
                children: [
                  const Icon(Icons.arrow_back_ios_rounded, color: Colors.black,),
                  const SizedBox(width: 10,),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width/1.2,
                    child: search_bar(),
                  ),
                ],
              ),
              const SizedBox(height:15,),
              SizedBox(
                height: 50,
                child: ListView.builder(
                  itemCount: 10,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: (){
                        setState(() {
                          current = index;
                        });
                      },
                      child: AnimatedContainer(
                        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                        width: 150,
                        height: 45,
                        decoration: BoxDecoration(
                          color: current ==index? const Color(0xffF26B8A): const Color(0x10F26B8A),
                          borderRadius: current == index ? const BorderRadius.all(Radius.circular(10)):const BorderRadius.all(Radius.circular(5)),
                        ),
                        duration: const Duration(milliseconds: 200),
                        child: Center(
                          child: Text("Saloni Verma",style: TextStyle(
                            color: current ==index? const Color(0xffFFFFFF) :const Color(0xffF26B8A),
                          ),),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20,),
              const Padding(
                padding: const EdgeInsets.only(right: 4.0, left: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Recent",style: TextStyle(
                        color:  Colors.black,
                        fontWeight: FontWeight.bold)),
                    Text("See all",style: TextStyle(
                        color:  const Color(0xffF26B8A),
                        fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 1000,
                        child: ListView.builder(
                          itemCount: searchResult.length == 0 && searchController.text.isNotEmpty
                              ? 1
                              : searchResult.length,
                          itemBuilder: (BuildContext context, int index) {
                            if(searchResult.isEmpty){
                              return SizedBox(
                                height: 100,
                                child: Center(
                                  child: const Text("No Results Found ", style: TextStyle(
                                    color: Colors.black
                                  ),),
                                ),
                              );
                            }
                            return ListTile(
                              leading: const CircleAvatar(
                                radius: 30,
                                backgroundImage: NetworkImage("https://d2qp0siotla746.cloudfront.net/img/use-cases/profile-picture/template_0.jpg"),
                              ),
                              title: Text(searchResult[index], style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500
                              ),),
                              subtitle: const Text("Singer", style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400
                              ),),
                              trailing: const Text("×", style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 20
                              ),),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget search_bar(){
    return TextFormField(
      controller: searchController,
      onChanged: (value) {
        setState(() {
          searchResult = data
              .where((element) => element.toLowerCase().contains(value.toLowerCase()))
              .toList();
        });
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.shade200,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.white),
        ),
        hintText:  'Search',
        hintStyle: const TextStyle(fontFamily: 'Classic', fontSize: 15, fontWeight: FontWeight.w400, color: Colors.grey),
        contentPadding: const EdgeInsets.all(20),
        prefixIcon: const Icon(Icons.search, color: Colors.grey),
      ),
    );
  }
}



