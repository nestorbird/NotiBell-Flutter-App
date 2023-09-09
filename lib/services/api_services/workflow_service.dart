import 'package:notibell_mobile_app/screens/approvals_list_screen/model/approvals_list_model.dart';
import 'package:notibell_mobile_app/services/api_utils/api_paths.dart';
import 'package:notibell_mobile_app/services/api_utils/common_response.dart';

import '../api_utils/api_functions.dart';
import '../api_utils/api_status.dart';
import '../internet_connection/internet_service.dart';
import '../preference_service/storage_constants.dart';
import '../preference_service/storage_helper.dart';

class WorkflowService {
  @Deprecated("API changed to getWorkflowList")
  static Future<CommanResponse> getWorkflowEntries() async {
    try {
      var isInternetAvailable = await InternetService.isNetworkAvailable();

      if (isInternetAvailable) {
        String baseUrl =
            await StorageHelper().getStringValues(StorageConstants.baseUrl) ??
                "";

        String apiPath =
            '${ApiPaths.workflowActionListPath(baseUrl)}?fields=["name","reference_doctype","reference_name","status"]&limit=1000&order_by=creation desc&filters=[["status","=","Open"]]';

        var apiResponse = await ApiFunctions().getRequest(apiPath);

        List<dynamic> data = apiResponse["data"] as List<dynamic>;

        if (data != null) {
          return CommanResponse(
              status: true,
              message: data,
              apiStatus: ApiStatus.REQUEST_SUCCESS);
        } else {
          return CommanResponse(
              status: false, message: "", apiStatus: ApiStatus.REQUEST_FAILURE);
        }
      } else {
        return CommanResponse(
            status: false,
            message: "No internet connection",
            apiStatus: ApiStatus.NO_INTERNET);
      }
    } catch (e) {
      return CommanResponse(
          status: false,
          message: e.toString(),
          apiStatus: ApiStatus.REQUEST_FAILURE);
    }
  }

  static Future<CommanResponse> getWorkflowList() async {
    try {
      var isInternetAvailable = await InternetService.isNetworkAvailable();

      if (isInternetAvailable) {
        String baseUrl =
            await StorageHelper().getStringValues(StorageConstants.baseUrl) ??
                "";

        String apiPath = ApiPaths.workflowListPath(baseUrl);

        var apiResponse = await ApiFunctions().getRequest(apiPath);

        var workflows = ApprovalsListModel.fromJson(apiResponse);

        if (workflows.data.isNotEmpty) {
          return CommanResponse(
              status: true,
              message: workflows.data,
              apiStatus: ApiStatus.REQUEST_SUCCESS);
        } else {
          return CommanResponse(
              status: false,
              message: "No data found",
              apiStatus: ApiStatus.NO_DATA_AVAILABLE);
        }
      } else {
        return CommanResponse(
            status: false,
            message: "No internet connection",
            apiStatus: ApiStatus.NO_INTERNET);
      }
    } catch (e) {
      return CommanResponse(
          status: false,
          message: e.toString(),
          apiStatus: ApiStatus.REQUEST_FAILURE);
    }
  }

  static Future<CommanResponse> getDocTransitions(String docType) async {
    try {
      var isInternetAvailable = await InternetService.isNetworkAvailable();

      if (isInternetAvailable) {
        String baseUrl =
            await StorageHelper().getStringValues(StorageConstants.baseUrl) ??
                "";

        String apiPath = ApiPaths.workflowDocTransitionPath(baseUrl, docType);

        var apiResponse = await ApiFunctions().getRequest(apiPath);

        Map<String, dynamic> data = apiResponse["data"] as Map<String, dynamic>;
        List<dynamic> transitions = data["transitions"] as List<dynamic>;

        if (data != null) {
          return CommanResponse(
              status: true,
              message: transitions,
              apiStatus: ApiStatus.REQUEST_SUCCESS);
        } else {
          return CommanResponse(
              status: false, message: "", apiStatus: ApiStatus.REQUEST_FAILURE);
        }
      } else {
        return CommanResponse(
            status: false,
            message: "No internet connection",
            apiStatus: ApiStatus.NO_INTERNET);
      }
    } catch (e) {
      return CommanResponse(
          status: false,
          message: e.toString(),
          apiStatus: ApiStatus.REQUEST_FAILURE);
    }
  }

