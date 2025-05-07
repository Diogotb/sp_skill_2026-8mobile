import 'dart:convert';

import 'package:cine_findr/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/User.dart';
import '../theme/app_colors.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  bool _passwordVisible = false;
  UserController userController = UserController();
  TextEditingController nomeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  TextEditingController confirmarSenhaController = TextEditingController();


  Future<User> register(String nome, String email, String senha) async {
    final response = await http.post(
      Uri.parse('http://localhost:3000/users'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'nome': nome,
        'email': email,
        'senha': senha,
      }),
    );

    if (response.statusCode == 201) {
      Navigator.pushNamed(context, 'login');
      return User.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Failed to create user.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 25),
            Image.asset('assets/img/logo.png', height: 160, width: 160),
            SizedBox(height: 50),
            Form(
              child: SizedBox(
                height: 580,
                width: 370,
                child: Column(
                  children: [
                    TextFormField(
                      controller: nomeController,
                      decoration: InputDecoration(labelText: "Nome"),
                    ),
                    SizedBox(height: 60),
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(labelText: "Email"),
                    ),
                    SizedBox(height: 60),
                    TextFormField(
                      controller: senhaController,
                      decoration: InputDecoration(
                        labelText: "Senha",
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                          icon: Icon(
                            _passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                      ),
                      obscureText: !_passwordVisible,
                    ),
                    SizedBox(height: 60),
                    TextFormField(
                      controller: confirmarSenhaController,
                      decoration: InputDecoration(
                        labelText: "Confirmar Senha",
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                          icon: Icon(
                            _passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                      ),
                      obscureText: !_passwordVisible,
                    ),
                    SizedBox(height: 70),
                    SizedBox(
                      height: 80,
                      width: 220,
                      child: ElevatedButton(
                        onPressed: () async {
                          String nome = nomeController.text;
                          String email = emailController.text;
                          String senha = senhaController.text;
                          register(nome, email, senha);
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          backgroundColor: Theme.of(context).primaryColor,
                          elevation: 20,
                        ),
                        child: Text(
                          "Cadastrar",
                          style: TextStyle(
                            color: AppColors.textLight,
                            fontSize: 36,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: Text(
                "Já tem uma conta? Faça login",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
