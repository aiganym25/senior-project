import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:senior_project/pages/profile/profile.dart';
import 'package:senior_project/pages/feed-home/feed.dart';
import 'package:senior_project/pages/providers/user_mv.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Widget> _pages = [
    const FeedPage(),
    const MyProfile(),
  ];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined, size: 30),
              activeIcon:
                  Icon(Icons.home_filled, size: 30, color: Colors.black),
              label: 'Home',
            ),
            BottomNavigationBarItem(
                activeIcon: SvgPicture.asset(
                  'assets/icons/user_tapped.svg',
                  height: 30,
                ),
                icon: SvgPicture.asset(
                  'assets/icons/user.svg',
                  height: 30,
                ),
                label: 'Profile'),
          ],
          currentIndex: _selectedIndex, //New
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
        body: Center(
          child: _pages.elementAt(_selectedIndex),
        ));
  }
}
