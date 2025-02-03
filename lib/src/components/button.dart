import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shadcn_ui/src/raw_components/focusable.dart';
import 'package:shadcn_ui/src/theme/components/button.dart';
import 'package:shadcn_ui/src/theme/components/decorator.dart';
import 'package:shadcn_ui/src/theme/data.dart';
import 'package:shadcn_ui/src/theme/theme.dart';
import 'package:shadcn_ui/src/utils/debug_check.dart';
import 'package:shadcn_ui/src/utils/extensions/order_policy.dart';
import 'package:shadcn_ui/src/utils/gesture_detector.dart';
import 'package:shadcn_ui/src/utils/separated_iterable.dart';
import 'package:shadcn_ui/src/utils/states_controller.dart';
import 'package:shadcn_ui/src/vibrate/globals/g_vibrate.dart';

enum TurboButtonVariant {
  primary,
  destructive,
  outline,
  secondary,
  ghost,
  link,
}

enum TurboButtonSize {
  regular,
  sm,
  lg,
}

class TurboButton extends StatefulWidget {
  const TurboButton({
    super.key,
    this.child,
    this.icon,
    this.onPressed,
    this.size,
    this.cursor,
    this.width,
    this.height,
    this.padding,
    this.backgroundColor,
    this.hoverBackgroundColor,
    this.foregroundColor,
    this.hoverForegroundColor,
    this.autofocus = false,
    this.focusNode,
    this.pressedBackgroundColor,
    this.pressedForegroundColor,
    this.shadows,
    this.gradient,
    this.textDecoration,
    this.hoverTextDecoration,
    this.decoration,
    this.enabled = true,
    this.onLongPress,
    this.statesController,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.hoverStrategies,
    this.onHoverChange,
    this.onTapDown,
    this.onTapUp,
    this.onTapCancel,
    this.onSecondaryTapDown,
    this.onSecondaryTapUp,
    this.onSecondaryTapCancel,
    this.onLongPressStart,
    this.onLongPressCancel,
    this.onLongPressUp,
    this.onLongPressDown,
    this.onLongPressEnd,
    this.onDoubleTap,
    this.onDoubleTapDown,
    this.onDoubleTapCancel,
    this.longPressDuration,
    this.textDirection,
    this.gap,
    this.onFocusChange,
    this.orderPolicy,
    this.expands,
    this.duration = _defaultDuration,
    this.curve = _defaultCurve,
    this.reverseCurve = _defaultReverseCurve,
    this.scaleEnd = _defaultScaleEnd,
    this.opacityEnd = _defaultOpacityEnd,
  }) : variant = TurboButtonVariant.primary;

  const TurboButton.raw({
    super.key,
    required this.variant,
    this.size,
    this.child,
    this.icon,
    this.onPressed,
    this.cursor,
    this.width,
    this.height,
    this.padding,
    this.backgroundColor,
    this.hoverBackgroundColor,
    this.foregroundColor,
    this.hoverForegroundColor,
    this.autofocus = false,
    this.focusNode,
    this.pressedBackgroundColor,
    this.pressedForegroundColor,
    this.shadows,
    this.gradient,
    this.textDecoration,
    this.hoverTextDecoration,
    this.decoration,
    this.enabled = true,
    this.onLongPress,
    this.statesController,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.hoverStrategies,
    this.onHoverChange,
    this.onTapDown,
    this.onTapUp,
    this.onTapCancel,
    this.onSecondaryTapDown,
    this.onSecondaryTapUp,
    this.onSecondaryTapCancel,
    this.onLongPressStart,
    this.onLongPressCancel,
    this.onLongPressUp,
    this.onLongPressDown,
    this.onLongPressEnd,
    this.onDoubleTap,
    this.onDoubleTapDown,
    this.onDoubleTapCancel,
    this.longPressDuration,
    this.textDirection,
    this.gap,
    this.onFocusChange,
    this.orderPolicy,
    this.expands,
    this.duration = _defaultDuration,
    this.curve = _defaultCurve,
    this.reverseCurve = _defaultReverseCurve,
    this.scaleEnd = _defaultScaleEnd,
    this.opacityEnd = _defaultOpacityEnd,
  });

