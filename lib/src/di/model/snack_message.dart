class SnackMessage {
  int? resCode = 200;
  String? message = "";

  SnackMessage({this.resCode, this.message});

  @override
  String toString() {
    return 'HttpResponse{resCode: $resCode, message: $message}';
  }
}
