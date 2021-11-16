import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tracepharm/Screens/homescreen.dart';
import 'package:tracepharm/models/sucess_response.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;

  login(Map<String, String> body, BuildContext context) async {
    _isLoading = true;
    http.Response response = await http.post(
      Uri.parse('http://3.239.56.34:8003/api/auth/login'),
      body: json.encode({'email': body['email'], 'password': body['password']}),
      headers: {'Content-Type': 'application/json'},
    );
    log("88888888888888888888888888888888888888888888888888");
    log(response.statusCode.toString());
    log(response.body);
    log("88888888888888888888888888888888888888888888888888");
    final resData = jsonDecode(response.body);
    if (response.statusCode == 200) {
      final result = AuthSuccessResponse.fromMap(resData);
      SharedPreferences pref = await SharedPreferences.getInstance();

      pref.setString("email", result.email);
      pref.setString("access", result.access);
      pref.setString("firstName", result.firstName);
      pref.setString("lastName", result.lastName);
      pref.setString("id", result.id);
      pref.setString("organizationId", result.organizationId);
      pref.setString("role", result.role);
      pref.setString("contactNumber", result.contactNumber);
      pref.setString("alternateContactNumber", result.alternateContactNumber);

      _isLoggedIn = true;
      _isLoading = false;
      notifyListeners();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (ctx) => const HomeScreen(),
        ),
      );
    }
    _isLoading = false;
    _isLoggedIn = false;
    notifyListeners();
  }
}