  const TurboButton.destructive({
    super.key,
    this.child,
    this.icon,
    this.onPressed,
    this.size,
    this.cursor,
    this.width,
    this.height,
    this.padding,
    this.backgroundColor,
    this.hoverBackgroundColor,
    this.foregroundColor,
    this.hoverForegroundColor,
    this.autofocus = false,
    this.focusNode,
    this.pressedBackgroundColor,
    this.pressedForegroundColor,
    this.shadows,
    this.gradient,
    this.textDecoration,
    this.hoverTextDecoration,
    this.decoration,
    this.enabled = true,
    this.onLongPress,
    this.statesController,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.hoverStrategies,
    this.onHoverChange,
    this.onTapDown,
    this.onTapUp,
    this.onTapCancel,
    this.onSecondaryTapDown,
    this.onSecondaryTapUp,
    this.onSecondaryTapCancel,
    this.onLongPressStart,
    this.onLongPressCancel,
    this.onLongPressUp,
    this.onLongPressDown,
    this.onLongPressEnd,
    this.onDoubleTap,
    this.onDoubleTapDown,
    this.onDoubleTapCancel,
    this.longPressDuration,
    this.textDirection,
    this.gap,
    this.onFocusChange,
    this.orderPolicy,
    this.expands,
    this.duration = _defaultDuration,
    this.curve = _defaultCurve,
    this.reverseCurve = _defaultReverseCurve,
    this.scaleEnd = _defaultScaleEnd,
    this.opacityEnd = _defaultOpacityEnd,
  }) : variant = TurboButtonVariant.destructive;

  const TurboButton.outline({
    super.key,
    this.child,
    this.icon,
    this.onPressed,
    this.size,
    this.cursor,
    this.width,
    this.height,
    this.padding,
    this.backgroundColor,
    this.hoverBackgroundColor,
    this.foregroundColor,
    this.hoverForegroundColor,
    this.autofocus = false,
    this.focusNode,
    this.pressedBackgroundColor,
    this.pressedForegroundColor,
    this.shadows,
    this.gradient,
    this.textDecoration,
    this.hoverTextDecoration,
    this.decoration,
    this.enabled = true,
    this.onLongPress,
    this.statesController,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.hoverStrategies,
    this.onHoverChange,
    this.onTapDown,
    this.onTapUp,
    this.onTapCancel,
    this.onSecondaryTapDown,
    this.onSecondaryTapUp,
    this.onSecondaryTapCancel,
    this.onLongPressStart,
    this.onLongPressCancel,
    this.onLongPressUp,
    this.onLongPressDown,
    this.onLongPressEnd,
    this.onDoubleTap,
    this.onDoubleTapDown,
    this.onDoubleTapCancel,
    this.longPressDuration,
    this.textDirection,
    this.gap,
    this.onFocusChange,
    this.orderPolicy,
    this.expands,
    this.duration = _defaultDuration,
    this.curve = _defaultCurve,
    this.reverseCurve = _defaultReverseCurve,
    this.scaleEnd = _defaultScaleEnd,
    this.opacityEnd = _defaultOpacityEnd,
  }) : variant = TurboButtonVariant.outline;

  const TurboButton.secondary({
    super.key,
    this.child,
    this.icon,
    this.onPressed,
    this.size,
    this.cursor,
    this.width,
    this.height,
    this.padding,
    this.backgroundColor,
    this.hoverBackgroundColor,
    this.foregroundColor,
    this.hoverForegroundColor,
    this.autofocus = false,
    this.focusNode,
    this.pressedBackgroundColor,
    this.pressedForegroundColor,
    this.shadows,
    this.gradient,
    this.textDecoration,
    this.hoverTextDecoration,
    this.decoration,
    this.enabled = true,
    this.onLongPress,
    this.statesController,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.hoverStrategies,
    this.onHoverChange,
    this.onTapDown,
    this.onTapUp,
    this.onTapCancel,
    this.onSecondaryTapDown,
    this.onSecondaryTapUp,
    this.onSecondaryTapCancel,
    this.onLongPressStart,
    this.onLongPressCancel,
    this.onLongPressUp,
    this.onLongPressDown,
    this.onLongPressEnd,
    this.onDoubleTap,
    this.onDoubleTapDown,
    this.onDoubleTapCancel,
    this.longPressDuration,
    this.textDirection,
    this.gap,
    this.onFocusChange,
    this.orderPolicy,
    this.expands,
    this.duration = _defaultDuration,
    this.curve = _defaultCurve,
    this.reverseCurve = _defaultReverseCurve,
    this.scaleEnd = _defaultScaleEnd,
    this.opacityEnd = _defaultOpacityEnd,
  }) : variant = TurboButtonVariant.secondary;

