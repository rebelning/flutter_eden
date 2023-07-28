abstract class EdenHttpResponse<T> {
  int? code = 0;
  String? message = "";
  T? data;

  EdenHttpResponse({
    this.code,
    this.message,
    this.data,
  });

  @override
  String toString() {
    return 'HttpResponse{resCode: $code, message: $message, data: $data}';
  }
}
