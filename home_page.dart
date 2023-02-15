import 'package:flutter/material.dart';
import 'package:share_preferance_demo/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var _isLight = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title: Center(child: Text("SHARE PREFERANCE")),
     ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 80.h,
              width: 100.w,
              color: Colors.blue,
              child: ListView.separated(
                itemCount: 10,
                itemBuilder: (context,index){
                  return Card(
                   child: ListTile(
                     title: Text("${index}"),
                   ),
                  );
                }, separatorBuilder: (context,index){return SizedBox(height: 1.h,);},),
            ),

            SizedBox(height: 2.h,),
            Center(child: GestureDetector(
              onTap: ()async{
                final prefs = await SharedPreferences.getInstance();
                await prefs.remove("name");
                // Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                Get.to(LoginPage());
              },
                child: Text("LOGOUT",style: TextStyle(fontSize:20,fontWeight: FontWeight.bold),))),



          ],
        ),
      ),
    );
  }
}
