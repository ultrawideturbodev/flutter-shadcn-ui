---
description: Planning Template - How we document and track project planning and execution
globs: lib/src/components/button.dart
---

# 🎯 1. Goal(s)
*Clear specific outcome(s) we aim to achieve.*
---

- 1.1. Add scale animation to ShadButton that shrinks the button when pressed
- 1.2. Add opacity animation to ShadButton that fades the button when pressed
- 1.3. Make both animations configurable through simple parameters

# 📚 2. Context
> *Important information relevant to the plan.*

- 2.1. ShadButton uses a custom ShadGestureDetector for interactions
- 2.2. The gesture detector already handles tap events and hover states
- 2.3. We need to integrate with existing gesture callbacks
- 2.4. The button uses a theme system for customization

# 🎓 3. Assumptions
> *List of critical assumptions that need validation before proceeding.*

- 3.1. The scale animation should be centered
- 3.2. Both animations should run simultaneously
- 3.3. Default values should be: no scale (1.0) and no opacity change (1.0)
- 3.4. The animations should work with the existing gesture system
- 3.5. The animations should not interfere with hover states

# ❓ 4. Questions
> *Specific questions about implementation details that need answers.*

- [ ] 4.1. Should the animations be configurable through the theme system?
- [ ] 4.2. Should we add duration parameter for the animations?
- [ ] 4.3. Should we add curve parameters for the animations?

# 🪜 5. Plan
> *Detailed step-by-step actions required to achieve the goal.*

# 🎯 Main Objective: Implement Scale and Opacity Animations in ShadButton

- [ ] 1. Add animation parameters to ShadButton
  - [ ] 1.1. Add scale parameter
    ```dart
    final double? scale;
    ```
  - [ ] 1.2. Add opacity parameter
    ```dart
    final double? opacity;
    ```
  - [ ] 1.3. Update all constructors to include new parameters

- [ ] 2. Add animation controllers to _ShadButtonState
  - [ ] 2.1. Add mixin and controllers
    ```dart
    class _ShadButtonState extends State<ShadButton> with SingleTickerProviderStateMixin {
      late final AnimationController _controller;
      late final Animation<double> _scaleAnimation;
      late final Animation<double> _opacityAnimation;
    }
    ```
  - [ ] 2.2. Initialize animations in initState
    ```dart
    @override
    void initState() {
      super.initState();
      _controller = AnimationController(
        duration: const Duration(milliseconds: 100),
        vsync: this,
      );
      _scaleAnimation = Tween<double>(
        begin: 1.0,
        end: widget.scale ?? 1.0,
      ).animate(_controller);
      _opacityAnimation = Tween<double>(
        begin: 1.0,
        end: widget.opacity ?? 1.0,
      ).animate(_controller);
    }
    ```

- [ ] 3. Update existing tap handlers
  - [ ] 3.1. Modify onTapDown callback
    ```dart
    void _handleTapDown(TapDownDetails details) {
      if (!widget.enabled) return;
      _controller.forward();
      widget.onTapDown?.call(details);
    }
    ```
  - [ ] 3.2. Modify onTapUp callback
    ```dart
    void _handleTapUp(TapUpDetails details) {
      if (!widget.enabled) return;
      _controller.reverse();
      widget.onTapUp?.call(details);
    }
    ```
  - [ ] 3.3. Modify onTapCancel callback
    ```dart
    void _handleTapCancel() {
      if (!widget.enabled) return;
      _controller.reverse();
      widget.onTapCancel?.call();
    }
    ```

- [ ] 4. Update build method
  - [ ] 4.1. Wrap ShadGestureDetector child with animations
    ```dart
    return ShadGestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      // ... other existing properties ...
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: FadeTransition(
          opacity: _opacityAnimation,
          child: /* existing button content */
        ),
      ),
    );
    ```

- [ ] 5. Clean up resources
  - [ ] 5.1. Add dispose method
    ```dart
    @override
    void dispose() {
      _controller.dispose();
      super.dispose();
    }
    ``` 