class ApiPaths {
  static String loginPath(String baseUrl) => "$baseUrl/api/method/login";

  static String getUserRolePath(String baseUrl, String email) =>
      "$baseUrl/api/resource/User/$email";

  static String sendDeviceTokenForPush(String baseUrl) =>
      "$baseUrl/api/resource/Push Notifications";

  static String workflowActionListPath(String baseUrl) =>
      "$baseUrl/api/resource/Workflow Action";

  static String workflowListPath(String baseUrl) =>
      "$baseUrl/api/method/notibell.api.action_list";

  static String getEmployeeIdPath(
          String baseUrl, String endpoint, String filters) =>
      '$baseUrl/api/resource/Employee?filters=$filters';

  static String getEmployeeDetailsPath(String baseUrl, String employeeId) =>
      '$baseUrl/api/resource/Employee/$employeeId';

  static String workflowDocTransitionPath(String baseUrl, String doctype) =>
      "$baseUrl/api/resource/Workflow/$doctype";

  static String pingPong(String baseUrl) => "$baseUrl/api/method/ping";

  static String workflowEntryDetails(
          String baseUrl, String docType, String docId) =>
      "$baseUrl/api/resource/$docType/$docId";

  static String checkAppStatusPath() =>
      "https://control-centre.nestorbird.com/api/method/control_centre.api.validate";

  static String faceRegistrationPath(
          String baseUrl, String docType, String docId) =>
      "$baseUrl/api/resource/$docType/$docId";

  static String getEmployeeCheckInStatus(
          String baseUrl, String endpoint, String filters, String feilds) =>
      '$baseUrl/$endpoint?filters=$filters&fields=$feilds';

  static String createEmployeeCheckin(
          String baseUrl, String endpoint,) =>
      '$baseUrl/$endpoint';
}
