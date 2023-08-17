// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:asp/asp.dart';

extension MapExtension<K, V> on Atom<Map<K, V>> {
  void addAll(Map<K, V> other) {
    other.forEach((K key, V value) {
      this.value[key] = value;
    });
    notifyListeners();
  }

  V? operator [](Object? key) {
    return this.value[key];
  }

  void operator []=(K key, V value) {
    this.value[key] = value;
    notifyListeners();
  }

  void clear() {
    this.value.clear();
    notifyListeners();
  }

  Iterable<K> get keys {
    return this.value.keys;
  }

  V? remove(Object? key) {
    final result = this.value.remove(key);
    if (result != null) {
      notifyListeners();
    }
    return result;
  }
}
