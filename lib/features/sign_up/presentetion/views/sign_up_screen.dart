import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_wave/core/utils/app_color.dart';
import 'package:news_wave/core/utils/app_images.dart';
import 'package:news_wave/features/sign_up/presentetion/controller/regester_cubit.dart';
import '../widgets/sign_up_body.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegesterCubit(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.appColor,
        ),
        backgroundColor: AppColor.appColor,
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Image.asset(
                AppImages.logo,
                width: 165,
                height: 128,
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 50,
              ),
            ),
            const SliverFillRemaining(
              child: SignUpBody(),
            ),
          ],
        ),
      ),
    );
  }
}
