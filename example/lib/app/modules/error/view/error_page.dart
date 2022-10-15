import 'package:example/app/modules/error/controllers/error_controller.dart';
import 'package:flutter_eden/eden.dart';

class ErrorPage extends EdenBaseWidget<ErrorController> {
  @override
  Widget buildBody(BuildContext context, ErrorController _controller) {
    return Container();
  }

  @override
  String toolbarTitle() {
    return "404";
  }
}
