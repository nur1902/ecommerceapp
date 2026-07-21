import 'package:flutter/material.dart';
class CatagoryList extends StatefulWidget {
  const CatagoryList({super.key});

  @override
  State<CatagoryList> createState() => _CatagoryListState();
}

class _CatagoryListState extends State<CatagoryList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(

        children: [
          ListView.separated(itemBuilder: (context, index) {
            return Container(
              
            );
          }, separatorBuilder: (context, index) {
            return SizedBox(width: 15,);
          }, itemCount: 10)
        ],
      ),
    );
  }
}
