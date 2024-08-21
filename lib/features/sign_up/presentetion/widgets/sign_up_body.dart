import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_wave/core/utils/app_color.dart';
import 'package:news_wave/core/utils/app_images.dart';
import 'package:news_wave/features/sign_up/presentetion/controller/regester_cubit.dart';
import 'package:news_wave/features/sign_up/presentetion/controller/regester_states.dart';

import '../../../home/presentetion/views/home_screen.dart';

class SignUpBody extends StatefulWidget {
  const SignUpBody({
    super.key,
  });

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController username = TextEditingController();
    bool checkBoxValue = false;
    TextEditingController password = TextEditingController();
    TextEditingController confirmPassword = TextEditingController();
    bool kk = true;
    return SingleChildScrollView(
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
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
                "SignUp",
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
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: username,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "plese enter Username";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(10)),
                  ),
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
                child: TextFormField(
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
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(10)),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.remove_red_eye_outlined,
                          color: AppColor.appColor),
                      onPressed: () {
                        // setState((){
                        //
                        // });
                        kk = !kk;
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 25.0),
                child: Row(
                  children: [
                    Text("Confirm password"),
                    Text(
                      "*",
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0, right: 25),
                child: TextFormField(
                  onChanged: (value) {
                    print(value);
                  },
                  controller: confirmPassword,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "plese enter password";
                    }
                    {
                      return null;
                    }
                  },
                  obscureText: kk,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(10)),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.remove_red_eye_outlined,
                          color: AppColor.appColor),
                      onPressed: () {
                        setState(() {});
                        kk = !kk;
                      },
                    ),
                  ),
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
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColor.appColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  margin: const EdgeInsets.only(top: 20),
                  width: double.infinity,
                  height: 60,
                  child: BlocConsumer<RegesterCubit, RegesterStates>(
                    listener: (context, state) {
                      if (state is RegesterFailureStates) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(state.errorMessage)));
                      }
                    },
                    builder: (context, state) {
                      return state is RegesterLoadingStates
                          ? const Center(child: CircularProgressIndicator())
                          : MaterialButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  BlocProvider.of<RegesterCubit>(context)
                                      .SignUpWithFireBase(
                                          email: username.text.trim(),
                                          pass: password.text.trim(),
                                          context: context);
                                }
                                // setState((){
                                //   if (_formKey.currentState!.validate()){
                                //     Navigator.push(context, MaterialPageRoute(builder: (context) {
                                //       return ProfileScreen();
                                //     },));
                                //   }
                                // });
                              },
                              child: const Text("SignUp",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                            );
                    },
                  ),
                ),
              ),
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
                    Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: Color(0xffEEF1F4),
                      ),
                      width: 120,
                      height: 40,
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Image.asset(AppImages.facebook),
                          const Text(
                            "Facebook",
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                    ),
                    const Spacer(),
                    Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: Color(0xffEEF1F4),
                      ),
                      width: 120,
                      height: 40,
                      alignment: Alignment.centerRight,
                      child: Row(
                        children: [
                          Image.asset(AppImages.google),
                          const Text(
                            "Google",
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 75,
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
                                return const HomeScreen();
                              }),
                            );
                          }
                        });
                      },
                      child: Text(
                        "Login?",
                        style: TextStyle(color: AppColor.appColor),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
