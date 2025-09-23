import 'package:criptografia/criptografia.dart';
import 'package:test/test.dart';

void main() {
  group('Caesar Cipher Encoding', () {
    test('Simple uppercase shift', () {
      expect(caesarEncode("ABC", 3), equals("DEF"));
    });

    test('Uppercase wraparound', () {
      expect(caesarEncode("XYZ", 3), equals("ABC"));
    });

    test('Lowercase shift', () {
      expect(caesarEncode("abc", 3), equals("def"));
    });

    test('Lowercase wraparound', () {
      expect(caesarEncode("xyz", 3), equals("abc"));
    });

    test('Mixed case word', () {
      expect(caesarEncode("Zebra", 2), equals("Bgdtc"));
    });

    test('Keeps punctuation unchanged', () {
      expect(caesarEncode("Hello, World!", 5), equals("Mjqqt, Btwqi!"));
    });

    test('Keeps numbers unchanged', () {
      expect(caesarEncode("Shift123", 1), equals("Tijgu123"));
    });

    test('Full rotation returns same text (26)', () {
      expect(caesarEncode("CaesarCipher", 26), equals("CaesarCipher"));
    });

    test('Double full rotation returns same text (52)', () {
      expect(caesarEncode("WrapTest", 52), equals("WrapTest"));
    });

    test('Special characters should be the same', () {
      expect(caesarEncode("#!@\$\$", 22), equals("#!@\$\$"));
    });

    test('Special characters should be the same 2', () {
      expect(caesarEncode("abfdE23S&^%", 22), equals("wxbzA23O&^%"));
    });
  });
}