  const TurboButton.ghost({
    super.key,
    this.child,
    this.icon,
    this.onPressed,
    this.size,
    this.cursor,
    this.width,
    this.height,
    this.padding,
    this.backgroundColor,
    this.hoverBackgroundColor,
    this.foregroundColor,
    this.hoverForegroundColor,
    this.autofocus = false,
    this.focusNode,
    this.pressedBackgroundColor,
    this.pressedForegroundColor,
    this.shadows,
    this.gradient,
    this.textDecoration,
    this.hoverTextDecoration,
    this.decoration,
    this.enabled = true,
    this.onLongPress,
    this.statesController,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.hoverStrategies,
    this.onHoverChange,
    this.onTapDown,
    this.onTapUp,
    this.onTapCancel,
    this.onSecondaryTapDown,
    this.onSecondaryTapUp,
    this.onSecondaryTapCancel,
    this.onLongPressStart,
    this.onLongPressCancel,
    this.onLongPressUp,
    this.onLongPressDown,
    this.onLongPressEnd,
    this.onDoubleTap,
    this.onDoubleTapDown,
    this.onDoubleTapCancel,
    this.longPressDuration,
    this.textDirection,
    this.gap,
    this.onFocusChange,
    this.orderPolicy,
    this.expands,
    this.duration = _defaultDuration,
    this.curve = _defaultCurve,
    this.reverseCurve = _defaultReverseCurve,
    this.scaleEnd = _defaultScaleEnd,
    this.opacityEnd = _defaultOpacityEnd,
  }) : variant = TurboButtonVariant.ghost;

  const TurboButton.link({
    super.key,
    required this.child,
    this.onPressed,
    this.size,
    this.cursor,
    this.width,
    this.height,
    this.padding,
    this.backgroundColor,
    this.hoverBackgroundColor,
    this.foregroundColor,
    this.hoverForegroundColor,
    this.autofocus = false,
    this.focusNode,
    this.pressedBackgroundColor,
    this.pressedForegroundColor,
    this.shadows,
    this.gradient,
    this.textDecoration,
    this.hoverTextDecoration,
    this.decoration,
    this.enabled = true,
    this.onLongPress,
    this.statesController,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.hoverStrategies,
    this.onHoverChange,
    this.onTapDown,
    this.onTapUp,
    this.onTapCancel,
    this.onSecondaryTapDown,
    this.onSecondaryTapUp,
    this.onSecondaryTapCancel,
    this.onLongPressStart,
    this.onLongPressCancel,
    this.onLongPressUp,
    this.onLongPressDown,
    this.onLongPressEnd,
    this.onDoubleTap,
    this.onDoubleTapDown,
    this.onDoubleTapCancel,
    this.longPressDuration,
    this.textDirection,
    this.gap,
    this.onFocusChange,
    this.orderPolicy,
    this.expands,
    this.duration = _defaultDuration,
    this.curve = _defaultCurve,
    this.reverseCurve = _defaultReverseCurve,
    this.scaleEnd = _defaultScaleEnd,
    this.opacityEnd = _defaultOpacityEnd,
  })  : variant = TurboButtonVariant.link,
        icon = null;

  static const _defaultDuration = Duration(milliseconds: 50);
  final Duration duration;
  static const _defaultCurve = Curves.fastOutSlowIn;
  final Curve curve;
  static const _defaultReverseCurve = Curves.decelerate;
  final Curve reverseCurve;
  static const _defaultScaleEnd = 0.95;
  final double scaleEnd;
  static const _defaultOpacityEnd = 0.8;
  final double opacityEnd;

  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final Widget? icon;
  final Widget? child;
  final TurboButtonVariant variant;
  final TurboButtonSize? size;

