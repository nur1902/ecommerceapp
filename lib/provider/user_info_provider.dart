import 'dart:convert';

import 'package:crafty_bay/features/CacheStore/is_sign_in.dart';
import 'package:crafty_bay/paths/ApiPaths.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserInfoProvider extends ChangeNotifier {
  String? name;
  String? email;
  String? phone;
  String? photo;

  Future<void> getUserdata() async {
    try {
      String loginEmail = await IsSignIn.isLoggedIn();

      if (loginEmail == 'getout' ) {
        return;
      }

      final response = await http.get(
        Uri.parse(
          '${Apipaths.baseurl}?email=$loginEmail',
        ),
      );

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);

        if (data.isNotEmpty) {
          Map<String, dynamic> user = data.first;

          name = user['name']?.toString() ?? "N/A";
          email = user['email']?.toString() ?? "N/A";
          phone = user['phone']?.toString() ?? "";
          photo = user['photo']?.toString() ?? "";

          notifyListeners();
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}