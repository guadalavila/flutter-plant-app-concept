class Validator {
  static String? validateName({required String? name}) {
    if (name == null) {
      return null;
    }

    if (name.isEmpty) {
      return 'El nombre no puede ser vacío.';
    }

    return null;
  }

  static String? validateLastName({required String? lastName}) {
    if (lastName == null) {
      return null;
    }

    if (lastName.isEmpty) {
      return 'El apellido no puede ser vacío';
    }

    return null;
  }

  static String? validateEmail({required String? email}) {
    if (email == null) {
      return null;
    }

    RegExp emailRegExp = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

    if (email.isEmpty) {
      return 'El email no puede ser vacío';
    } else if (!emailRegExp.hasMatch(email)) {
      return 'Ingresá un email válido';
    }

    return null;
  }

  static String? validatePassword({required String? password}) {
    if (password == null) {
      return null;
    }

    if (password.isEmpty) {
      return 'La contraseña no puede ser vacía';
    } else if (password.length < 6) {
      return 'Ingresá una contraseña con una longitud de al menos 6 carácteres';
    }

    return null;
  }
}