  static Future<CommanResponse> getDocDetails(
      String doctype, String docId) async {
    try {
      var isInternetAvailable = await InternetService.isNetworkAvailable();

      if (isInternetAvailable) {
        String baseUrl =
            await StorageHelper().getStringValues(StorageConstants.baseUrl) ??
                "";

        String apiPath = ApiPaths.workflowEntryDetails(baseUrl, doctype, docId);

        var apiResponse = await ApiFunctions().getRequest(apiPath);

        var data = apiResponse["data"] as Map<String, dynamic>;

        if (data != null) {
          return CommanResponse(
              status: true,
              message: data,
              apiStatus: ApiStatus.REQUEST_SUCCESS);
        } else {
          return CommanResponse(
              status: false, message: "", apiStatus: ApiStatus.REQUEST_FAILURE);
        }
      } else {
        return CommanResponse(
            status: false,
            message: "No internet connection",
            apiStatus: ApiStatus.NO_INTERNET);
      }
    } catch (e) {
      return CommanResponse(
          status: false,
          message: e.toString(),
          apiStatus: ApiStatus.REQUEST_FAILURE);
    }
  }

  static Future<CommanResponse> updateDocDetails(
      String doctype, String docId, String action) async {
    try {
      var isInternetAvailable = await InternetService.isNetworkAvailable();

      if (isInternetAvailable) {
        String baseUrl =
            await StorageHelper().getStringValues(StorageConstants.baseUrl) ??
                "";

        String apiPath = ApiPaths.workflowEntryDetails(baseUrl, doctype, docId);

        var request = {"workflow_state": action};

        var apiResponse = await ApiFunctions().putRequest(apiPath, request);

        var data = apiResponse["data"] as Map<String, dynamic>;

        if (data != null) {
          return CommanResponse(
              status: true,
              message: data,
              apiStatus: ApiStatus.REQUEST_SUCCESS);
        } else {
          return CommanResponse(
              status: false, message: "", apiStatus: ApiStatus.REQUEST_FAILURE);
        }
      } else {
        return CommanResponse(
            status: false,
            message: "No internet connection",
            apiStatus: ApiStatus.NO_INTERNET);
      }
    } catch (e) {
      return CommanResponse(
          status: false,
          message: e.toString(),
          apiStatus: ApiStatus.REQUEST_FAILURE);
    }
  }

  static Future<CommanResponse> getCompleteWorkflowEntries() async {
    try {
      var isInternetAvailable = await InternetService.isNetworkAvailable();

      if (isInternetAvailable) {
        String baseUrl =
            await StorageHelper().getStringValues(StorageConstants.baseUrl) ??
                "";

        String apiPath =
            '${ApiPaths.workflowActionListPath(baseUrl)}?fields=["name","reference_doctype","reference_name","status"]&limit=1000&order_by=creation desc&filters=[["status","=","Completed"]]';

        var apiResponse = await ApiFunctions().getRequest(apiPath);

        List<dynamic> data = apiResponse["data"] as List<dynamic>;

        if (data != null) {
          return CommanResponse(
              status: true,
              message: data,
              apiStatus: ApiStatus.REQUEST_SUCCESS);
        } else {
          return CommanResponse(
              status: false, message: "", apiStatus: ApiStatus.REQUEST_FAILURE);
        }
      } else {
        return CommanResponse(
            status: false,
            message: "No internet connection",
            apiStatus: ApiStatus.NO_INTERNET);
      }
    } catch (e) {
      return CommanResponse(
          status: false,
          message: e.toString(),
          apiStatus: ApiStatus.REQUEST_FAILURE);
    }
  }

  static Future<CommanResponse> discardWorkflowEntry(String docName) async {
    try {
      var isInternetAvailable = await InternetService.isNetworkAvailable();

      if (isInternetAvailable) {
        String baseUrl =
            await StorageHelper().getStringValues(StorageConstants.baseUrl) ??
                "";

        String apiPath = '${ApiPaths.workflowActionListPath(baseUrl)}/$docName';

        var request = {"discard": "Yes"};

        var apiResponse = await ApiFunctions().putRequest(apiPath, request);

        var data = apiResponse["data"] as Map<String, dynamic>;
        if (data != null) {
          return CommanResponse(
              status: true,
              message: data,
              apiStatus: ApiStatus.REQUEST_SUCCESS);
        } else {
          return CommanResponse(
              status: false, message: "", apiStatus: ApiStatus.NO_INTERNET);
        }
      } else {
        return CommanResponse(
            status: false,
            message: "No internet connection",
            apiStatus: ApiStatus.NO_INTERNET);
      }
    } catch (e) {
      return CommanResponse(
          status: false,
          message: e.toString(),
          apiStatus: ApiStatus.REQUEST_FAILURE);
    }
  }
}
