
class HttpResponse<T> {
  int? resCode = 200;
  String? message = "";
  T? data;

  HttpResponse({ this.resCode, this.message, this.data });

  @override
  String toString() {
    return 'HttpResponse{resCode: $resCode, message: $message, data: $data}';
  }
}
