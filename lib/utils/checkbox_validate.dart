bool validateUppercase(String password){
  
  RegExp regExp = RegExp(r'[A-Z]+');
  bool match = regExp.hasMatch(password);
  return match;
                  
}

bool validateLowercase(String password){
  
  RegExp regExp = RegExp(r'[a-z]+');
  bool match = regExp.hasMatch(password);

  return match;

}

bool validateCharacter(String password){
  
  RegExp regExp = RegExp(r'[^A-Za-z0-9]');
  bool match = regExp.hasMatch(password);

  return match;

}

bool validateLenght(String password){
 
  RegExp regExp = RegExp(r'\w[^]{7,15}');
  bool match = regExp.hasMatch(password);

  return match;

}