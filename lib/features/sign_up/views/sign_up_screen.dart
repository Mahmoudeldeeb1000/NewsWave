import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_wave/core/utils/app_color.dart';
import 'package:news_wave/core/utils/app_images.dart';
import 'package:news_wave/features/home/widgets/home_body.dart';
import 'package:news_wave/features/sign_up/widgets/sign_up_body.dart';
class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appColor,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(height: 50,),
          ),
          SliverToBoxAdapter(
            child: Image.asset(AppImages.logo,
              width: 165,
              height: 128,
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 50,),
          ),
          SliverFillRemaining(
            child:SignUpBody(),
          ),
        ],
      ),
    );
  }
}