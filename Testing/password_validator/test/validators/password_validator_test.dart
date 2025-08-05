import 'package:flutter_test/flutter_test.dart';
import 'package:password_validator/validators/password_validator.dart';

void main(){
  group('PasswordValidator', (){
    test("valida senha correta", (){
      expect(PasswordValidator.isValid('Abcdef1!'), true);
    });
    test("rejeita senha com menos de 8 caracteres", (){
      expect(PasswordValidator.isValid('A1b!a'), false);
    });
    test("rejeita senha com mais de 20 caracteres", (){
      expect(PasswordValidator.isValid('A1!a' + 'a' * 20), false);
    });
    test("rejeita senha sem letra maiuscula", (){
      expect(PasswordValidator.isValid('abcdef1!'), false);
    });
    test("rejeita senha sem letra minuscula", (){
      expect(PasswordValidator.isValid('ABCDEF1!'), false);
    });
    test("rejeita senha sem número", (){
      expect(PasswordValidator.isValid('Abcdefg!'), false);
    });
    test("rejeita senha sem símbolo", (){
      expect(PasswordValidator.isValid('Abcdefg1'), false);
    });
    test("rejeita senha com espaço", (){
      expect(PasswordValidator.isValid('Abcd efg1!'), false);
    });
  });
}