import 'package:flutter/material.dart';
import 'package:share_preferance_demo/home_page.dart';
import 'package:sizer/sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController EmailController = TextEditingController();
  TextEditingController  paaswordController = TextEditingController();

  var ishiddenpassword= true;
  final _formkey=GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Container(
              height: 97.h,
              width:100.w,
              color: Colors.red,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 60.h,
                    width: 80.w,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Column(
                      children: [
                        CircleAvatar(
                          maxRadius: 50,
                          backgroundColor: Colors.black12,
                          child: Icon(Icons.person,size: 100,color: Colors.white,),
                        ),
                        SizedBox(height: 2.h,),

                        TextFormField(
                          controller: EmailController,
                          validator: (val){
                            if(val!.isEmpty){
                              return "enter email or phone ";
                            }
                            else if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(val!)){
                              return "enter valid email";
                            }
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.red,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            hintText: "Enter Email Address",
                            labelText: "Enter Email Address",
                            labelStyle: TextStyle(color: Colors.white),
                          ),
                        ),

                        SizedBox(height: 2.h,),

                        TextFormField(
                          obscureText: ishiddenpassword,
                          controller: paaswordController,
                          validator: (val){
                            if(val!.isEmpty){
                              return "enter pass";
                            }
                            else if(val.length<=1){
                              return "enter 10 character";
                            }
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.red,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            hintText: "Password",
                            labelText: "Password",
                            labelStyle: TextStyle(color: Colors.white),
                            suffixIcon: IconButton(
                                icon: Icon(ishiddenpassword?Icons.lock:Icons.remove_red_eye,color: Colors.white,),
                              onPressed: (){
                                  ishiddenpassword=!ishiddenpassword;
                                  setState(() {

                                  });
                              },
                            ),
                          ),
                        ),

                        SizedBox(height: 1.h,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("Forget password?",style: TextStyle(color: Colors.white),),
                          ],
                        ),

                        SizedBox(height: 3.h,),

                        GestureDetector(
                          onTap: ()async{
                            if(_formkey.currentState!.validate()){
                              print("Done");
                              final prefs = await SharedPreferences.getInstance();
                              prefs.setBool("name", true);
                              print("${prefs.getBool("name").toString()}");
                              // Navigator.push(context,MaterialPageRoute(builder: (context)=>HomePage()));
                              Get.to(HomePage());
                            }
                          },
                          child: Container(
                            height: 7.h,
                            width: 70.w,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(child: Text("LOGIN",style: TextStyle(color: Colors.white),)),
                          ),
                        )

                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
