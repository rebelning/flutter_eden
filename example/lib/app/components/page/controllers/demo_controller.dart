import 'package:example/app/components/page/bindings/demo_binding.dart';
import 'package:example/app/components/page/view/demo_page.dart';
import 'package:example/app/routes/routes.dart';
import 'package:flutter_eden/eden.dart';

class DemoController extends EdenBaseController {
  final String? tag;
  DemoController({@required this.tag});

  static DemoController get to => Get.find();
  String? tagName;
  @override
  void onInit() {
    super.onInit();
    tagName = tag;
    print("onInit-tag=$tagName...");
  }

  String? getTag() {
    return tagName ?? tag;
  }

  void onTapPageView(String? _tag) {
    print("TagName=$_tag");
    tagName = _tag;
    EdenRoute.to(DemoPage(),
        binding: DemoBinding(tag: tagName), preventDuplicates: false);
    // EdenRoute.offAllToNamed(Routes.app.root, parameters: {"data": "123"});
  }

  @override
  void onClose() {
    super.onClose();
    print("onClose-tag=$tagName...");
  }

  @override
  void dealloc() {}

  @override
  Future doRequest(bool isPull) async {}

  @override
  void init() {}
}
