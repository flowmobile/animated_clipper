import 'package:flutter/widgets.dart';

import '../animated_clipper.dart';
import 'path_builders/path_builder.dart';

// TODO - could this be a generic RevealerStack? ...
//  ie: the widget allows a user to add an animated widget
//   that obscures and replaces the current widget.
//  It could use OpacityTransition, ClipPathTransition,
//   ShaderMaskTransition etc. Once the tranistion is complete
//   the widgets behind can be safely removed.

class AnimatedClipReveal extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final PathBuilder pathBuilder;
  final Curve curve;
  final Clip clipBehavior;
  final bool revealFirstChild;

  const AnimatedClipReveal({
    Key key,
    @required this.child,
    @required this.duration,
    this.pathBuilder = PathBuilders.slideUp,
    this.revealFirstChild = false,
    this.curve = Curves.linear,
    this.clipBehavior = Clip.antiAlias,
  }) : super(key: key);

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
      children: children,
    );
  }
}
