import 'package:flutter/material.dart';

import '../sign_in.dart';
import '../sign_up_screen.dart';
class MainNavBar extends StatefulWidget {
   MainNavBar({super.key});
static const String name='/mainnavbar';
  @override
  State<MainNavBar> createState() => _MainNavBarState();
}
int _n=0;
final List<Widget> _widget=[
  SignUpScreen(),
  Signin(),
  SignUpScreen(),
  Signin(),

];

class _MainNavBarState extends State<MainNavBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widget[_n],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _n,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        onTap: (value) {
          _n=value;
          setState(() {

          });
        },
        items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.category), label: 'Catagory'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
        BottomNavigationBarItem(icon: Icon(Icons.card_giftcard), label: 'Wish'),
      ],

    ));
  }
}
