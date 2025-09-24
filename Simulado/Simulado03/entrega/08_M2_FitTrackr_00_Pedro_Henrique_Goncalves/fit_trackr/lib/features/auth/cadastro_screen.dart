import 'package:fit_trackr/presentation/widgets/custom_button.dart';
import 'package:fit_trackr/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  void register() async {
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    final confirmPassword = _confirmPasswordController.text.trim();

    if (name.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Preencha todos os campos")),
      );
      return;
    }

    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("As senhas não coincidem")),
      );
      return;
    }

    // TODO: modulo 3, por enqt só prossegue para dashbaord
    Navigator.pushReplacementNamed(context, '/dashboard');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/logo.png"),
            const SizedBox(height: 24),
            Text(
              "Crie sua conta",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 48),
            CustomTextFormField(controller: _nameController, label: "Nome"),
            const SizedBox(height: 24),
            CustomTextFormField(controller: _emailController, label: "Email"),
            const SizedBox(height: 24),
            CustomTextFormField(controller: _passwordController, label: "Senha"),
            const SizedBox(height: 24),
            CustomTextFormField(controller: _confirmPasswordController, label: "Confirmar Senha"),
            const SizedBox(height: 48),
            CustomButton(onPressed: register, label: "Cadastrar"),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Já tem uma conta? Faça login"),
            ),
          ],
        ),
      ),
    );
  }
}
