import 'dart:math';

class Calculadora {
  // Conversão interna de graus para radianos
  static double _grausParaRadianos(double graus) {
    return graus * pi / 180;
  }

  static double somar(double a, double b) {
    return a + b;
  }

  static double subtrair(double a, double b) {
    return a - b;
  }

  static double multiplicar(double a, double b) {
    return a * b;
  }

  static double? dividir(double a, double b) {
    if (b == 0) return null;
    return a / b;
  }

  static num potencia(double a, double b) {
    return pow(a, b);
  }

  static double raizQuadrada(double a) {
    return sqrt(a);
  }

  static double seno(double graus) {
    return sin(_grausParaRadianos(graus));
  }

  static double cosseno(double graus) {
    return cos(_grausParaRadianos(graus));
  }

  static double tangente(double graus) {
    return tan(_grausParaRadianos(graus));
  }

  static double? secante(double graus) {
    double cosValue = cos(_grausParaRadianos(graus));
    if (cosValue == 0) return null;
    return 1 / cosValue;
  }

  static double? cossecante(double graus) {
    double sinValue = sin(_grausParaRadianos(graus));
    if (sinValue == 0) return null;
    return 1 / sinValue;
  }

  static double? cotangente(double graus) {
    double tanValue = tan(_grausParaRadianos(graus));
    if (tanValue == 0) return null;
    return 1 / tanValue;
  }

  static double logaritmo(double a) {
    return log(a);
  }
}
