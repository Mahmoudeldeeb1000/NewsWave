import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_wave/core/utils/app_color.dart';
import 'package:news_wave/core/utils/app_images.dart';
import 'package:news_wave/core/widgets/custom_buttom.dart';
import 'package:news_wave/features/home/presentetion/widgets/pass_field.dart';
import 'package:news_wave/features/home/presentetion/widgets/userName_field.dart';

import 'package:news_wave/features/profile/views/profile_screen.dart';

import '../../../sign_up/presentetion/views/sign_up_screen.dart';

import 'facebook_widget.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({
    super.key,
  });
  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  final _formKey = GlobalKey<FormState>();
  bool checkBoxValue = false;
  TextEditingController username = TextEditingController();
  TextEditingController passward = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(80)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            Center(
                child: Text(
              "Login",
              style: TextStyle(
                  color: AppColor.appColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            )),
            const SizedBox(
              height: 50,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: Row(
                children: [
                  Text("Username"),
                  Text(
                    "*",
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 25),
              child: UsernameField(
                username: username,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: Row(
                children: [
                  Text("password"),
                  Text(
                    "*",
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 25),
              child: PasswardField(
                password: passward,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 25),
              child: Row(
                children: [
                  Checkbox(
                      value: checkBoxValue,
                      onChanged: (vv) {
                        setState(() {
                          checkBoxValue = vv!;
                        });
                      }),
                  const Text("Remember me "),
                  const Spacer(),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Forgot the password?",
                        style: TextStyle(color: AppColor.appColor),
                      )),
                ],
              ),
            ),
            const Padding(
                padding: EdgeInsets.all(25.0),
                child: CustomButtom(
                  navegator: ProfileScreen(),
                  text: "Login",
                )),
            const Center(
              child: Text(
                "or continue with",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 25),
              child: Row(
                children: [
                  FacebookWidget(image: AppImages.facebook, text: "FaceBook"),
                  const Spacer(),
                  FacebookWidget(image: AppImages.google, text: "google")
                ],
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: 75.w,
                ),
                const Text("don't have any account?",
                    style: TextStyle(color: Colors.black)),
                TextButton(
                    onPressed: () {
                      setState(() {
                        if (_formKey.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return const SignUpScreen();
                            }),
                          );
                        }
                      });
                    },
                    child: Text(
                      "Sign up?",
                      style: TextStyle(color: AppColor.appColor),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
