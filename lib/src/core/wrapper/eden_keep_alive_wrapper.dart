import 'package:flutter_eden/eden.dart';

///
///eden keep alive wrapper
///Getx issues https://github.com/jonataslaw/getx/issues/822
class EdenKeepAliveWrapper extends StatefulWidget {
  final Widget child;
  const EdenKeepAliveWrapper({Key? key, required this.child}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _EdenKeepAliveWrapperState();
}

class _EdenKeepAliveWrapperState extends State<EdenKeepAliveWrapper>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }
}
