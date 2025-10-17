import 'package:dating_app/Homepage/homepage.dart';
import 'package:dating_app/searchPage/searchPage.dart';
import 'package:dating_app/user_about/AboutUser.dart';
import 'package:flutter/material.dart';

import '../Profile/profile.dart';

class HomeBar extends StatefulWidget {
  static const route = "/HomeBar";
  const HomeBar({Key? key}) : super(key: key);

  @override
  State<HomeBar> createState() => _HomeBarState();
}

class _HomeBarState extends State<HomeBar> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: [
         HomePage(),
          const SearchPage(),
          const DatingProfilePage(),
        ],
      ),
      bottomNavigationBar:
      Padding(
        padding: const EdgeInsets.only(right: 10.0, left: 10, bottom: 0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: const Color(0xffF26B8A),
          ),
          height: 65,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BottomBarIcon(
                icon: Icons.favorite,
                title: "Home",
                isSelected: currentIndex == 0,
                onTap: () {
                  setState(() {
                    currentIndex = 0;
                  });
                },
              ),
              BottomBarIcon(
                icon: Icons.search,
                title: "Search",
                isSelected: currentIndex == 1,
                onTap: () {
                  setState(() {
                    currentIndex = 1;
                  });
                },
              ),
              BottomBarIcon(
                icon: Icons.person_outlined,
                title: "Profile",
                isSelected: currentIndex == 2,
                onTap: () {
                  setState(() {
                    currentIndex = 2;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomBarIcon extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const BottomBarIcon({
    Key? key,
    required this.icon,
    required this.title,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isSelected ? Colors.white : Colors.black45,
            size: 25,
          ),
          SizedBox(
            height: 2,
          ),
          Text(
            title,
            style: TextStyle(
              color: isSelected ? Colors.white70 : Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w500
            ),
          ),
        ],
      ),
    );
  }
}
