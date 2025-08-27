import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/providers/user_provider.dart';
import 'package:todo_list/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final _userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      body: Column(children: [
        ElevatedButton(onPressed: () {
          _userProvider.register("pedibr5@gmail.com", "Pedro123");
          Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
        }, child: Text("Registrar")),

        ElevatedButton(onPressed: () {
          _userProvider.signIn("pedibr5@gmail.com", "Pedro123");
          Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
        }, child: Text("login")),
      ],),
    );
  }
}
