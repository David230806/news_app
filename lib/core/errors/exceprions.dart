class BaseException {
  final String message;

  BaseException(this.message);

  @override
  String toString() => "Base: $message";
}

class InvalidInputException extends BaseException {
  InvalidInputException(super.message);

  @override
  String toString() => "InvalidInputException: $message";
}

class UnknownException extends BaseException {
  UnknownException(super.message);

  @override
  String toString() => "Unkown: $message";
}

class RequestException extends BaseException {
  RequestException(super.message);

  @override
  String toString() => "RequestException: $message";
}
