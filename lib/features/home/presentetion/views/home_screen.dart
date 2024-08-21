import 'package:flutter/material.dart';
import 'package:news_wave/core/utils/app_color.dart';
import 'package:news_wave/core/utils/app_images.dart';

import '../widgets/home_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appColor,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
            ),
          ),
          SliverToBoxAdapter(
            child: Image.asset(
              AppImages.logo,
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          ),
          const SliverToBoxAdapter(
            child: HomeBody(),
          ),
        ],
      ),
    );
  }
}
