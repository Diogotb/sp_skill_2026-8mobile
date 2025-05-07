import 'package:cine_findr/controller/user_controller.dart';
import 'package:cine_findr/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  bool _passwordVisible = false;

  void login(String email, password) async {
    if((email.isNotEmpty)||(password.isNotEmpty)){

    final response = await http.get(
      Uri.parse('http://localhost:3000/users?email=$email&password=$password'),
    );

    if(response.statusCode == 200){
      await Navigator.pushNamed(context, '/');
    }
    }
    print("Usuário não encontrado");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 150),
            Image.asset('assets/img/logo.png', height: 225, width: 225),
            SizedBox(height: 50),
            Form(
              child: SizedBox(
                height: 370,
                width: 370,
                child: Column(
                  children: [
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

                    SizedBox(height: 70),
                    SizedBox(
                      height: 80,
                      width: 220,
                      child: ElevatedButton(
                        onPressed: () async {
                          UserController userController = UserController();
                          String email = emailController.text;
                          String senha = senhaController.text;

                          login(email, senha);
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          backgroundColor: Theme.of(context).primaryColor,
                          elevation: 20,
                        ),
                        child: Text(
                          "Entrar",
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
              onPressed:() {},
              child: Text(
                "Esqueceu a senha?",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            SizedBox(height: 24),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/cadastro');
              },
              child: Text(
                "Não possui uma conta? Cadastre-se",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
