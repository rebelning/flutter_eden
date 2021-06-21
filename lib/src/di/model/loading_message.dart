///loading message
class LoadingMessage {
  int? resCode = 200;
  String? message = "";
  bool? loading = false;
  bool? isError = false;

  LoadingMessage({this.loading, this.isError, this.resCode, this.message});

  @override
  String toString() {
    return 'HttpResponse{resCode: $resCode, message: $message}';
  }
}
