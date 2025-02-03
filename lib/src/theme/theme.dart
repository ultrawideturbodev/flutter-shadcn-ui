import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/src/theme/data.dart';

class TurboTheme extends StatelessWidget {
  const TurboTheme({
    super.key,
    required this.data,
    required this.child,
  });

  final TurboThemeData data;
  final Widget child;

  static TurboThemeData of(BuildContext context, {bool listen = true}) {
    return maybeOf(context, listen: listen)!;
  }

  static TurboThemeData? maybeOf(
    BuildContext context, {
    bool listen = true,
  }) {
    if (listen) {
      return context
          .dependOnInheritedWidgetOfExactType<ShadInheritedTheme>()
          ?.theme
          .data;
    }
    final provider = context
        .getElementForInheritedWidgetOfExactType<ShadInheritedTheme>()
        ?.widget;

    return (provider as ShadInheritedTheme?)?.theme.data;
  }

  @override
  Widget build(BuildContext context) {
    return ShadInheritedTheme(
      theme: this,
      child: child,
    );
  }
}

class ShadInheritedTheme extends InheritedTheme {
  const ShadInheritedTheme({
    super.key,
    required this.theme,
    required super.child,
  });

  final TurboTheme theme;

  @override
  Widget wrap(BuildContext context, Widget child) {
    return TurboTheme(data: theme.data, child: child);
  }

  @override
  bool updateShouldNotify(ShadInheritedTheme oldWidget) =>
      theme.data != oldWidget.theme.data;
}

/// An interpolation between two [TurboThemeData]s.
///
/// This class specializes the interpolation of [Tween<ShadThemeData>] to call
/// the [TurboThemeData.lerp] method.
///
/// See [Tween] for a discussion on how to use interpolation objects.
class ShadThemeDataTween extends Tween<TurboThemeData> {
  /// Creates a [TurboThemeData] tween.
  ///
  /// The [begin] and [end] properties must be non-null before the tween is
  /// first used, but the arguments can be null if the values are going to be
  /// filled in later.
  ShadThemeDataTween({super.begin, super.end});

  @override
  TurboThemeData lerp(double t) => TurboThemeData.lerp(begin!, end!, t);
}

/// Animated version of [TurboTheme] which automatically transitions the colors
/// etc, over a given duration whenever the given theme changes.
class ShadAnimatedTheme extends ImplicitlyAnimatedWidget {
  /// Creates an animated theme.
  ///
  /// By default, the theme transition uses a linear curve.
  const ShadAnimatedTheme({
    super.key,
    required this.data,
    required this.child,
    super.curve,
    super.duration = const Duration(milliseconds: 200),
    super.onEnd,
  });

  /// Specifies the color and typography values for descendant widgets.
  final TurboThemeData data;

  /// The widget below this widget in the tree.
  final Widget child;

  @override
  AnimatedWidgetBaseState<ShadAnimatedTheme> createState() =>
      _ShadAnimatedThemeState();
}

class _ShadAnimatedThemeState
    extends AnimatedWidgetBaseState<ShadAnimatedTheme> {
  ShadThemeDataTween? _data;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _data = visitor(
      _data,
      widget.data,
      (dynamic value) => ShadThemeDataTween(begin: value as TurboThemeData),
    )! as ShadThemeDataTween;
  }

  @override
  Widget build(BuildContext context) {
    return TurboTheme(
      data: _data!.evaluate(animation),
      child: widget.child,
    );
  }
}
