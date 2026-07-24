import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CatagoryFrame extends StatelessWidget {
  const CatagoryFrame({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        //boxShadow:[BoxShadow(color: Colors.cyan.shade50)],
        borderRadius: BorderRadius.circular(15)
      ),
      height: 100,
      width: 100,
      child: Column(
        children: [
          Container(
              decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.teal.shade50)],
              borderRadius: BorderRadius.circular(8),
              ),
              child: SizedBox(
                  height: 100,
                  width: 100,
                  child: Icon(Icons.computer_outlined, color: Colors.teal, size: 90, ))),
          Text('Product',style: TextStyle(color: Colors.teal, fontWeight: FontWeight.w600),)
        ],
      ),
    );
  }
}
