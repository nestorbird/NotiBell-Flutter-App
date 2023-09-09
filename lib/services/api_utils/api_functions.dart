import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:notibell_mobile_app/services/api_utils/process_response_status_code.dart';

import '../preference_service/storage_constants.dart';
import '../preference_service/storage_helper.dart';
import 'exception_handlers.dart';

// Creating Http Request Function

class ApiFunctions {
  int timeOutDuration = 30;

  Future<Map<String, dynamic>> getRequest(
    String url,
  ) async {
    // passing url or link in uri parse to fetch data

    var uri = Uri.parse(url);

    // waiting for the response from Api waiting time (TimeOutDuration) is variable here
    try {
      log("API URL :: $url");

      var response = await http
          .get((uri), headers: await _headers())
          .timeout(Duration(seconds: timeOutDuration));

      // calling process response for status of the link 200 for success

      return processResponse(response);
    } catch (e) {
      // Handing Exception

      throw ExceptionHandlers().getExceptionString(e);
    }
  }

  Future<Map<String, dynamic>> getRequestForStatus(
    String url,
  ) async {
    // passing url or link in uri parse to fetch data

    var uri = Uri.parse(url);

    // waiting for the response from Api waiting time (TimeOutDuration) is variable here
    try {
      log("API URL :: $url");

      var response = await http
          .get((uri), headers: await _headers())
          .timeout(Duration(seconds: timeOutDuration));

      // calling process response for status of the link 200 for success

      return processLoginResponse(response);
    } catch (e) {
      // Handing Exception

      throw ExceptionHandlers().getExceptionString(e);
    }
  }

  Future<Map<String, dynamic>> postRequest(
      String url, Map<String, dynamic> request,
      {bool enableHeader = true}) async {
    var uri = Uri.parse(url);
    try {
      log(jsonEncode(request));
      var response = await http.post((uri),
          body: jsonEncode(request),
          headers: enableHeader ? await _headers() : null);
      //  log(jsonEncode(response));
      return processResponse(response);
    } catch (e) {
      // Handing Exception
      throw ExceptionHandlers().getExceptionString(e);
    }
  }

  ///POST request function used only for login API
  Future<http.Response> postRequestWithResponseHeaders(
      String url, Map<String, dynamic> request) async {
    var uri = Uri.parse(url);
    try {
      log("API URL :: $url");
      log("REQUEST :: \n $request");
      var response = await http.post((uri), body: request);

      return processLoginResponse(response);
    } catch (e) {
      // Handling Exception
      throw ExceptionHandlers().getExceptionString(e);
    }
  }

  Future<Map<String, dynamic>> putRequest(String url, request,
      {bool enableHeader = true}) async {
    var uri = Uri.parse(url);
    log("API URL :: $url");
    Map<String, String> headers = await _headers();
    debugPrint(headers.toString());
    try {
      debugPrint(jsonEncode(request));
      var response = await http.put((uri),
          body: jsonEncode(request), headers: enableHeader ? headers : null);

      return processResponse(response);
    } catch (e) {
      // Handing Exception
      throw ExceptionHandlers().getExceptionString(e);
    }
  }

  // static Future<Map<String, String>> _headers() async {
  //   //Creating http headers for api
  //   String? sessionId = await StorageHelper().getStringValues('sessionId');
  //   String? firstName = await StorageHelper().getStringValues("firstName");

  //   log("$sessionId");
  //   Map<String, String> headers = {
  //     'Cookie': 'full_name= $firstName  ;sid=$sessionId',
  //     'Content-Type': 'application/json'
  //   };
  //   return headers;
  // }

  static Future<Map<String, String>> _headers() async {
    // Creating http headers for api
    String? sessionId =
        await StorageHelper().getStringValues(StorageConstants.sessionId);
    Map<String, String> headers = {'Content-Type': 'application/json'};

    if (sessionId != null && sessionId.isNotEmpty) {
      headers.putIfAbsent('Cookie', () => "sid=$sessionId");
    }
    return headers;
  }

  static Future<dynamic> postMultipartRequest(
      String url, String filePath) async {
    var uri = Uri.parse(url);
    try {
      var request = http.MultipartRequest('POST', uri);
      File file = File(filePath);
      request.files.add(http.MultipartFile(
          "image", file.readAsBytes().asStream(), file.lengthSync(),
          filename: file.path.split('/').last));

      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        Map<String, dynamic> map =
            jsonDecode(await response.stream.bytesToString());
        return map;
      }

      return Exception("File not uploaded successfully");
    } catch (e) {
      // Handing Exception
      throw ExceptionHandlers().getExceptionString(e);
    }
  }
}
