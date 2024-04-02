import 'dart:async';

import 'package:flutter_eden/eden.dart';

///
abstract class EdenBaseRepository {
  Future<T?> getRepository<T>(Future<Response<T?>> future) async {
    final response = await future;
    if (response.status.hasError) {
      // return Future.error(newFuture.statusText ?? "");

      return Future<T?>.error(response.statusText ?? "has error");
      // return Future<T?>.value();

      // return Future<T>.error();
    } else {
      return response.body;
    }
  }
}
