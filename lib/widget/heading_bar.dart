
import 'package:flutter/material.dart';
class HeadingBar extends StatelessWidget {
  final String text;

  const HeadingBar({
    super.key, required this.text
  });



  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('${text}',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          Text("See All",style: TextStyle(fontSize: 15, color: Colors.teal, fontWeight: FontWeight.w500),)
        ],),
    );
  }
}
