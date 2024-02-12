import 'package:example/app/components/page/controllers/demo_controller.dart';

import 'package:flutter_eden/eden.dart';

mixin class DemoView {
  Widget renderItemView(
      DemoController _controller, Function(String? tag) onTap) {
    return Column(
      children: [
        ButtonWidget(
          label: "page-tag/1",
          onPressed: () {
            onTap("tag/1");
          },
        ),
        const SizedBox(height: 20),
        ButtonWidget(
          label: "page-tag/2",
          onPressed: () {
            onTap("tag/2");
          },
        ),
        const SizedBox(height: 20),
        ButtonWidget(
          label: "page-tag/3",
          onPressed: () {
            onTap("tag/3");
          },
        ),
        const SizedBox(height: 20),
        ButtonWidget(
          label: "page-tag/4",
          onPressed: () {
            onTap("tag/4");
          },
        ),
        const SizedBox(height: 20),
        ButtonWidget(
          label: "page-tag/5",
          onPressed: () {
            onTap("tag/5");
          },
        )
      ],
    );
  }
}
