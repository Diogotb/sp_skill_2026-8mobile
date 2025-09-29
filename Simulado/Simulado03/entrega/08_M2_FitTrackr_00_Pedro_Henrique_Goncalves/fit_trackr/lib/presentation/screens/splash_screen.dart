import 'package:fit_trackr/auth/auth_provider.dart';
import 'package:fit_trackr/auth/services/auth_service.dart';
import 'package:fit_trackr/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../auth/models/user_model.dart';
import '../../services/user_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _userService =  UserService();

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  void _checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString("user_id");
    bool isLoggedIn = false;

    if (userId != null) {
      final user = await _userService.getUserById(userId);
      Provider.of<AuthProvider>(context, listen: false).login(user);
      isLoggedIn = true;
    }

    await Future.delayed(const Duration(seconds: 2));

    if (mounted) {
      if (isLoggedIn) {
        Navigator.of(context).pushReplacementNamed("/dashboard");
      } else {
        Navigator.of(context).pushReplacementNamed("/login");
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator(),),
    );
  }
}
