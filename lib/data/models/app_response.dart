class AppResponse {
  dynamic data;
  bool isSuccess;
  int? errorStatusCode;
  String errorMessage;

  AppResponse({
    this.data,
    this.isSuccess = false,
    this.errorStatusCode,
    this.errorMessage = "",
  });
}
