import 'dart:async';
import 'package:async/async.dart';

import 'package:flutter_eden/eden.dart';

class SplashService extends EdenBaseService {
  final welcomeStr = ['sparrow', 'loadding...'];
  final activeStr = 0.obs;

  final memo = AsyncMemoizer<void>();
  @override
  void onInit() {
    super.onInit();

    print("Splash onInit...");
  }

  @override
  void onReady() {
    super.onReady();
    print("Splash onReady...");
  }

  Future<void> init() {
    return memo.runOnce(_initFunction);
  }

  void _changeActiveString() {
    activeStr.value = (activeStr.value + 1) % welcomeStr.length;
  }

  Future<void> _initFunction() async {
    final t = Timer.periodic(
      const Duration(milliseconds: 500),
      (t) => _changeActiveString(),
    );
    //simulate some long running operation
    await Future.delayed(const Duration(seconds: 5));
    //cancel the timer once we are done
    t.cancel();
  }
}
