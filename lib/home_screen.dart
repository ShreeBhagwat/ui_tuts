import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:ui_tuts/settings_page.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _scrollController.animateTo(50 * 10,
    //     duration: Duration(seconds: 1), curve: Curves.easeIn);
  }

  String name = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Tuts'),
        actions: [
          // IconButton(onPressed: () {}, icon: Icon(Icons.more)),
          // DropdownButton(items: items, onChanged: onChanged)
          PopupMenuButton(itemBuilder: (context) {
            return [
              const PopupMenuItem(
                child: Text('Settings'),
                value: 'settings',
              ),
              PopupMenuItem(
                child: Text('Logout'),
                value: 'logout',
              ),
            ];
          }, onSelected: (value) async {
            switch (value) {
              case 'settings':
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => SettingsPage()));

              case 'logout':
                print('Logout button pressed');
            }
          })
        ],
      ),
      body: ListView.builder(
          scrollDirection: Axis.vertical,
          controller: _scrollController,
          itemCount: 50,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: 10,
                    ),
                    // width: 50,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          'sjdhbf,jdshb,dhjfbs,khjfbs,kfhbsd,kjfhbskjfbskjhfbs,hfjbshfkjsb kjn vsk,d ,ksd vksvsdkjhv s,dh s,dmfnbs fkhjs fmnsd f,s'),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
