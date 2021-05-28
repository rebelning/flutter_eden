import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../widgets/text.dart';

import 'package:flutter_eden/src/values/color/colors.dart' as colors;
import 'package:flutter_eden/src/values/dimen/dimens.dart' as dimens;

class LoadingWidget extends StatefulWidget {
  final bool backgroundTransparent;
  final String message;
  final bool status;
  final Widget child;

  const LoadingWidget(
      {Key key,
      this.status,
      this.child,
      this.message,
      this.backgroundTransparent})
      : super(key: key);

  @override
  _LoadingWidgetState createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
        children: <Widget>[widget.child, _loadingWidget(widget.status)]);
  }

  Widget _loadingWidget(bool loadingWidget) {
    return loadingWidget == true
        ? Container(
            alignment: Alignment.center,
            color: widget.backgroundTransparent == true
                ? Colors.transparent
                : Colors.grey.withOpacity(0.7),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: dimens.loading_width,
                    height: dimens.loading_height,
                    alignment: Alignment.center,
                    decoration: ShapeDecoration(
                      color: Colors.black54,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _progress,
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: TextWidget(
                            text: widget.message,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ]),
          )
        : Container();
  }

  Widget get _progress => defaultTargetPlatform == TargetPlatform.iOS
      ? const CupertinoActivityIndicator()
      : CircularProgressIndicator(
          strokeWidth: 2.0,
          backgroundColor: Colors.transparent,
          valueColor: new AlwaysStoppedAnimation<Color>(colors.accentColor),
        );
}
