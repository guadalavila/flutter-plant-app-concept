class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  String toString() {
    return "$_prefix $_message";
  }
}

class FetchDataException extends AppException {
  FetchDataException({required String message})
      : super(message, "Lo sentimos, ocurrio un error. ");
}

class BadRequestException extends AppException {
  BadRequestException([message]) : super(message, "Request inválido. ");
}

class UnauthorisedException extends AppException {
  UnauthorisedException([message]) : super(message, "No estás autorizado. ");
}

class InvalidInputException extends AppException {
  InvalidInputException({required String message})
      : super(message, "Input inválido. ");
}
