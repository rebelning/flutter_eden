import 'package:flutter_eden/eden.dart';

///
abstract class EdenBaseRespository {
  Future<T?> getRespository<T>(Future<Response<T?>> future) async {
    final newFuture = await future;
    if (newFuture.status.hasError) {
      return Future.error(newFuture.statusText ?? "");
    } else {
      return newFuture.body;
    }
  }
}
