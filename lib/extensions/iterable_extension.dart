// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:asp/asp.dart';

extension IterableExtension<T> on Atom<Iterable<T>> {
  int get length => value.length;

  T get first => value.first;

  T get last => value.last;

  bool get isEmpty => value.isEmpty;

  bool get isNotEmpty => value.isNotEmpty;

  Iterator<T> get iterator => value.iterator;

  T get single => value.single;

  T singleWhere(bool Function(T) test, {T Function()? orElse}) {
    return value.singleWhere(test, orElse: orElse);
  }

  Iterable<T> skip(int count) {
    return value.skip(count);
  }

  Iterable<T> skipWhile(bool Function(T) test) {
    return value.skipWhile(test);
  }

  void forEach(void Function(T) action) {
    value.forEach(action);
  }
}
