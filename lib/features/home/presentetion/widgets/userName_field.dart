import 'package:flutter/material.dart';

class UsernameField extends StatelessWidget {
  final TextEditingController username;

  const UsernameField({super.key, required this.username});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
    );
  }
}