  final MouseCursor? cursor;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final Color? hoverBackgroundColor;
  final Color? foregroundColor;
  final Color? hoverForegroundColor;
  final bool autofocus;
  final FocusNode? focusNode;
  final Color? pressedBackgroundColor;
  final Color? pressedForegroundColor;
  final List<BoxShadow>? shadows;
  final Gradient? gradient;
  final TextDecoration? textDecoration;
  final TextDecoration? hoverTextDecoration;
  final TurboDecoration? decoration;
  final bool enabled;
  final TurboStatesController? statesController;

  /// {@template TurboButton.orderPolicy}
  /// The order policy of the items that compose the button, defaults to
  /// [WidgetOrderPolicy.linear()].
  /// {@endtemplate}
  final WidgetOrderPolicy? orderPolicy;

  /// {@template TurboButton.gap}
  /// The gap between the icon and the text.
  ///
  /// Defaults to `8`
  /// {@endtemplate}
  final double? gap;

  /// {@template TurboButton.mainAxisAlignment}
  /// The main axis alignment of the button.
  ///
  /// Defaults to [MainAxisAlignment.center]
  /// {@endtemplate}
  final MainAxisAlignment? mainAxisAlignment;

  /// {@template TurboButton.crossAxisAlignment}
  /// The cross axis alignment of the button.
  ///
  /// Defaults to [CrossAxisAlignment.center]
  /// {@endtemplate}
  final CrossAxisAlignment? crossAxisAlignment;

  final TurboHoverStrategies? hoverStrategies;
  final ValueChanged<bool>? onHoverChange;
  final ValueChanged<TapDownDetails>? onTapDown;
  final ValueChanged<TapUpDetails>? onTapUp;
  final VoidCallback? onTapCancel;
  final ValueChanged<TapDownDetails>? onSecondaryTapDown;
  final ValueChanged<TapUpDetails>? onSecondaryTapUp;
  final VoidCallback? onSecondaryTapCancel;
  final ValueChanged<LongPressStartDetails>? onLongPressStart;
  final VoidCallback? onLongPressCancel;
  final VoidCallback? onLongPressUp;
  final ValueChanged<LongPressDownDetails>? onLongPressDown;
  final ValueChanged<LongPressEndDetails>? onLongPressEnd;
  final VoidCallback? onDoubleTap;
  final ValueChanged<TapDownDetails>? onDoubleTapDown;
  final VoidCallback? onDoubleTapCancel;
  final Duration? longPressDuration;
  final TextDirection? textDirection;
  final ValueChanged<bool>? onFocusChange;

  /// {@template TurboButton.expands}
  /// Whether the child expands to fill the available space, defaults to false.
  /// {@endtemplate}
  final bool? expands;

  @override
  State<TurboButton> createState() => _TurboButtonState();
}

