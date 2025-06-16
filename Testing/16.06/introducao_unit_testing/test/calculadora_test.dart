import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:introducao_unit_testing/utils/calculadora.dart';

void main(){

  group('Test Start - Basic operations', (){
    // Adição
    test('Adding two numbers',(){
      expect(Calculadora.somar(2, 3), 5);
    });

    // Subtração
    test('Subtracting two numbers', (){
      expect(Calculadora.subtrair(7, 5), 2);
    });

    test('Subtracting two numbers, A being Negative', (){
      expect(Calculadora.subtrair(-6, 5), -11);
    });

    // Multiplicação
    test('Multiplying two numbers', (){
      expect(Calculadora.multiplicar(5, 6), 30);
    });

    test('Multiplying two numbers, B being Negative', (){
      expect(Calculadora.multiplicar(6, -5), -30);
    });

    // Divisão
    test('Dividing two numbers', () => expect(Calculadora.dividir(5, 2), 2.5));

    test('Dividing two numbers, B being zero', () => expect(Calculadora.dividir(10, 0), null),);
  });

  group('Test Start - Power and Square Root ', () {

    // Potência
    test('A by the power of B', () => expect(Calculadora.potencia(2, 5), 32),);
    test('A by the power of B, B being negative', () => expect(Calculadora.potencia(2, -5), 0.03125),);
    test('A by the power of B, B being a decimal', () => expect(Calculadora.potencia(2, (2/5)), closeTo(1.3195, 0.0001)));

    // Raiz Quadrada
    test('Square Root of 2', () => expect(Calculadora.raizQuadrada(2), closeTo(1.4142, 0.0001)),);
    test('Square root of 4', () => expect(Calculadora.raizQuadrada(4), 2),);
    test('Square root of 625', () => expect(Calculadora.raizQuadrada(625), 25),);
  },);

  group('Test Start - Trigonometry and Logarithm', () {
    // Seno
    test('Sine of 30', () => expect(Calculadora.seno(30), closeTo(0.5, 0.0001)));
    test('Sine of 45', () => expect(Calculadora.seno(45), closeTo(0.7071, 0.0001)));
    test('Sine of 90', () => expect(Calculadora.seno(90), closeTo(1.0, 0.0001)));
    test('Sine of 180', () => expect(Calculadora.seno(180), closeTo(0.0, 0.0001)));
    test('Sine of 270', () => expect(Calculadora.seno(270), closeTo(-1.0, 0.0001)));

    // Cosseno
    test('Cosine of 30', () => expect(Calculadora.cosseno(30), closeTo(0.8660, 0.0001)));
    test('Cosine of 45', () => expect(Calculadora.cosseno(45), closeTo(0.7071, 0.0001)));
    test('Cosine of 90', () => expect(Calculadora.cosseno(90), closeTo(0.0, 0.0001)));
    test('Cosine of 180', () => expect(Calculadora.cosseno(180), closeTo(-1.0, 0.0001)));
    test('Cosine of 270', () => expect(Calculadora.cosseno(270), closeTo(0.0, 0.0001)));

    // Tangente
    test('Tangent of 30', () => expect(Calculadora.tangente(30), closeTo(0.5774, 0.0001)));
    test('Tangent of 45', () => expect(Calculadora.tangente(45), closeTo(1.0, 0.0001)));
    test('Tangent of 90', () {
      final result = Calculadora.tangente(90);
      expect(result!.abs(), greaterThan(1e10));
      // valor absurdo, por conta da precisão não é possível calcular o infinito
    });
    test('Tangent of 180', () => expect(Calculadora.tangente(180), closeTo(0.0, 0.0001)));

    // Secante
    test('Secant of 60', () => expect(Calculadora.secante(60), closeTo(2.0, 0.0001)));
    test('Secant of 90', () => expect(Calculadora.secante(90), closeTo(1 / Calculadora.cosseno(90), 0.0001)));

    // Cossecante
    test('Cosecant of 30', () => expect(Calculadora.cossecante(30), closeTo(2.0, 0.0001)));
    test('Cosecant of 90', () => expect(Calculadora.cossecante(90), closeTo(1.0, 0.0001)));

    // Cotangente
    test('Cotangent of 45', () => expect(Calculadora.cotangente(45), closeTo(1.0, 0.0001)));
    test('Cotangent of 30', () => expect(Calculadora.cotangente(30), closeTo(1.732, 0.0001)));

    // Logarítimo
    test('Logarithm of 10', () => expect(Calculadora.logaritmo(10), closeTo(2.3025, 0.0001)));
    test('Logarithm of 20', () => expect(Calculadora.logaritmo(20), closeTo(2.9957, 0.0001)));
  });

}