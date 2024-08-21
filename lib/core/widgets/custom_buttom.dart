import 'package:flutter/material.dart';

import '../utils/app_color.dart';

class CustomButtom extends StatefulWidget {
  final Widget navegator;
  final String text;
  const CustomButtom({super.key, required this.navegator, required this.text});

  @override
  State<CustomButtom> createState() => _CustomButtomState();
}

class _CustomButtomState extends State<CustomButtom> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.appColor,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.only(top: 20),
      width: double.infinity,
      height: 60,
      child: MaterialButton(
        onPressed: () {
          setState(() {
            if (_formKey.currentState!.validate()) {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return widget.navegator;
                },
              ));
            }
          });
        },
        child: Text(widget.text,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
