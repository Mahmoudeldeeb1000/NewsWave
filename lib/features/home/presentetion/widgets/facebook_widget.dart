import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class FacebookWidget extends StatelessWidget {
  const FacebookWidget({super.key, required this.image, required this.text});
  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Color(0xffEEF1F4),
      ),
      width: 120.w,
      height: 40.h,
      alignment: Alignment.centerRight,
      child: Row(
        children: [
          Image.asset(image),
          Text(
            text,
            style: GoogleFonts.abel(color: Colors.black, fontSize: 18.sp),
          )
        ],
      ),
    );
  }
}
