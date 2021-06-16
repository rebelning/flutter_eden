import 'dart:ffi';

import 'package:flutter_eden/eden.dart';

class ErrorClient {
  final _snackMessage = BehaviorSubject<SnackMessage?>.seeded(null);

  Stream<SnackMessage?> get stream => _snackMessage.stream;
  void setSnackMessage(SnackMessage value) => _snackMessage.add(value);
  ErrorClient() {
    _init();
  }

  void _init() {
    DebugLog.log("ErrorClient", "init...");
  }

}
