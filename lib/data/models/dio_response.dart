class DioResponse {
  String errorMessage;
  bool isSuccess;
  int? statusCode;
  dynamic data;

  DioResponse({
    this.errorMessage = "",
    this.isSuccess = false,
    this.data,
    this.statusCode,
  });
}
