class AppException implements Exception {
  final String? message;
  final String? prefix;
  final String? url;

  AppException([this.message, this.prefix, this.url]);
}
// Bad Request 
class BadRequestException extends AppException {
  BadRequestException([String? message, String? url])
      : super( message,'Bad Request', url);
}
// fetch Data Exception
class FetchDataException extends AppException {
  FetchDataException([String? message, String? url])
      : super(message, "Unable to process Request ", url);
}
// Api Not Responding 

class ApiNotRespondingException extends AppException {
  ApiNotRespondingException([String? message, String? url])
      : super(message, "Api Not Responding", url);
}

// Un Autorized Exception

class UnAuthorizedException extends AppException {
  UnAuthorizedException([String? message, String? url])
      : super(message, "Unauthorized Request", url);
}

// Not Found Exception

class NotFoundException extends AppException {
  NotFoundException([String? message, String? url])
      : super(message, "Bad Request",  url);
}
