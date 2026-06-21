import 'dart:async';

import 'package:crafty_bay/widget/text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pinput/pinput.dart';

import '../paths/assetpaths.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  static const String name = '/forgetpassword';

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final TextEditingController otpController = TextEditingController();

  @override
  void dispose() {
    otpController.dispose();
    _timer!.cancel();

    super.dispose();
  }


  @override
  void initState() {
    // TODO: implement initState
    _startTimer();
    super.initState();
  }
  Timer ? _timer;
  int _start=30;
  bool _isResend=false;
  void _startTimer(){
    _start=30;
    _isResend=false;
    _timer=Timer.periodic(const Duration(seconds: 1), (timer) {
      if(_start==0){
        setState(() {
          _timer!.cancel();
          _isResend=true;
        });
      }else{
        setState(() {
          _start--;
        });
      }
      setState(() {

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 55,

      height: 55,

      textStyle: const TextStyle(
        fontSize: 20,

        fontWeight: FontWeight.w600,

        color: Colors.black,
      ),

      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),

        borderRadius: BorderRadius.circular(12),

      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        border: Border.all(color: Colors.blue, width: 2),
      ),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: Colors.grey.shade200,
      ),
    );

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),

        child: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
             // mainAxisAlignment: MainAxisAlignment.center,

              children: [
                SizedBox(height: 100),
                SvgPicture.asset(Assetpaths.logo),
                SizedBox(height: 20,),
                const Text(
                  "Enter OTP Code",
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
                const Text(
                  "A 4 Digit OTP has been sent",
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                ),
                const SizedBox(height: 30),
                Pinput(
                  length: 4,

                  controller: otpController,
                  defaultPinTheme: defaultPinTheme,
                  focusedPinTheme: focusedPinTheme,
                  submittedPinTheme: submittedPinTheme,
                  keyboardType: TextInputType.number,
                  showCursor: true,

                  onCompleted: (pin) {
                    debugPrint("OTP : $pin");
                  },
                ),
                const SizedBox(height: 30),
                Textbutton(onpressed: _forgetpassword, text: "Verify"),
                RichText(
                  text: TextSpan()
                ),

                if(_isResend)
                  InkWell(
                    onTap: _startTimer,
                    child: Text(
                      "Resend Code",
                      style: TextStyle(fontSize: 17, color: Colors.greenAccent),
                    ),
                  ),

                Text(
                  "You can resend Code after ${_start} second",
                  style:  TextStyle(fontSize: 17, color: Colors.grey),
                ),




              ],
            ),
          ),
        ),
      ),
    );
  }

  void _forgetpassword(){

    String otp = otpController.text;

    if (otp.length == 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("OTP Verified")),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Enter valid OTP")),
      );
    }

  }
}
