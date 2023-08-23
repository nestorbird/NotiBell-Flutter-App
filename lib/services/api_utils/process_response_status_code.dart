import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../preference_service/storage_helper.dart';
import 'app_exception_class.dart';

dynamic processResponse(http.Response response) {
  switch (response.statusCode) {
    // Success
    case 200:
      var responseJson = jsonDecode(response.body);
      // var responseJson = response;
      _printJSONData(responseJson);

      /// Here Returning String Body for now will change according to Need...
      return responseJson;
    case 201:
      var responseJson = jsonDecode(response.body);
      return responseJson;
    // Bad Request
    case 400:
      throw BadRequestException(jsonDecode(response.body)['message']);

    // UnAuthorizedException exception
    case 401:
      throw UnAuthorizedException(jsonDecode(response.body)['message']);
    // Forbidden
    case 403:
      //Helper.isLoggedIn = false;
      StorageHelper().clearDetails();

      throw UnAuthorizedException(response.reasonPhrase!);
    // Resource Not Found
    case 404:
      throw NotFoundException(jsonDecode(response.body)['message']);
    // Internal Server Error
    case 500:
    default:
      throw FetchDataException('Something went wrong! ${response.statusCode}');
  }
}

dynamic processLoginResponse(http.Response response) {
  switch (response.statusCode) {
    // Success
    case 200:

      ///Printing the JSON response body
      _printJSONData(jsonDecode(response.body));

      ///Here Returning String Body for now will change according to Need...
      return response;
    case 201:
      var responseJson = response.body;
      return responseJson;
    // Bad Request
    case 400:
      throw BadRequestException(jsonDecode(response.body)['message']);

    // UnAuthorizedException exception
    case 401:
      throw UnAuthorizedException(jsonDecode(response.body)['message']);
    // Forbidden
    case 403:
      throw UnAuthorizedException(jsonDecode(response.body)['message']);
    // Resource Not Found
    case 404:
      throw NotFoundException(jsonDecode(response.body)['message']);
    // Internal Server Error
    case 500:

    default:
      throw FetchDataException('Something went wrong! ${response.statusCode}');
  }
}

///ONLY FOR LOGGING PURPOSE - Function to print the JSON object in logs in proper format.
///[data] -> Decoded JSON body
_printJSONData(var data) {
  final prettyString = const JsonEncoder.withIndent(' ').convert(data);
  log(prettyString);
}
