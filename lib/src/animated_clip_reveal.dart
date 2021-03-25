import 'package:flutter/widgets.dart';

import '../animated_clipper.dart';

/// A widget that does a an animated clip path reveal between a new widget and
/// the widget previously set on the [AnimatedClipReveal] as a child.
///
/// Similar to the core [AnimatedSwitcher], with one notable difference:
///
///   * Previous widgets *do not* transition out. AnimatedClipReveal assumes that
///     the new widget will completely obscure the previous child(ren). Once the
///     new widget has been revealed, all previous child(ren) are removed.
///
/// If they are swapped fast enough (i.e. before [duration] elapses), more than
/// one previous child can exist. The clip tranistions will be layered on top of
/// each other.
///
/// If the "new" child is the same widget type and key as the "old" child, but
/// with different parameters, then [AnimatedSwitcher] will *not* do a
/// transition between them, since as far as the framework is concerned, they
/// are the same widget and the existing widget can be updated with the new
/// parameters. To force the transition to occur, set a [Key] on each child
/// widget that you wish to be considered unique (typically a [ValueKey] on the
/// widget data that distinguishes this child from the others).
///
/// When a new child widget is set, [AnimatedClipReveal] will use the
/// [pathBuilder], [duration], [curve] and [clipBehaviour] for the tranistion.
/// It is therefore possible to show each new child with its own transition.
///
/// See also:
///
///  * [AnimatedCrossClip], which animates between only two children and is
///    reversible.
///  * [ClipPathTransition], which [AnimatedClipReveal] uses to perform the
///    clip animation.
class AnimatedClipReveal extends StatefulWidget {
  /// Creates an [AnimatedClipReveal].
  ///
  /// All the arguments other than [key] must be non-null.
  const AnimatedClipReveal({
    Key? key,
    required this.child,
    this.duration = AnimatedClipReveal.defaultDuration,
    this.pathBuilder = PathBuilders.slideUp,
    this.curve = Curves.linear,
    this.clipBehavior = Clip.antiAlias,
    this.fit = StackFit.loose,
    this.revealFirstChild = false,
  }) : super(key: key);

  /// The current child widget to display.
  ///
  /// If there was a previous child, then the new child is revealed with a
  /// [ClipPathTransition] using [pathBuilder], [curve] and [clipBehaviour],
  /// over the [duration].
  ///
  /// If there was no previous child (ie, when first rendered), then this child
  /// will be immediately visible, unless [revealFirstChild] is set to true.
  ///
  /// The child is considered to be "new" if it has a different type or [Key]
  /// (see [Widget.canUpdate]).
  final Widget child;

  /// The duration of the [ClipPathTransition] applied to the new [child].
  ///
  /// Changing [duration] does not affect transitions already in progress.
  ///
  /// The default is [AnimatedClipReveal.defaultDuration].
  final Duration duration;

  /// The [PathBuilder] of the [ClipPathTransition] applied to the new [child].
  ///
  /// Changing [pathBuilder] does not affect transitions already in progress.
  ///
  /// The default is [PathBuilders.slideUp].
  final PathBuilder pathBuilder;

  /// The animation curve applied to the [ClipPathTransition] applied to the new
  /// [child].
  ///
  /// Changing [curve] does not affect transitions already in progress.
  ///
  /// The default is [Curves.linear].
  final Curve curve;

  /// The clipBehavior of the [ClipPathTransition] applied to the new [child].
  ///
  /// {@macro flutter.clipper.clipBehavior}
  ///
  /// Changing [clipBehavior] does not affect transitions already in progress.
  ///
  /// Defaults to [Clip.antiAlias].
  final Clip clipBehavior;

  /// How to size the non-positioned [child] in the stack.
  ///
  /// Defaults to [StackFit.loose]
  final StackFit fit;

  /// Whether to animate the initial child widget.
  ///
  /// The default is false.
  final bool revealFirstChild;

  static const Duration defaultDuration = Duration(milliseconds: 300);

  @override
  _AnimatedClipRevealState createState() => _AnimatedClipRevealState();
}

class _AnimatedClipRevealState extends State<AnimatedClipReveal>
    with TickerProviderStateMixin {
  List<Widget> children = [];
  List<AnimationController> controllers = [];

  @override
  void initState() {
    if (widget.revealFirstChild) {
      addAnimatedChildWidget();
    } else {
      addStaticChildWidget();
    }
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    controllers.forEach((controller) {
      controller.dispose();
    });
  }

  @override
  void didUpdateWidget(
    AnimatedClipReveal oldWidget,
  ) {
    super.didUpdateWidget(oldWidget);
    if (!Widget.canUpdate(widget.child, oldWidget.child)) {
      addAnimatedChildWidget();
    }
  }

  void addStaticChildWidget() {
    children.add(widget.child);
  }

  void addAnimatedChildWidget() {
    AnimationController controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
    Widget transitionWidget = ClipPathTransition(
      animation: controller.drive(CurveTween(curve: widget.curve)),
      pathBuilder: widget.pathBuilder,
      child: widget.child,
      clipBehavior: widget.clipBehavior,
    );
    controller.forward();
    controllers.add(controller);
    children.add(transitionWidget);
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          removeOlderSiblingsAndControllers(transitionWidget, controller);
        });
      }
    });
  }

  void removeOlderSiblingsAndControllers(
    Widget transitionWidget,
    AnimationController controller,
  ) {
    children.removeRange(0, children.indexOf(transitionWidget));
    controllers
        .getRange(0, controllers.indexOf(controller))
        .forEach((controller) {
      controller.dispose();
    });
    controllers.removeRange(0, controllers.indexOf(controller));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: widget.fit,
      children: children,
    );
  }
}
