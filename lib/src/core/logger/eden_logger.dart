mixin Logger {
  // Sample of abstract logging function
  static void edenWrite(String text, {bool isError = false}) {
    Future.microtask(() => print('Eden $text. isError: [$isError]'));
  }
}
