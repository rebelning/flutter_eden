import 'package:flutter_eden/eden.dart';
import 'package:rxdart/subjects.dart';

abstract class BaseViewModel {
  final _loading = BehaviorSubject<LoadingMessage>();

  Stream<LoadingMessage> get loading => _loading.stream;

  // void setLoading(LoadingMessage value) => _loading.add(value);

  void setLoading(bool isLoading, {String? message}) {
    LoadingMessage value = LoadingMessage();
    value.loading = isLoading;
    value.message = message;
    _loading.add(value);
  }

  void clear();
}
