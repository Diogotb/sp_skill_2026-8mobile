import 'package:flutter/material.dart';
import 'package:password_validator/validators/cpf_validator.dart';
import 'package:password_validator/validators/password_validator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController cpfController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  String result = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
          ),
        ),
        elevation: 20,
        title: Text("Test Driven Development"),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Validador de senha"),
                  TextField(controller: senhaController),
                  ElevatedButton(onPressed: () {
                    bool valid = PasswordValidator.isValid(senhaController.text);
                    setState(() {
                      result = valid ? "Válido" : "Inválido";
                    });
                  }, child: Text("Validar")),
                  Text(result),
                ],
              ),
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Validador de CPF"),
                  TextField(controller: cpfController),
                  ElevatedButton(onPressed: () {
                    bool valid = CPFValidator.isValid(cpfController.text);
                    setState(() {
                      result = valid ? "Válido" : "Inválido";
                    });
                  }, child: Text("Validar")),
                  Text(result),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
