// This widget was created by Simon Lightfoot and modified slightly by GroovinChip.
// Please view the original source at https://gist.github.com/slightfoot/85d39f7c235119b724b6b1fa4afa0b41.

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show RendererBinding;

/// A generic asynchronous function that returns a Widget.
typedef OnDeferInit<T extends Widget?> = Future<T> Function();

/// Prevents the initialization of UI until the provided asynchronous task is
/// completed.
///
/// This is done by using the `deferFirstFrame()` and `allowFirstFrame()`
/// functions from Flutter's [RendererBinding] mixin.
///
/// Use in a [StatefulWidget] when async initialization of a service
/// class is required before `initState` starts to build UI.
@immutable
class DeferInit<T extends Widget?> extends StatefulWidget {
  const DeferInit({
    Key? key,
    required this.onDefer,
    this.loadingWidget = const SizedBox.shrink(),
    this.emptyWidget = const SizedBox.shrink(),
  }) : super(key: key);

  /// The function to call when deferring initialization
  final OnDeferInit<T> onDefer;

  /// An optional Widget to display while [onDefer] is running.
  ///
  /// Defaults to `const SizedBox.shrink()`.
  final Widget loadingWidget;

  /// An optional Widget to display if [onDefer] returns null.
  ///
  /// Defaults to `const SizedBox.shrink()`.
  final Widget emptyWidget;

  @override
  _DeferInitState<T> createState() => _DeferInitState<T>();
}

class _DeferInitState<T extends Widget?> extends State<DeferInit<T>> {
  late Future<T> _future;

  @override
  void initState() {
    super.initState();
    RendererBinding.instance!.deferFirstFrame();
    _future = widget.onDefer().whenComplete(() {
      RendererBinding.instance!.allowFirstFrame();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _future,
      builder: (BuildContext context, AsyncSnapshot<T> snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return widget.loadingWidget;
        } else if (snapshot.hasError) {
          return ErrorWidget(snapshot.error!);
        } else {
          Widget? data = snapshot.data;
          return data ?? widget.emptyWidget;
        }
      },
    );
  }
}
