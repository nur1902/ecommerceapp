import 'package:flutter/material.dart';
class Textbutton extends StatelessWidget {

  const Textbutton({
    super.key,required this.onpressed, required this.text
  });
  final VoidCallback onpressed;

  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.cyan,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),

          ),

          onPressed: (){
            onpressed();

          }, child: Text('${text}',style: TextStyle(fontSize: 25),)),
    );
  }
}
