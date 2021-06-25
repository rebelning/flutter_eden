import 'package:example/ui/sliver/sliver_view_model.dart';
import 'package:example/ui/sliver/sliver_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eden/eden.dart';

class SliverPage extends AbstractCoreStreamWidget {
  @override
  State<StatefulWidget> createState() => _SliverPageState();
}

class _SliverPageState extends AbstractCoreStreamWidgetState<SliverPage>
    with SliverWidget {
  final vm = inject<SliverViewModel>();
  bool _isArrowDown = true;
  bool get isArrowDown => _isArrowDown;
  @override
  bool getHideToolbar() {
    return false;
  }

  @override
  bool getHideToolbarArrowBack() {
    return false;
  }

  @override
  Stream<LoadingMessage?> getStream() {
    return vm.loading;
  }

  @override
  String getToolbarTitle() {
    return "sliver";
  }

  @override
  bool get isSafeArea => false;

  @override
  void initData() {
    addController(() {
      _isArrowDown = true;
      setState(() {
      
    });
    }, () {
      _isArrowDown = false;
      setState(() {
      
    });
    });
    
  }

  @override
  Widget? getFloatingActionButton() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(56.0),
      child: Container(
        color: Theme.of(context).primaryColor,
        child: IconButton(
            onPressed: () {
              _floatingTap();
            },
            icon: isArrowDown
                ? const Icon(Icons.arrow_upward_outlined)
                : const Icon(Icons.arrow_downward_outlined)),
      ),
    );
  }

  ////
  void _floatingTap() {
    if (_isArrowDown) {
      _isArrowDown = false;
      arrowDown();
    } else {
      _isArrowDown = true;
      arrowUp();
    }
    setState(() {});
  }

  @override
  Widget buildBody(BuildContext context) {
    return sliverView(context, isArrowDown);
  }

  @override
  void dealloc() {
    viewDealloc();
  }
}
