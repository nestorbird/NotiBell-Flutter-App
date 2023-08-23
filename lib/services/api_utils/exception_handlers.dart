import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'app_exception_class.dart';


// Handing All Exceptions here in this class

class ExceptionHandlers {
  getExceptionString(error) {
    // Socket Exception Occurs
    if (error is SocketException) {
       log("Address :: ${error.address!.address}");
      log("Host :: ${error.address!.host}");
      log("Address Type :: ${error.address!.type}");
      log("Message :: ${error.message}");
      log("OS Error Error Code :: ${error.osError!.errorCode}");
      log("OS Error Message :: ${error.osError!.message}");
      log("Port :: ${error.port}");
      return "No internet Connection";
    } else if (error is HttpException) {
      return "HTTP error occured";
    } else if (error is FormatException) {
      return "Invalid Data Format";
    } else if (error is TimeoutException) {
      return "Request timeout";
    } else if (error is BadRequestException) {
      return error.message.toString();
    } else if (error is UnAuthorizedException) {
      return error.message.toString();
    } else if (error is NotFoundException) {
      return error.message.toString();
    } else if (error is FetchDataException) {
      return error.message.toString();
    } else {
      return "Unknown error occured.";
    }
  }
}
