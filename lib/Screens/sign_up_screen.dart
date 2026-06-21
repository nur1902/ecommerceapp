import 'package:crafty_bay/Screens/sign_in.dart';
import 'package:crafty_bay/paths/assetpaths.dart';
import 'package:crafty_bay/widget/text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widget/headlines.dart';
import '../widget/textform_widget.dart';
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  static const String name = '/signup';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();



}
TextEditingController fnamecontroller= TextEditingController();
TextEditingController lnamecontroller= TextEditingController();
TextEditingController mobilecontroller= TextEditingController();
TextEditingController citycontroller= TextEditingController();
TextEditingController addresscontroller= TextEditingController();
TextEditingController passwordcontroller= TextEditingController();

GlobalKey<FormState> formkey = GlobalKey<FormState>();

class _SignUpScreenState extends State<SignUpScreen> {
  void _signup(){
    if(formkey.currentState!.validate()){
      Navigator.pushReplacementNamed(context, Signin.name);
      print('${fnamecontroller.text} ${lnamecontroller.text} ${mobilecontroller.text} ${citycontroller.text} ${addresscontroller.text}');

    }
  }

  void _signin(){
    Navigator.pushReplacementNamed(context, Signin.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  Headlines(title: 'Sign Up', subtitle: 'get started with us with your details',),
                  Form(
                    key: formkey,
                    child: Column(
                    children: [
                      SizedBox(height: 15,),
                      Textform(hintext: 'First Name',  controller: fnamecontroller, validator: (value) {
                        if(value!.isEmpty){return 'Please enter your firstname';} else return null;
                      },),
                      SizedBox(height: 15,),
                      Textform(hintext: 'Last Name',  controller: lnamecontroller, validator: (value) {
                        if(value!.isEmpty){return 'Please enter your last';} else return null;
                        },),
                      SizedBox(height: 15,),
                      Textform(hintext: 'Mobile',  controller: mobilecontroller, validator: (value) {
                        if(value!.isEmpty){return 'Please enter your Mobile number';} else return null;
                      },),
                      SizedBox(height: 15,),
                      Textform(hintext: 'City',  controller: citycontroller, validator: (value) {
                        if(value!.isEmpty){return 'Please enter your Current city';} else return null;
                      },),
                      SizedBox(height: 15,),
                      Textform(hintext: 'Address',  controller: addresscontroller,suffixicon: Icons.front_hand, validator: (value) {
                        if(value!.isEmpty){return 'Please enter your full address';} else return null;
                      },),
                      SizedBox(height: 15,),
                      Textform(hintext: 'Password',  controller: passwordcontroller,  validator: (value) {
                        if(value.length<6){return 'Password must be atleast 6 characters';} else return null;
                      },),
                      SizedBox(height: 15,),


                      Textbutton(onpressed: _signup, text: 'Sign Up'),

                      SizedBox(height: 15,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Already have an account?'),
                          TextButton(onPressed: (){_signin();}, child: Text('Login'))
                        ]

                      )

        
                    ],
                  ),
        
                  )
                ],
        
              ),
            ),
          ),
        ),
      ),
    );


  }
}




