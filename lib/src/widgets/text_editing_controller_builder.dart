import 'package:flutter/widgets.dart';

/// Exposes a [TextEditingController] to the child, which allows
/// us to convert any [TextField] into a declarative version.
///
/// Typically used for wiring up many state fields to form inputs
/// and making sure everything stays in sync.
///
/// If [text] is updated, the consuming [TextField] will also be updated.
/// If the ancestor is rebuilt, the composing state will not be lost like it typically is.
///
/// ```dart
/// TextEditingControllerBuilder(
///   text: appState.name,
///   builder: (context, controller) {
///     return TextField(
///       controller: controller,
///       onChanged: (value) => appState.updateName(value),
///     );
///   },
/// );
/// ```
///
/// This widget was created by Luke Pighetti and edited by GroovinChip.
/// Please view the original source [here](https://gist.github.com/lukepighetti/55d367808e994e426fc0c7f7032fab9c)
class TextEditingControllerBuilder extends StatefulWidget {
  const TextEditingControllerBuilder({
    Key? key,
    required this.text,
    required this.builder,
  }) : super(key: key);

  /// The text to declaratively update in the text controller
  final String text;

  /// The builder which exposes the [TextEditingController] to the child
  final Widget Function(BuildContext, TextEditingController) builder;

  @override
  _TextEditingControllerBuilderState createState() =>
      _TextEditingControllerBuilderState();
}

class _TextEditingControllerBuilderState
    extends State<TextEditingControllerBuilder> {
  late TextEditingController controller =
      TextEditingController(text: widget.text);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant TextEditingControllerBuilder oldWidget) {
    if (oldWidget.text != widget.text) {
      controller.value = controller.value.copyWith(text: widget.text);
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, controller);
  }
}
