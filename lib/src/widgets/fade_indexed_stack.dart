import 'package:flutter/material.dart';

/// {@template fadeIndexedStack}
/// An [IndexedStack] that animates its children in and out using a
/// [FadeTransition].
///
/// This widget was authored by Diego Velásquez López. Please view the original
/// source code [here](https://gist.github.com/diegoveloper/1cd23e79a31d0c18a67424f0cbdfd7ad)
/// {@endtemplate}
class FadeIndexedStack extends StatefulWidget {
  /// {@macro fadeIndexedStack}
  const FadeIndexedStack({
    super.key,
    required this.index,
    required this.children,
    this.duration = const Duration(
      milliseconds: 800,
    ),
  });

  /// The index of the child to show.
  final int index;

  /// The children to show.
  final List<Widget> children;

  /// The duration of the fade transition animation.
  ///
  /// Defaults to `const Duration(milliseconds: 800)`
  final Duration duration;

  @override
  State<FadeIndexedStack> createState() => _FadeIndexedStackState();
}

class _FadeIndexedStackState extends State<FadeIndexedStack>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void didUpdateWidget(FadeIndexedStack oldWidget) {
    if (widget.index != oldWidget.index) {
      _controller.forward(from: 0.0);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _controller,
      child: IndexedStack(
        index: widget.index,
        children: widget.children,
      ),
    );
  }
}
