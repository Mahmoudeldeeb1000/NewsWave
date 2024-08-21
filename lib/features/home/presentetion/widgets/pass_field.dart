import 'package:flutter/material.dart';
import 'package:news_wave/core/utils/app_color.dart';

class PasswardField extends StatefulWidget {
  final TextEditingController password;

  const PasswardField({super.key, required this.password});
  @override
  State<PasswardField> createState() => _PasswardFieldState();
}

class _PasswardFieldState extends State<PasswardField> {
  bool kk = true;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextFormField(
      keyboardType: TextInputType.number,
      controller: widget.password,
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
          icon: Icon(Icons.remove_red_eye_outlined, color: AppColor.appColor),
          onPressed: () {
            setState(() {});
            kk = !kk;
          },
        ),
      ),
    );
  }
}
