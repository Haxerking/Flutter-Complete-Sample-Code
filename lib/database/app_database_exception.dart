// ignore_for_file: prefer_typing_uninitialized_variables

class DataBaseException implements Exception {
  final _message;
  final _prefix;

  DataBaseException([this._message, this._prefix]);

  @override
  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends DataBaseException {
  FetchDataException([message])
      : super(message, "Error During Communication: ");
}

class BadRequestException extends DataBaseException {
  BadRequestException([message]) : super(message, "Invalid Request. Try again. ");
}

class UnknownException extends DataBaseException {
  UnknownException([message]) : super(message, "Unknown Exception. ");
}

class UnauthorisedException extends DataBaseException {
  UnauthorisedException([message]) : super(message, "Unauthorised request. Try again. ");
}

class InvalidInputException extends DataBaseException {
  InvalidInputException([message]) : super(message, "Invalid Input. Try again. ");
}