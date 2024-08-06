import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_wave/core/utils/app_color.dart';
import 'package:news_wave/core/utils/app_images.dart';
import 'package:news_wave/features/profile/views/profile_screen.dart';
import 'package:news_wave/features/sign_up/views/sign_up_screen.dart';
import 'package:news_wave/features/splash/views/splash_screen.dart';
class HomeBody extends StatefulWidget {
   HomeBody ({super.key, });
  @override
  State<HomeBody> createState() => _HomeBodyState();
}
class _HomeBodyState extends State<HomeBody> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController username = TextEditingController();
  bool checkBoxValue =false;
  TextEditingController password = TextEditingController();
  bool kk = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
         decoration: BoxDecoration(
           color: Colors.white,
           borderRadius: BorderRadius.only(topLeft: Radius.circular(80)),
         ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30,),
            Center(
                child: Text("Login",style: TextStyle(color: AppColor.appColor,fontSize: 20,fontWeight: FontWeight.bold),)
            ),
            SizedBox(height: 50,),
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Row(
                children: [
                  Text("Username"),
                  Text("*",style:TextStyle(color: Colors.red) ,),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0,right: 25),
              child: TextFormField(
                controller: username,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                   return "plese enter Username";

                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderSide: BorderSide(color:Colors.black),
                  borderRadius: BorderRadius.circular(10)),

                ),
              ),
            ),
            SizedBox(height: 30,),

            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Row(
                children: [
                  Text("password"),
                  Text("*",style:TextStyle(color: Colors.red) ,),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0,right: 25),
              child: TextFormField(

                keyboardType: TextInputType.number,
                onChanged: (value) {
                  print(value);
                },
                controller: password,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "plese enter password";
                  }
                  return null;
                },
                obscureText: kk,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderSide: BorderSide(color:Colors.black),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  suffixIcon:
                  IconButton(icon: Icon(Icons.remove_red_eye_outlined,
                      color:AppColor.appColor ),
                    onPressed: () {
                      setState((){

                      });
                      kk = !kk;
                    },
                  ) ,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0,right: 25),
              child: Row(
                children: [
                  Checkbox(
                      value: checkBoxValue,
                      onChanged: (  vv) {
                        setState(() {
                          checkBoxValue = vv! ;
                        });
                      }
                  ),
                  Text("Remember me "),
                  Spacer(),
                  TextButton(
                      onPressed: (){},
                      child: Text("Forgot the password?",style: TextStyle(color: AppColor.appColor),)
                  ),
              ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColor.appColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                margin: EdgeInsets.only(top: 20),
                width: double.infinity,
                height: 60,
                child: MaterialButton(
                  onPressed: (){
                    setState((){
                      if (_formKey.currentState!.validate()){
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return ProfileScreen();
                        },));
                      }
                    });
                  },
                  child: Text("Login",
                      style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)
                  ),
                ),
              ),
            ),
            Center(
              child: Text("or continue with",style:
              TextStyle(
                fontSize: 20,

              ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0,right: 25),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Color(0xffEEF1F4),
                    ),
                    width: 120,
                    height: 40,
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Image.asset(AppImages.facebook),
                        Text("Facebook",style: TextStyle(color: Colors.black),)
                      ],
                    ),
                  ),
                  Spacer(),
                  Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Color(0xffEEF1F4),
                    ),
                    width: 120.w,
                    height: 40.h,
                    alignment: Alignment.centerRight,
                    child: Row(
                      children: [
                        Image.asset(AppImages.google),
                        Text("Google",
                          style: GoogleFonts.abel(color: Colors.black,fontSize: 18.sp),)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                SizedBox( width: 75.w,),
                Text("don't have any account?",
                    style: TextStyle(color: Colors.black)),
                TextButton(onPressed: (){
                  setState((){
                    if (_formKey.currentState!.validate()){
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context){
                          return SignUpScreen();
                        }
                        ),
                      );
                    }
                  }
                  );
                },
                    child: Text("Sign up?",
                      style:TextStyle( color: AppColor.appColor ) ,)
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}