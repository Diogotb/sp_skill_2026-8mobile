class CPFValidator {
  static bool isValid(String cpf) {
    if (RegExp(r'[a-z][A-Z]').hasMatch(cpf)) return false;

    cpf = cpf.replaceAll(RegExp(r'\D'), '');

    if (cpf.length != 11) return false;

    if (RegExp(r'^(\d)\1*$').hasMatch(cpf)) return false;

    final digits = cpf.split('').map(int.parse).toList();

    int sum1 = 0;
    for (int i = 0; i < 9; i++) {
      sum1 += digits[i] * (10 - i);
    }

    int mod1 = sum1 % 11;
    int expectedDigit1 = (mod1 < 2) ? 0 : 11 - mod1;

    if (digits[9] != expectedDigit1) return false;

    int sum2 = 0;
    for (int i = 0; i < 10; i++) {
      sum2 += digits[i] * (11 - i);
    }

    int mod2 = sum2 % 11;
    int expectedDigit2 = (mod2 < 2) ? 0 : 11 - mod2;

    if (digits[10] != expectedDigit2) return false;

    return true;
  }
}
