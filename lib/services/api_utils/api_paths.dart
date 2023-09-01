class ApiPaths {
  static String loginPath(String baseUrl) => "$baseUrl/api/method/login";

  static String getUserRolePath(String baseUrl, String email) =>
      "$baseUrl/api/resource/User/$email";

  static String sendDeviceTokenForPush(String baseUrl) =>
      "$baseUrl/api/resource/Push Notifications";

  static String workflowActionListPath(String baseUrl) =>
      "$baseUrl/api/resource/Workflow Action";

  static String workflowListPath(String baseUrl) => "$baseUrl/api/method/notibell.api.action_list";

  static String workflowDocTransitionPath(String baseUrl, String doctype) =>
      "$baseUrl/api/resource/Workflow/$doctype";

  static String pingPong(String baseUrl) => "$baseUrl/api/method/ping";

  static String workflowEntryDetails(
          String baseUrl, String docType, String docId) =>
      "$baseUrl/api/resource/$docType/$docId";
}
