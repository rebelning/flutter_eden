mixin Logger {
  // Sample of abstract logging function
  static void edenWrite(String text,
      {String? logTag = "Eden", bool isError = false}) {
    Future.microtask(() => print('$logTag $text. isError: [$isError]'));
  }
}
