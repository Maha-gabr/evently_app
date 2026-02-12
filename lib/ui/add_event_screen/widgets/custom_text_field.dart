import 'package:flutter/material.dart';
typedef OnChanged =void Function(String)?;
typedef OnValidate = String? Function(String?)?;
class CustomTextField extends StatelessWidget {
  final OnValidate? onValidate;
  final int? maxLines;
  final OnChanged? onChanged;
  final String hintText;
  final TextEditingController? controller;
  const CustomTextField({super.key, required this.hintText, this.controller, this.onChanged, this.onValidate, this.maxLines});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      validator: onValidate,
      controller: controller,
      onChanged:onChanged ,
      decoration: InputDecoration(

      ),
    );
  }
}
