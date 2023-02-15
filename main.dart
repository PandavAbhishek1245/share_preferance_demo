import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_preferance_demo/splash_screen.dart';
import 'package:sizer/sizer.dart';

import 'login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) =>Sizer(builder: ( context,orientation,deviceType){
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
  );
}

