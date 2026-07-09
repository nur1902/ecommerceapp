import 'package:crafty_bay/paths/assetpaths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../widget/actionbuttonwidget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(Assetpaths.logo_nav),
        actions: [
          ActionButtonWidget(icons: Icons.person_outline,),
          SizedBox(width: 8,),
          ActionButtonWidget(icons: Icons.call_outlined),
          SizedBox(width: 8,),
          ActionButtonWidget(icons: Icons.notifications_active_outlined)
        ],
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: TextField(

              decoration: InputDecoration(prefixIcon: Icon(Icons.search_rounded),
                fillColor: Colors.grey.shade200,
              filled: true,
              hintText: 'Search',
              hintStyle: TextStyle(color: Colors.grey.shade400),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(10))
              ),

                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(10))


            ),

              ),
            ),
          )
        ],
      ),
    );
  }
}


