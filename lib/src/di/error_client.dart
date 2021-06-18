import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter_eden/eden.dart';

///error client
class ErrorClient {
  // final _snackMessage = BehaviorSubject<SnackMessage?>.seeded(null);
  final _snackMessage = BehaviorSubject<SnackMessage?>();

  Stream<SnackMessage?> get stream => _snackMessage.stream;

  void setSnackMessage(SnackMessage? value) {
    _snackMessage.add(value);
  }

  ErrorClient() {
    _init();
  }

  void _init() {
    DebugLog.log("ErrorClient", "_init");
  }
}
