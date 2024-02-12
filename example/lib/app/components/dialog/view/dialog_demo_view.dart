import 'package:flutter_eden/eden.dart';

mixin class DialogDemoView {
  Widget renderItemView(Function() onTap) {
    return Container(
      child: Column(
        children: [
          ButtonWidget(
            label: "button",
            onPressed: () {
              onTap();
            },
          )
        ],
      ),
    );
  }
}
