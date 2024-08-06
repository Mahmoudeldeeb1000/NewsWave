import 'package:flutter/material.dart';
import 'package:news_wave/core/utils/app_color.dart';
import 'package:news_wave/core/utils/app_images.dart';
import '../../home/views/home_screen.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {

    super.initState();
    Future.delayed(const Duration(
        seconds: 3
    ) , ( ) {

      Navigator.push(context, MaterialPageRoute(builder: (C) {
        return HomeScreen();
      } ));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(AppImages.logo,
              width: 186,
              height: 127,

            ),
          ),

        ],
      ),
    );
  }
}
