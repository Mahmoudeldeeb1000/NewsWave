import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:image_picker/image_picker.dart';
import 'package:news_wave/core/utils/app_color.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  XFile? myPhoto;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();

  Future<XFile?> pickImage() async{
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    return image;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Text("Fill your Profile",style: TextStyle(fontWeight: FontWeight.w600,
            fontSize: 16),),
            Center(
              child: GestureDetector(
                onTap: (){
                  pickImage().then((value) {
                    myPhoto = value;
                    setState(() {
                    });
                  });
                },
                child: Stack(
                  children: [Container(
        
                      height: 120,
                      width: 120,
                      child: myPhoto==null? Icon(Icons.add_a_photo,color:Colors.white,size: 40,):
                      ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.file(File(myPhoto!.path), fit: BoxFit.fill,)),
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColor.appColor),
                          borderRadius: BorderRadius.circular(100)
                      ),
                    ),
                    Positioned(
                      right: 0,
                        bottom: 0,
                        child: CircleAvatar(
                          backgroundColor: AppColor.appColor,
                            child: Icon(Icons.camera_alt_outlined)
                        ),
                    )
                  ],
                ),
              ),

            ),

            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Row(
                children: [
                  Text("Full Name"),
                  Text("*",style:TextStyle(color: Colors.red) ,),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0,right: 25),
              child: TextFormField(
                controller: name,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "plese enter your name";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderSide: BorderSide(color:Colors.black),
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Row(
                children: [
                  Text("Email Address"),
                  Text("*",style:TextStyle(color: Colors.red) ,),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0,right: 25),
              child: TextFormField(
                controller: email,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "plese enter Your email";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderSide: BorderSide(color:Colors.black),
                      borderRadius: BorderRadius.circular(10)),

                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Row(
                children: [
                  Text("Phone Number"),
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
                controller: phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "plese enter phone";
                  }
                  return null;
                },

                decoration: InputDecoration(
                  border: OutlineInputBorder(borderSide: BorderSide(color:Colors.black),
                      borderRadius: BorderRadius.circular(10)),


                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: InkWell(
                onTap: (){
                  setState((){
                    if (_formKey.currentState!.validate()){
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context){
                          return Scaffold();
                        }
                        ),
                      );
                    }
                  });

                },
                child: Container(
                  decoration:BoxDecoration(color: AppColor.appColor,
                  borderRadius: BorderRadius.circular(6)
                  ) ,
                  width: double.infinity,
                  height: 40,
                  child: Center(child: Text("Next")),

                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
