import 'package:fit_trackr/auth/screens/register_screen.dart';
import 'package:fit_trackr/auth/services/auth_service.dart';
import 'package:fit_trackr/presentation/widgets/custom_button.dart';
import 'package:fit_trackr/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../auth_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _authService = AuthService();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();

  void login() async {
    final email = _emailController.text.trim();
    final senha = _senhaController.text.trim();

    if (email.isEmpty || senha.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Preencha todos os campos"))
      );
      return;
    }
    final user = await _authService.login(email, senha);

    if(user != null){
      Provider.of<AuthProvider>(context, listen: false).login(user);
      Navigator.pushReplacementNamed(context, '/dashboard');
    } else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Ocorreu um erro ao processar o login")));
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsetsGeometry.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/logo.png"),
            const SizedBox(height: 24),
            Text(
              "Entre com sua conta",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 48),
            CustomTextFormField(controller: _emailController, label: "Email"),
            const SizedBox(height: 48),
            CustomTextFormField(controller: _senhaController, label: "Senha"),
            const SizedBox(height: 48),
            CustomButton(onPressed: login, label: "Entrar"),

            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen(),));
              },
              child: Text("Não tem uma conta, Cadastre-se"),
            ),
          ],
        ),
      ),
    );
  }
}
