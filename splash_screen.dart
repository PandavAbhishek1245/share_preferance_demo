import 'dart:async';

import 'package:flutter/material.dart';
import 'package:share_preferance_demo/home_page.dart';
import 'package:share_preferance_demo/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool? getBoolvalue;

  @override
  void initState() {
    Getvalue();
    Timer(Duration(seconds: 5), () {
     if( getBoolvalue == true) {
      // Navigator.push(context, MaterialPageRoute(builder:(context)=>HomePage()));
       Get.to(HomePage());
     }
     else {
      // Navigator.push(context,MaterialPageRoute(builder: (context)=>LoginPage()));
       Get.to(LoginPage());
    }
    });
    // TODO: implement initState
    super.initState();
  }

  Getvalue()async{
    final prefs = await SharedPreferences.getInstance();
    getBoolvalue = prefs.getBool("name");
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.blue,
    );
  }
}
