class AppException implements Exception {
  final message;
  final index;

  AppException(this.message, this.index) {
    String showerror() {
      return '$index$message';
    }
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message, ' Error during communication');
}

class InvalidDetails extends AppException {
  InvalidDetails([String? message]) : super(message, 'Invalid Request');
}

class UnauthorizedException extends AppException {
  UnauthorizedException([String? message])
      : super(message, 'Unauthorized request');
}

class InvalidDataException extends AppException {
  InvalidDataException([String? message]) : super(message, 'Invalid request');
}
