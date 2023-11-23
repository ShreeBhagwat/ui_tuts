import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:ui_tuts/home_screen.dart';
import 'package:ui_tuts/login_bottom.dart';
import 'package:ui_tuts/settings_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailTextEditingController =
      TextEditingController();
  final TextEditingController passwordTextEditingController =
      TextEditingController();
  final TextEditingController confirmPasswordTextEditingController =
      TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            CustomTextField(
                labelText: 'Email',
                hintText: 'Enter Email Address',
                isPassword: false,
                validator: (value) => ValidatorFunctions().validateEmail(value),
                prefixIcon: Icons.email,
                controller: emailTextEditingController),
            CustomTextField(
                labelText: 'Password',
                hintText: 'Enter Password',
                isPassword: true,
                prefixIcon: Icons.lock,
                validator: (value) => ValidatorFunctions().validatePassword(
                    value, confirmPasswordTextEditingController.text),
                controller: passwordTextEditingController),
            CustomTextField(
                labelText: 'Confirm Password',
                hintText: 'Enter Password Again',
                validator: (value) => ValidatorFunctions().validatePassword(
                    value, passwordTextEditingController.text),
                isPassword: true,
                prefixIcon: Icons.lock,
                controller: confirmPasswordTextEditingController),
            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => HomeScreen(),
                      ),
                    );
                  } else {}
                },
                child: Text('Login')),
          ],
        ),
      ),
      
    );
  }
}

class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {super.key,
      required this.labelText,
      required this.hintText,
      required this.isPassword,
      required this.prefixIcon,
      this.validator,
      required this.controller,
      this.fontSize = 16});

  final String labelText;
  final String hintText;
  final bool isPassword;
  final IconData prefixIcon;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final double? fontSize;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        onChanged: (value) {
          log(value);
        },
        obscuringCharacter: '@',
        style: TextStyle(color: Colors.black, fontSize: widget.fontSize),
        controller: widget.controller,
        obscureText: showPassword,
        keyboardType: widget.isPassword
            ? TextInputType.visiblePassword
            : TextInputType.emailAddress,
        validator: widget.validator,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: const TextStyle(color: Colors.blue),
          label: Text(widget.labelText),
          alignLabelWithHint: false,
          // contentPadding: EdgeInsets.only(left: 40),
          // labelText: 'Password',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.blue, width: 2),
          ),
          labelStyle: const TextStyle(color: Colors.blue),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.blue, width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.green, width: 1),
          ),

          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.red, width: 2),
          ),
          prefixIcon: Icon(
            widget.prefixIcon,
            color: Colors.blue,
          ),

          suffixIcon: widget.isPassword
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                  icon: Icon(
                    showPassword ? Icons.visibility_off : Icons.visibility,
                    color: Colors.blue,
                  ),
                )
              : null,
        ),
      ),
    );
  }
}

class ValidatorFunctions {
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    } else {
      return null;
    }
  }

  String? validatePassword(String? value1, String? value2) {
    if (value1 == null || value1.isEmpty) {
      return 'Password is required';
    } else if (value2 == null || value2.isEmpty) {
      return 'Confirm Password is required';
    } else if (value1 != value2) {
      return 'Password and Confirm Password must be same';
    } else {
      return null;
    }
  }
}