class _TurboButtonState extends State<TurboButton> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;
  late final Animation<double> _opacityAnimation;

  TurboStatesController? _statesController;
  FocusNode? _focusNode;

  TurboStatesController get statesController => widget.statesController ?? _statesController!;

  FocusNode get focusNode => widget.focusNode ?? _focusNode!;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 1,
      end: widget.scaleEnd,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: widget.curve,
        reverseCurve: widget.reverseCurve,
      ),
    );

    _opacityAnimation = Tween<double>(
      begin: 1,
      end: widget.opacityEnd,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: widget.curve,
        reverseCurve: widget.reverseCurve,
      ),
    );

    if (widget.statesController == null) {
      _statesController = TurboStatesController();
    }
    if (widget.focusNode == null) _focusNode = FocusNode();
    statesController.update(TurboButtonState.disabled, !widget.enabled);
    focusNode.addListener(onFocusChange);
  }

  @override
  void didUpdateWidget(covariant TurboButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.enabled != widget.enabled) {
      statesController.update(TurboButtonState.disabled, !widget.enabled);
    }
    if (oldWidget.focusNode != null && widget.focusNode == null) {
      oldWidget.focusNode!.removeListener(onFocusChange);
      _focusNode?.dispose();
      _focusNode = FocusNode();
      focusNode.addListener(onFocusChange);
    }
  }

  @override
  void dispose() {
    _statesController?.dispose();
    focusNode.removeListener(onFocusChange);
    _focusNode?.dispose();
    _controller.dispose();
    super.dispose();
  }

  void onFocusChange() {
    statesController.update(TurboButtonState.focused, focusNode.hasFocus);
  }

  void assertCheckHasTextOrIcon() {
    assert(
      widget.child != null || widget.icon != null,
      'Either text or icon must be provided',
    );
  }

  TurboButtonTheme buttonTheme(TurboThemeData theme) {
    return switch (widget.variant) {
      TurboButtonVariant.primary => theme.primaryButtonTheme,
      TurboButtonVariant.destructive => theme.destructiveButtonTheme,
      TurboButtonVariant.secondary => theme.secondaryButtonTheme,
      TurboButtonVariant.ghost => theme.ghostButtonTheme,
      TurboButtonVariant.outline => theme.outlineButtonTheme,
      TurboButtonVariant.link => theme.linkButtonTheme,
    };
  }

  TurboButtonSizeTheme sizeTheme(
    TurboThemeData theme,
    TurboButtonSize size,
  ) {
    if (widget.icon != null && widget.child == null) {
      return buttonTheme(theme).sizesTheme?.icon ?? theme.buttonSizesTheme.icon!;
    }
    switch (size) {
      case TurboButtonSize.sm:
        return buttonTheme(theme).sizesTheme?.sm ?? theme.buttonSizesTheme.sm!;
      case TurboButtonSize.lg:
        return buttonTheme(theme).sizesTheme?.lg ?? theme.buttonSizesTheme.lg!;
      case TurboButtonSize.regular:
        return buttonTheme(theme).sizesTheme?.regular ?? theme.buttonSizesTheme.regular!;
    }
  }

  double defaultHeightForSize(TurboThemeData theme, TurboButtonSize size) {
    return sizeTheme(theme, size).height;
  }

  double height(TurboThemeData theme) {
    if (widget.height != null) return widget.height!;
    if (buttonTheme(theme).height != null) {
      return buttonTheme(theme).height!;
    }
    if (widget.size != null) {
      return defaultHeightForSize(theme, widget.size!);
    }
    return defaultHeightForSize(
      theme,
      buttonTheme(theme).size ?? TurboButtonSize.regular,
    );
  }

  double? defaultWidthForSize(TurboThemeData theme, TurboButtonSize size) {
    return sizeTheme(theme, size).width;
  }

  double? width(TurboThemeData theme) {
    if (widget.width != null) return widget.width!;
    if (buttonTheme(theme).width != null) {
      return buttonTheme(theme).width!;
    }
    if (widget.size != null) {
      return defaultWidthForSize(theme, widget.size!);
    }
    return defaultWidthForSize(
      theme,
      buttonTheme(theme).size ?? TurboButtonSize.regular,
    );
  }

  EdgeInsetsGeometry defaultPaddingForSize(
    TurboThemeData theme,
    TurboButtonSize size,
  ) {
    return sizeTheme(theme, size).padding;
  }

  EdgeInsetsGeometry padding(TurboThemeData theme) {
    if (widget.padding != null) return widget.padding!;
    if (widget.size != null) {
      return defaultPaddingForSize(theme, widget.size!);
    }
    return defaultPaddingForSize(
      theme,
      buttonTheme(theme).size ?? TurboButtonSize.regular,
    );
  }

  Color? background(TurboThemeData theme) {
    return widget.backgroundColor ?? buttonTheme(theme).backgroundColor;
  }

  Color? hoverBackground(TurboThemeData theme) {
    return widget.hoverBackgroundColor ?? buttonTheme(theme).hoverBackgroundColor;
  }

  Color foreground(TurboThemeData theme) {
    if (widget.foregroundColor != null) return widget.foregroundColor!;

    final btnThemeForegroundColor = buttonTheme(theme).foregroundColor;
    assert(
      btnThemeForegroundColor != null,
      'Button foregroundColor is null in TurboButtonTheme',
    );
    return buttonTheme(theme).foregroundColor!;
  }

  Color hoverForeground(TurboThemeData theme) {
    if (widget.hoverForegroundColor != null) {
      return widget.hoverForegroundColor!;
    }
    final btnThemeHoverForegroundColor = buttonTheme(theme).hoverForegroundColor;
    assert(
      btnThemeHoverForegroundColor != null,
      'Button hoverForegroundColor is null in TurboButtonTheme',
    );
    return buttonTheme(theme).hoverForegroundColor!;
  }

  Color pressedBackgroundColor(TurboThemeData theme) {
    return widget.pressedBackgroundColor ?? buttonTheme(theme).pressedBackgroundColor!;
  }

  Color pressedForegroundColor(TurboThemeData theme) {
    return widget.pressedForegroundColor ?? buttonTheme(theme).pressedForegroundColor!;
  }

  TextDecoration? textDecoration(
    TurboThemeData theme, {
    required bool hovered,
  }) {
    if (hovered) {
      return widget.hoverTextDecoration ?? buttonTheme(theme).hoverTextDecoration;
    }
    return widget.textDecoration ?? buttonTheme(theme).textDecoration;
  }

  MouseCursor cursor(TurboThemeData theme) {
    if (widget.cursor != null) return widget.cursor!;
    return (widget.enabled
        ? buttonTheme(theme).cursor ?? SystemMouseCursors.click
        : MouseCursor.defer);
  }

  Gradient? gradient(TurboThemeData theme) {
    return widget.gradient ?? buttonTheme(theme).gradient;
  }

  List<BoxShadow>? shadows(TurboThemeData theme) {
    return widget.shadows ?? buttonTheme(theme).shadows;
  }

  void onTap() {
    if (widget.onPressed == null) return;
    if (!focusNode.hasFocus) FocusScope.of(context).unfocus();
    widget.onPressed!();
  }

  void _handleTapDown(TapDownDetails details) {
    _controller.forward();
    gVibrateSelection();
  }

  void _handleTapUp(TapUpDetails details) {
    _controller.reverse();
  }

  void _handlePointerCancel(PointerCancelEvent event) {
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasTurboTheme(context));
    assertCheckHasTextOrIcon();

    final theme = TurboTheme.of(context);
    final materialTheme = Theme.of(context);

    final hasPressedBackgroundColor =
        widget.pressedBackgroundColor != null || buttonTheme(theme).pressedBackgroundColor != null;
    final hasPressedForegroundColor =
        widget.pressedForegroundColor != null || buttonTheme(theme).pressedForegroundColor != null;

    final effectiveDecoration =
        (buttonTheme(theme).decoration ?? const TurboDecoration()).mergeWith(widget.decoration);

    final effectiveMainAxisAlignment = widget.mainAxisAlignment ??
        buttonTheme(theme).mainAxisAlignment ??
        MainAxisAlignment.center;

    final effectiveCrossAxisAlignment = widget.crossAxisAlignment ??
        buttonTheme(theme).crossAxisAlignment ??
        CrossAxisAlignment.center;

    final effectiveLongPressDuration =
        widget.longPressDuration ?? buttonTheme(theme).longPressDuration;

    final effectiveHoverStrategies =
        widget.hoverStrategies ?? buttonTheme(theme).hoverStrategies ?? theme.hoverStrategies;

    final effectiveTextDirection = widget.textDirection ?? buttonTheme(theme).textDirection;

    final effectiveGap = widget.gap ?? buttonTheme(theme).gap ?? 8;

    final effectiveOrderPolicy =
        widget.orderPolicy ?? buttonTheme(theme).orderPolicy ?? const WidgetOrderPolicy.linear();

    final effectiveExpands = widget.expands ?? buttonTheme(theme).expands ?? false;

    final turboButton = CallbackShortcuts(
      bindings: {
        const SingleActivator(LogicalKeyboardKey.enter): onTap,
      },
      child: ValueListenableBuilder(
        valueListenable: statesController,
        builder: (context, states, _) {
          final pressed = states.contains(TurboButtonState.pressed);
          final hovered = states.contains(TurboButtonState.hovered);
          final enabled = !states.contains(TurboButtonState.disabled);

          final effectiveBackgroundColor = hasPressedBackgroundColor && pressed
              ? pressedBackgroundColor(theme)
              : hovered
                  ? hoverBackground(theme)
                  : background(theme);

          final effectiveForegroundColor = hasPressedForegroundColor && pressed
              ? pressedForegroundColor(theme)
              : hovered
                  ? hoverForeground(theme)
                  : foreground(theme);

          final updatedDecoration = effectiveDecoration.copyWith(
            color: effectiveBackgroundColor,
            gradient: gradient(theme),
            shadows: shadows(theme),
          );

          Widget? child = widget.child == null
              ? null
              : DefaultTextStyle(
                  style: theme.textTheme.small.copyWith(
                    color: effectiveForegroundColor,
                    decoration: textDecoration(
                      theme,
                      hovered: hovered,
                    ),
                    decorationColor: foreground(theme),
                    decorationStyle: TextDecorationStyle.solid,
                  ),
                  textAlign: TextAlign.center,
                  child: widget.child!,
                );

          if (child != null && effectiveExpands) {
            child = Expanded(child: child);
          }

          return Semantics(
            container: true,
            button: true,
            focusable: enabled,
            enabled: enabled,
            child: Opacity(
              opacity: enabled ? 1 : .5,
              child: AbsorbPointer(
                absorbing: !enabled,
                child: TurboFocusable(
                  canRequestFocus: enabled,
                  autofocus: widget.autofocus,
                  focusNode: focusNode,
                  onFocusChange: widget.onFocusChange,
                  builder: (context, focused, child) => TurboDecorator(
                    decoration: updatedDecoration,
                    focused: focused,
                    child: child,
                  ),
                  child: TurboGestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onHoverChange: (value) {
                      statesController.update(TurboButtonState.hovered, value);
                      widget.onHoverChange?.call(value);
                    },
                    hoverStrategies: effectiveHoverStrategies,
                    cursor: cursor(theme),
                    onLongPress: widget.onLongPress,
                    onTap: widget.onPressed == null ? null : onTap,
                    onTapDown: (details) {
                      statesController.update(TurboButtonState.pressed, true);
                      widget.onTapDown?.call(details);
                    },
                    onTapUp: (details) {
                      statesController.update(TurboButtonState.pressed, false);
                      widget.onTapUp?.call(details);
                    },
                    onTapCancel: () {
                      statesController.update(TurboButtonState.pressed, false);
                      widget.onTapCancel?.call();
                    },
                    onSecondaryTapDown: (details) {
                      widget.onSecondaryTapDown?.call(details);
                    },
                    onSecondaryTapUp: (details) {
                      widget.onSecondaryTapUp?.call(details);
                    },
                    onSecondaryTapCancel: () {
                      widget.onSecondaryTapCancel?.call();
                    },
                    onDoubleTap: widget.onDoubleTap,
                    onDoubleTapDown: widget.onDoubleTapDown,
                    onDoubleTapCancel: widget.onDoubleTapCancel,
                    onLongPressCancel: widget.onLongPressCancel,
                    onLongPressEnd: widget.onLongPressEnd,
                    onLongPressUp: widget.onLongPressUp,
                    onLongPressDown: widget.onLongPressDown,
                    onLongPressStart: widget.onLongPressStart,
                    longPressDuration: effectiveLongPressDuration,
                    child: SizedBox(
                      height: height(theme),
                      width: width(theme),
                      child: Padding(
                        padding: padding(theme),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: effectiveCrossAxisAlignment,
                          mainAxisAlignment: effectiveMainAxisAlignment,
                          textDirection: effectiveTextDirection,
                          children: [
                            if (widget.icon != null)
                              Theme(
                                data: materialTheme.copyWith(
                                  iconTheme: materialTheme.iconTheme.copyWith(
                                    color: effectiveForegroundColor,
                                  ),
                                ),
                                child: widget.icon!,
                              ),
                            if (child != null) child,
                          ].order(effectiveOrderPolicy).separatedBy(SizedBox(width: effectiveGap)),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
    return Listener(
      onPointerDown: (_) => _handleTapDown(
        TapDownDetails(kind: PointerDeviceKind.touch),
      ),
      onPointerUp: (_) => _handleTapUp(
        TapUpDetails(kind: PointerDeviceKind.touch),
      ),
      onPointerCancel: _handlePointerCancel,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) => Transform.scale(
          scale: _scaleAnimation.value,
          child: Opacity(
            opacity: _opacityAnimation.value,
            child: turboButton,
          ),
        ),
      ),
    );
  }
}
