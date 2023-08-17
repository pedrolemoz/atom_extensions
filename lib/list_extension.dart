// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'dart:math';

import 'package:asp/asp.dart';

extension ListExtension<T> on Atom<List<T>> {
  Iterable<T> get reversed => value.reversed;

  Iterable<T> getRange(int start, int end) => value.getRange(start, end);

  void replaceRange(int start, int end, Iterable<T> newContents) {
    value.replaceRange(start, end, newContents);
    notifyListeners();
  }

  void setRange(int start, int end, Iterable<T> iterable, [int skipCount = 0]) {
    value.setRange(start, end, iterable, skipCount);
    notifyListeners();
  }

  void fillRange(int start, int end, [T? fill]) {
    value.fillRange(start, end, fill);
    notifyListeners();
  }

  void add(T element) {
    value.add(element);
    notifyListeners();
  }

  void addAll(Iterable<T> iterable) {
    value.addAll(iterable);
    notifyListeners();
  }

  bool remove(T element) {
    final removed = value.remove(element);
    if (removed) {
      notifyListeners();
    }
    return removed;
  }

  T removeAt(int index) {
    final removed = value.removeAt(index);
    notifyListeners();
    return removed;
  }

  T removeLast() {
    final removed = value.removeLast();
    notifyListeners();
    return removed;
  }

  void removeRange(int start, int end) {
    value.removeRange(start, end);
    notifyListeners();
  }

  void removeWhere(bool Function(T) test) {
    value.removeWhere(test);
    notifyListeners();
  }

  void insert(int index, T element) {
    value.insert(index, element);
    notifyListeners();
  }

  void insertAll(int index, Iterable<T> iterable) {
    value.insertAll(index, iterable);
    notifyListeners();
  }

  void setAll(int index, Iterable<T> iterable) {
    value.setAll(index, iterable);
    notifyListeners();
  }

  void shuffle([Random? random]) {
    value.shuffle(random);
    notifyListeners();
  }

  void sort([int Function(T, T)? compare]) {
    value.sort(compare);
    notifyListeners();
  }

  List<T> sublist(int start, [int? end]) {
    return value.sublist(start, end);
  }

  void clear() {
    value.clear();
    notifyListeners();
  }

  List<T> operator +(List<T> other) {
    final newList = value + other;
    return newList;
  }

  T operator [](int index) {
    return value[index];
  }

  void operator []=(int index, T other) {
    value[index] = other;
    notifyListeners();
  }

  set length(int other) {
    value.length = other;
    notifyListeners();
  }
}
