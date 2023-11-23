import 'package:flutter/material.dart';
import 'package:ui_tuts/home_screen.dart';
import 'package:ui_tuts/login_screen.dart';
import 'package:ui_tuts/settings_page.dart';

class LoginBottom extends StatefulWidget {
  const LoginBottom({super.key});

  @override
  State<LoginBottom> createState() => _LoginBottomState();
}

class _LoginBottomState extends State<LoginBottom> {
  int bottomNavBarCurrentIndex = 0;

  final screens = [LoginScreen(), HomeScreen(), SettingsPage()];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(

      length: 3,
      child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.email),
                  text: 'Login',
                ),
                Tab(
                  icon: Icon(Icons.home),
                  text: 'Home',
                ),
                Tab(
                  icon: Icon(Icons.settings),
                  text: 'Settings',
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {
                bottomNavBarCurrentIndex = 2;
              });
            },
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          body: TabBarView(
            
            children: [
              LoginScreen(),
              HomeScreen(),
              SettingsPage(),
            ],
          )
          //   BottomNavigationBar(
          //     type: BottomNavigationBarType.fixed,
          //     currentIndex: bottomNavBarCurrentIndex,
          //     showSelectedLabels: true,
          //     selectedItemColor: Colors.yellow,
          //     showUnselectedLabels: true,
          //     onTap: (index) => setState(() {
          //       bottomNavBarCurrentIndex = index;
          //     }),
          //     items: [
          //       BottomNavigationBarItem(
          //           icon: Icon(
          //             Icons.email,
          //           ),
          //           label: 'Login',
          //           backgroundColor: Colors.red),
          //       BottomNavigationBarItem(
          //           icon: Icon(Icons.home),
          //           label: 'Home',
          //           backgroundColor: Colors.blue),
          //     ],
          //   ),
          ),
    );
  }
}
