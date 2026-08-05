import 'package:crafty_bay/Screens/login_screen.dart';
import 'package:crafty_bay/Screens/sign_in.dart';
import 'package:crafty_bay/Screens/user_info.dart';
import 'package:crafty_bay/paths/assetpaths.dart';
import 'package:crafty_bay/upload_image_screen.dart';
import 'package:crafty_bay/widget/catagory_frame.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../widget/actionbuttonwidget.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../../../widget/heading_bar.dart';
import '../../../../widget/home_carosol_slider.dart';
import '../../../../widget/product_frame.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(height: 80,),
            TextButton(onPressed: (){Navigator.pushNamed(context, Signin.name);}, child: Text("Theme and Language")),
            SizedBox(height: 20,),
            TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder:(context) => UploadImageScreen(),));}, child: Text("Upload Image")),

          ],
        ),
      ),
      appBar: AppBar(
        title: SvgPicture.asset(Assetpaths.logo_nav),
        //automaticallyImplyLeading: false,
        actions: [
          ActionButtonWidget(icons: Icons.person_outline, callback: () {  Navigator.push(context, MaterialPageRoute(builder: (context) => UserInfo(),));},),
          SizedBox(width: 8,),
          ActionButtonWidget(icons: Icons.call_outlined, callback: () {  },),
          SizedBox(width: 8,),
          ActionButtonWidget(icons: Icons.notifications_active_outlined, callback: () {  },)
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 40,
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
              ),
              SizedBox(height: 15,),
              HomeCarosolSlider(),
              SizedBox(height: 15,),
              HeadingBar(text: 'All Categories',),
              SizedBox(height: 15,),
              SizedBox(
                height: 120,

                child: ListView.separated(itemBuilder: (context, index) {
                  return CatagoryFrame();
                }, separatorBuilder: (context, index) => SizedBox(width: 15,), itemCount: 10, scrollDirection: Axis.horizontal,),
              ),
              SizedBox(height: 15,),
              HeadingBar(text: 'Popular',),
              SizedBox(height: 15,),
              SizedBox(
                height: 120,

                child: ListView.separated(itemBuilder: (context, index) {
                  return ProductFrame();
                }, separatorBuilder: (context, index) => SizedBox(width: 15,), itemCount: 10, scrollDirection: Axis.horizontal,),
              ),
              SizedBox(height: 15,),
              HeadingBar(text: 'New',),
              SizedBox(height: 15,),
              SizedBox(
                height: 120,

                child: ListView.separated(itemBuilder: (context, index) {
                  return ProductFrame();
                }, separatorBuilder: (context, index) => SizedBox(width: 15,), itemCount: 10, scrollDirection: Axis.horizontal,),
              ),




            ],
          ),
        ),
      ),
    );
  }
}



