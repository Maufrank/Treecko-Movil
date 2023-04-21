class Validate {
  final String value;

  const Validate(this.value);

  bool isEmail() {
    String pattern =
        r'^[a-zA-Z0-9]+(?:\.[a-zA-Z0-9]+)*@[a-zA-Z0-9]+(?:\.[a-zA-Z0-9]+)*$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value) ? true : false;
  }

  bool isName() {
    String pattern = r"\d+";
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value) ? false : true;
  }

  bool isApellidos() {
    String pattern = r"\d+";
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value) ? false : true;
  }

  bool isCorreo() {
    String pattern = r"\d+";
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value) ? false : true;
  }

  bool isGrupo() {
    String pattern = r"\d+";
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value) ? false : true;
  }

  bool isUsuario() {
    String pattern = r"\d+";
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value) ? false : true;
  }

  bool isPassword() {
    String pattern =
        r'^(?=.*\d)(?=.*[\u0021-\u002b\u003c-\u0040])(?=.*[A-Z])(?=.*[a-z])\S+$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value) ? true : false;
  }
}
