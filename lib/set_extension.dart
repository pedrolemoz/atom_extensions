// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:asp/asp.dart';

extension SetExtension<T> on Atom<Set<T>> {
  bool add(T value) {
    final result = this.value.add(value);
    if (result) {
      notifyListeners();
    }
    return result;
  }

  bool contains(Object? element) {
    return this.value.contains(element);
  }

  T? lookup(Object? element) {
    return this.value.lookup(element);
  }

  bool remove(Object? value) {
    final result = this.value.remove(value);
    if (result) {
      notifyListeners();
    }
    return result;
  }

  void clear() {
    this.value.clear();
    notifyListeners();
  }

  Set<T> toSet() => this.value;
}
