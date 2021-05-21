import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_eden/eden.dart';

///course page
class CoursePage extends AbstractMvvmBase {
  @override
  State<StatefulWidget> createState() => CoursePageState();
}

class CoursePageState extends AbstractMvvmBaseState {
  @override
  Widget buildBody(BuildContext context) {
    return Center(
      child: TextWidget(
        text: "course ...",
      ),
    );
  }

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
}
