import 'package:example/app/modules/profile/controllers/profile_controller.dart';
import 'package:flutter_eden/eden.dart';

import 'profile_widget.dart';

///profile
class ProfilePage extends EdenBaseWidget<ProfileController> with ProfileWidget {
  @override
  String toolbarTitle() {
    return "profile";
  }

  @override
  Widget buildBody(BuildContext context, ProfileController _controller) {
    return renderView(context, _controller);
  }
}
