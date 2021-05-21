import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_eden/eden.dart';

///course page
class CoursePage extends AbstractMvvmKLiveBase {
  @override
  State<StatefulWidget> createState() => _CoursePageState();
}

class _CoursePageState extends AbstractMvvmKLiveBaseState {
  @override
  bool get wantKeepAlive => true;

  @override
  bool getHideToolbar() {
    return false;
  }

  @override
  bool getHideToolbarArrowBack() {
    return true;
  }

  @override
  String getToolbarTitle() {
    return "Course";
  }

  // @override
  // Widget buildBody(BuildContext context) {
  //   return Container(
  //     width: double.infinity,
  //     height: double.infinity,
  //     child: TextWidget(
  //       text: "course...",
  //     ),
  //   );
  // }
}
