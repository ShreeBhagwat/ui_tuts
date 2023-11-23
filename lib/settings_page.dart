import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ui_tuts/login_screen.dart';
import 'package:ui_tuts/student.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({
    super.key,
  });

  bool goTobackScreen = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (Platform.isAndroid) {
          if (goTobackScreen) {
            return true;
          } else {
            return false;
          }
        } else {
          Navigator.pop(context, 'From Settings page');
          return true;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
        ),
        body: GridView.builder(
          itemCount: 50,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return Container(
              width: 300,
              child: Card(
                  child: Center(
                      child: Text(
                          'askjhbfkjdhsfbjhdfbsjhfbsjdhbfsjfbsjhfbsjhfbjshfbsjhfbsjhfbsjhfbkj'))),
            );
          },
        ),
      ),
    );
  }
}
