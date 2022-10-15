import 'package:example/ui/stock/stock_view_model.dart';
import 'package:example/ui/stock/stock_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:flutter_eden/eden.dart';

class StockPage extends AbstractCoreStreamWidget {
  @override
  State<StatefulWidget> createState() => _StockPageState();
}

class _StockPageState extends AbstractCoreStreamWidgetState<StockPage>
    with StockWidget {
  final vm = inject<StockViewModel>();
  final controller = ScrollController();

  OverlayEntry? sticky;
  GlobalKey stickyKey = GlobalKey();

  @override
  String getToolbarTitle() {
    return "stock";
  }

  @override
  Stream<LoadingMessage> getStream() {
    return vm.loading;
  }

  @override
  void initData() {
    if (sticky != null) {
      sticky?.remove();
    }
    sticky = OverlayEntry(
      builder: (context) => stickyBuilder(context),
    );

    SchedulerBinding.instance?.addPostFrameCallback((_) {
      Overlay.of(context)?.insert(sticky!);
    });
  }

  @override
  Widget buildBody(BuildContext context) {
    return ListView.builder(
      controller: controller,
      itemBuilder: (context, index) {
        if (index == 6) {
          return Container(
            key: stickyKey,
            height: 100.0,
            color: Colors.green,
            child: const Text("I'm fat"),
          );
        }
        return ListTile(
          title: Text(
            'Hello $index',
            style: const TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }

  Widget stickyBuilder(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, Widget? child) {
        final keyContext = stickyKey.currentContext;
        if (keyContext != null) {
          // widget is visible
          final box = keyContext.findRenderObject() as RenderBox;
          final pos = box.localToGlobal(Offset.zero);
          return Positioned(
            top: pos.dy + box.size.height,
            left: 50.0,
            right: 50.0,
            height: box.size.height,
            child: Material(
              child: Container(
                alignment: Alignment.center,
                color: Colors.purple,
                child: const Text("^ Nah I think you're okay"),
              ),
            ),
          );
        }
        return Container();
      },
    );
  }

  @override
  void dealloc() {}
}
