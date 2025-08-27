import 'dart:io';
import 'dart:math';

void main(){
  mainTest();
  do {
    print("Digite um número: ");
    final String? input = stdin.readLineSync();
    int? numero = 0;

    if (input!.isNotEmpty) {
      numero = int.tryParse(input);
    }

    if (checkIfArmstrong(numero!)) {
      print("O número $numero é um número de armstrong");
    } else {
      print("O número $numero não é um número de armstrong");
    }
  }while(true);
}

void mainTest(){
  int cont = 0;
  do{
    print("[$cont] é um número de armstrong? ${checkIfArmstrong(cont)}");
    cont++;
  }while(cont <= 10000);
}

bool checkIfArmstrong(int numero){
  List lista = numero.toString().split("");
  num soma = 0;

  lista.forEach((value) {
    soma += pow(num.parse(value), lista.length);
    },);

    return soma == numero;
}

