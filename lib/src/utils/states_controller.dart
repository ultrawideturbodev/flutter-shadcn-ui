import 'package:flutter/widgets.dart';

enum TurboButtonState {
  focused,
  hovered,
  pressed,
  disabled,
}

class TurboStatesController extends ValueNotifier<Set<TurboButtonState>> {
  TurboStatesController([Set<TurboButtonState>? value]) : super(<TurboButtonState>{...?value});

  /// Adds [state] to [value] if [add] is true, and removes it otherwise,
  /// and notifies listeners if [value] has changed.
  void update(TurboButtonState state, bool add) {
    final valueChanged = add ? value.add(state) : value.remove(state);
    if (valueChanged) {
      notifyListeners();
    }
  }
}
