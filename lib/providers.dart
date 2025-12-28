import 'package:flutter_riverpod/flutter_riverpod.dart';

// counter state notifier for the app
final counterController = NotifierProvider<CounterNotifier, int>(CounterNotifier.new);

class CounterNotifier extends Notifier<int> {
  @override
  int build() {
    return 0;
  }

  void add() {
    state = state + 1;
  }

  void subtract() {
    state = state - 1;
  }
}