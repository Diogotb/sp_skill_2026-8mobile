class PasswordValidator{
  static bool isUpperCaseValid(String string){
    return RegExp(r'[A-Z]').hasMatch(string);
  }

  static bool isLowerCaseValid(String string){
    return RegExp(r'[a-z]').hasMatch(string);
  }

  static bool hasNumber(String string){
    return RegExp(r'\d').hasMatch(string);
  }

  static bool hasSymbol(String string){
    return RegExp(r'[!@#$%&*()_+=-]').hasMatch(string);
  }

  static bool isValid(String password){
    password = password.trim();
    if (!(password.length >= 8 && password.length <= 20)){
      return false;
    }
    if (!isUpperCaseValid(password)){
      return false;
    }
    if (!isLowerCaseValid(password)){
      return false;
    }
    if (!hasNumber(password)){
      return false;
    }
    if(!hasSymbol(password)){
      return false;
    }
    if(password.contains(" ")){
      return false;
    }
    return true;
  }
}