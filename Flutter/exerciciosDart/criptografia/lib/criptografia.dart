// Cifra de César

String caesarEncode(String input, int key){
  List inputCodes = input.codeUnits;
  List<int> encodedMessage = [];

  for(int digit in inputCodes){
    if(digit >= 65 && digit <= 90){
      digit = ((digit - 65 + key) % 26) + 65;
      encodedMessage.add(digit);
    } else if(digit >= 97 && digit <= 122){
      digit = ((digit - 97 + key) % 26) + 97;
      encodedMessage.add(digit);
    } else{
      encodedMessage.add(digit);
    }
  }

  String cifer = String.fromCharCodes(encodedMessage);
  return cifer;
}