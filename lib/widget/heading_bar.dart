
import 'package:flutter/material.dart';
class HeadingBar extends StatelessWidget {
  const HeadingBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('All Categories',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          Text("See All",style: TextStyle(fontSize: 15, color: Colors.lightBlue, fontWeight: FontWeight.w500),)
        ],),
    );
  }
}
