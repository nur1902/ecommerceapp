import 'package:crafty_bay/Screens/Main/main_nav_bar.dart';
import 'package:crafty_bay/Screens/sign_up_screen.dart';
import 'package:crafty_bay/Screens/sign_in.dart';
import 'package:flutter/material.dart';


import '../Screens/forget_password.dart';
import '../Screens/sign_in.dart';
import '../Screens/splash_screen.dart';

class Routes {
   static Route<dynamic>  onGenerateRoute( RouteSettings settings) {
    Widget widget=SizedBox();
     switch(settings.name){
       case SplashScreen.name:
         widget=SplashScreen();
       // case HomeScreen.name:
       //   widget=HomeScreen();
       case SignUpScreen.name:
         widget=SignUpScreen();
       case Signin.name:
         widget=Signin();

       case ForgetPassword.name:
         widget=ForgetPassword();

       case MainNavBar.name:
         widget=MainNavBar();



     }
     return MaterialPageRoute(builder: (context) => widget);
   }

}