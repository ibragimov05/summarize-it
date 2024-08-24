class AppResponse {
  dynamic data;
  bool isSuccess;
  int? errorStatusCode;
  String errorMessage;

  AppResponse({
    this.data,
    this.isSuccess = true,
    this.errorStatusCode,
    this.errorMessage = "",
  });
}
