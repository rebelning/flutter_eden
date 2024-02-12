import 'package:example/app/modules/profile/controllers/profile_controller.dart';
import 'package:flutter/material.dart';

mixin class ProfileWidget {
  Widget renderView(BuildContext context, ProfileController? _controller) {
    return ListView(
      children: [renderItemView(context, _controller, "退出登录")],
    );
  }

  Widget renderItemView(
    BuildContext context,
    ProfileController? _controller,
    String section,
  ) {
    return InkWell(
      onTap: () {
        _controller?.onExitLogin();
      },
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey,
              width: 1,
            ),
          ),
        ),
        child: Row(
          children: [
            Text(
              section,
              style: const TextStyle(),
            )
          ],
        ),
      ),
    );
  }
}
