import 'package:crafty_bay/Screens/Main/main_nav_bar.dart';
import 'package:crafty_bay/Screens/login_screen.dart';
import 'package:crafty_bay/features/CacheStore/is_sign_in.dart';
import 'package:crafty_bay/features/home/presentation/screens/home_screen.dart';
import 'package:crafty_bay/provider/user_info_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({super.key});

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {

  Future<void> logOut() async {

 showDialog(context: context, builder: (context) {
   return AlertDialog(

     content: Text("You are logging out...."),
     actions: [

       TextButton(onPressed:(){
         Navigator.pop(context);
       } , child: Text("Cancel")),
       TextButton(onPressed:() async {
         await IsSignIn.clearLoginInfo();

         if (!mounted) return;

         Navigator.push(
           context,
           MaterialPageRoute(builder: (_) => HomeScreen()),

         );
       } , child: Text("Procede")),


     ],
   );
 },);

  }

  Future<void> checkLoginStatus() async {
    final loggedIn = await IsSignIn.isLoggedIn();

    if (loggedIn=='getout') {
      print("Hellllllllllllllllllllllllllllllllllllll000000000000000000");
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => MainNavBar(),), (route) => false,);
    }

  }

  @override
  void initState() {
    super.initState();

    checkLoginStatus();
    context.read<UserInfoProvider>().getUserdata();

    WidgetsBinding.instance.addPostFrameCallback((_) {
    });


  }

  @override
  Widget build(BuildContext context) {



    return Consumer<UserInfoProvider>(
       builder: (BuildContext context, provider, Widget? child) {
         return Scaffold(
         appBar: AppBar(
           title: const Text("User Info"),
         ),

         body: Center(
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [

               if (provider.photo != null &&
                   provider.photo!.isNotEmpty)

                 CircleAvatar(
                   radius: 70,
                   backgroundImage:
                   NetworkImage(provider.photo!),
                 )
               else
                 const CircleAvatar(
                   radius: 70,
                   child: Icon(Icons.person, size: 70),
                 ),

               const SizedBox(height: 20),

               Text(
                 "Name : ${provider.name ?? ""}",
                 style: const TextStyle(fontSize: 18),
               ),

               const SizedBox(height: 10),

               Text(
                 "Email : ${provider.email ?? ""}",
                 style: const TextStyle(fontSize: 18),
               ),

               const SizedBox(height: 30),

               ElevatedButton(
                 onPressed: logOut,
                 child: const Text("Log Out"),
               ),
             ],
           ),
         ),
       );  },
    );


  }
}