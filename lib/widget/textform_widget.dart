import 'package:flutter/material.dart';
class Textform extends StatelessWidget {


  const Textform({
    super.key, required this.hintext,   required this.controller,  this.prefixicon, this.suffixicon, this.validator
  });
  final String hintext;

  final IconData ?prefixicon;

  final TextEditingController controller;

  final IconData ?suffixicon;

  final FormFieldValidator ?validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      textInputAction: .next,
      decoration: InputDecoration(
         hint: Text('${hintext}',
         style: TextStyle(fontSize: 20, color: Colors.grey),),
        prefixIcon: prefixicon == null ? null : Icon(prefixicon),
        suffixIcon: suffixicon == null ? null : Icon(suffixicon),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),


    );
  }
}