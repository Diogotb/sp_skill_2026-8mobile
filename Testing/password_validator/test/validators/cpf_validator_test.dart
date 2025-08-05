import 'package:flutter_test/flutter_test.dart';
import 'package:password_validator/validators/cpf_validator.dart';

void main(){
  group("CpfValidator", () {
    test('valida cpf correto', () => expect(CPFValidator.isValid('47813957830'), true),);
    test('valida cpf correto com pontuação', () => expect(CPFValidator.isValid('478.139.578.30'), true));
    test('rejeita cpf com números iguais', () => expect(CPFValidator.isValid('11111111111'), false));
    test('rejeita cpf com letras', () => expect(CPFValidator.isValid('111111d1111'), false));
    test('rejeita cpf maior que 11', () => expect(CPFValidator.isValid('4788.139.578.30'), false));
    test('rejeita cpf menor que 11', () => expect(CPFValidator.isValid('478.139.5.30'), false));
    test('rejeita cpf inválido', () => expect(CPFValidator.isValid('12345678910'), false));
  },);
}