import 'package:crafty_bay/Screens/Main/main_nav_bar.dart';
import 'package:crafty_bay/Screens/home_screen.dart';
import 'package:crafty_bay/Screens/sign_up_screen.dart';
import 'package:crafty_bay/Screens/sign_in.dart';
import 'package:crafty_bay/paths/assetpaths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String name='/splashscreen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}




class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(seconds: 2),(){
      Navigator.pushReplacementNamed(context, MainNavBar.name);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Expanded(child: SvgPicture.asset(Assetpaths.logo,height: 130, width: 130)),
          ),
          CircularProgressIndicator(),
        ],
      )

    );
  }
}
