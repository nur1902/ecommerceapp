import 'package:crafty_bay/paths/assetpaths.dart';
import 'package:crafty_bay/provider/localization_provider.dart';
import 'package:crafty_bay/provider/themeprovider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../extention/localization_extention.dart';
import '../l10n/app_localizations.dart';
import '../widget/text_button.dart';
import 'forget_password.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  static const String name = '/signin';

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  late var height = MediaQuery.of(context).size.height;



void _forgetpassword(){
  //Navigator.pushNamed(context, Forgetpassword.name);
  Navigator.push(context, MaterialPageRoute(builder: (context) => ForgetPassword(),));
}

  @override
  Widget build(BuildContext context) {
  final themeprovider=context.read<Themeprovider>();
    final localizationprovider = context.read<LocalizationProvider>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: SafeArea(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DropdownMenu<Locale>(
                      initialSelection: localizationprovider.local,


                      dropdownMenuEntries: localizationprovider.supportedLocales.map((
                          l,
                          ) {
                        return DropdownMenuEntry<Locale>(
                          value: l,
                          label: l.languageCode.toUpperCase(),
                        );
                      }).toList(),
                      onSelected: (Locale? selectedlocal) {
                        localizationprovider.changeLocale(selectedlocal!);

                      },

                    ),
                    SizedBox(width: 15),
                    DropdownMenu(
                        initialSelection: themeprovider.theme,
                        dropdownMenuEntries: [
                          DropdownMenuEntry(value: ThemeMode.light, label: 'Light'),
                          DropdownMenuEntry(value:  ThemeMode.dark, label: 'Dark'),
                          DropdownMenuEntry(value: ThemeMode.system, label: 'System'),
                        ],
                      onSelected:(value) => themeprovider.changeTheme(value!),


                    ),

                  ],
                ),

                SizedBox(height: 15),




                //SizedBox(height: 15),
                SvgPicture.asset(Assetpaths.logo),
                SizedBox(height: 15),
                Text(
                  context.l10n!.welcome,
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
                Textbutton(onpressed: _forgetpassword, text: 'Forget password'),

                Text(
                  'Please enter Your Email Address',
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(height: 15),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Email Address',
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
