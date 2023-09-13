import 'dart:math';

import 'package:asp/asp.dart';

extension ReactiveListExtension<E> on Atom<List<E>> {
  List<R> cast<R>() => value.cast<R>();

  E operator [](int index) => value[index];

  void operator []=(int index, E value) =>
      this.value = this.value..[index] = value;

  set first(E value) => this.value = this.value..first = value;

  E get first => value.first;

  set last(E value) => this.value = this.value..last = value;

  E get last => value.last;

  set length(int newLength) => value = value..length = newLength;

  int get length => value.length;

  void add(E value) => this.value = this.value..add(value);

  void addAll(Iterable<E> iterable) => value = value..addAll(iterable);

  Iterable<E> get reversed => value.reversed;

  void sort([int Function(E a, E b)? compare]) => value = value..sort(compare);

  void shuffle([Random? random]) => value = value..shuffle(random);

  int indexOf(E element, [int start = 0]) => value.indexOf(element, start);

  int indexWhere(bool Function(E element) test, [int start = 0]) =>
      value.indexWhere(test, start);

  int lastIndexWhere(bool Function(E element) test, [int? start]) =>
      value.lastIndexWhere(test, start);

  int lastIndexOf(E element, [int? start]) => value.lastIndexOf(element, start);

  void clear() => value = value..clear();

  void insert(int index, E element) => value = value..insert(index, element);

  void insertAll(int index, Iterable<E> iterable) =>
      value = value..insertAll(index, iterable);

  void setAll(int index, Iterable<E> iterable) =>
      value = value..setAll(index, iterable);

  bool remove(Object? value) {
    final modifiedValue = this.value;
    final element = modifiedValue.remove(value);
    this.value = modifiedValue;
    return element;
  }

  E removeAt(int index) {
    final modifiedValue = value;
    final element = modifiedValue.removeAt(index);
    value = modifiedValue;
    return element;
  }

  E removeLast() {
    final modifiedValue = value;
    final element = modifiedValue.removeLast();
    value = modifiedValue;
    return element;
  }

  void removeWhere(bool Function(E element) test) =>
      value = value..removeWhere(test);

  void retainWhere(bool Function(E element) test) =>
      value = value..retainWhere(test);

  List<E> operator +(List<E> other) => value + other;

  List<E> sublist(int start, [int? end]) => value.sublist(start, end);

  Iterable<E> getRange(int start, int end) => value.getRange(start, end);

  void setRange(
    int start,
    int end,
    Iterable<E> iterable, [
    int skipCount = 0,
  ]) =>
      value = value..setRange(start, end, iterable, skipCount);

  void removeRange(int start, int end) =>
      value = value..removeRange(start, end);

  void fillRange(int start, int end, [E? fillValue]) =>
      value = value..fillRange(start, end);

  void replaceRange(int start, int end, Iterable<E> replacements) =>
      value = value..replaceRange(start, end, replacements);

  Map<int, E> asMap() => value.asMap();
}
