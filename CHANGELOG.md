## [0.1.4] - 2020-07-05

Use `StackFit.expand` for the `Stack` widgets

## [0.1.3] - 2020-07-05

Humorous docs for `circleIn`, `circleOut`, `splitHorizontalIn` and `splitHorizontalOut`

## [0.1.2] - 2020-07-05

Updated `circleIn` and `circleOut`

## [0.1.1] - 2020-07-05

Updated `splitHorizontalIn` and `splitHorizontalOut`

## [0.1.0] - 2020-07-05

Better documentation, example gif

## [0.0.1] - 2020-07-05

Intitial commit to define the Widgets and interfaces.

From highest to lowest level of abstraction:

* Stateful widgets with a built-in `AnimationController`
   * `AnimatedCrossClip`
   * `AnimatedClipReveal`
   * `ClipSwitch` (abstracts to `AnimatedCrossClip`)
* Stateless widgets, bring your own `AnimationController`
   * `ClipPathTransition`
* Abstract Classes
   * `PathBuilder`
      * Returns a `Path` for a given value, where:
         * `0` is completely hidden
         * intermediate values are partially visible
         * `1` is completely visible
   * `PathBuilderClipper`
      * To allow a `PathBuilder` to be used as a CustomClipper

Plus, a collection of `PathBuilder` objects:

* `PathBuilders.slideUp`
* `PathBuilders.slideDown`
* `PathBuilders.slideLeft`
* `PathBuilders.slideRight`
* `PathBuilders.splitVerticalIn`
* `PathBuilders.splitVerticalOut`
* `PathBuilders.splitHorizontalIn`
* `PathBuilders.splitHorizontalOut`
* `PathBuilders.circleIn`
* `PathBuilders.circleOut`