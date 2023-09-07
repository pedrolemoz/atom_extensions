import 'package:asp/asp.dart';

extension ReactiveIterableExtension<E> on Atom<Iterable<E>> {
  Iterator<E> get iterator => value.iterator;

  Iterable<R> cast<R>() => value.cast<R>();

  Iterable<E> followedBy(Iterable<E> other) => value.followedBy(other);

  Iterable<T> map<T>(T Function(E e) toElement) => value.map<T>(toElement);

  Iterable<E> where(bool Function(E element) test) => value.where(test);

  Iterable<T> whereType<T>() => value.whereType<T>();

  Iterable<T> expand<T>(Iterable<T> Function(E element) toElements) =>
      value.expand<T>(toElements);

  bool contains(Object? element) => value.contains(element);

  void forEach(void Function(E element) action) => value.forEach(action);

  E reduce(E Function(E value, E element) combine) => value.reduce(combine);

  T fold<T>(T initialValue, T Function(T previousValue, E element) combine) =>
      value.fold<T>(initialValue, combine);

  bool every(bool Function(E element) test) => value.every(test);

  String join([String separator = '']) => value.join(separator);

  bool any(bool Function(E element) test) => value.any(test);

  List<E> toList({bool growable = true}) => value.toList(growable: growable);

  Set<E> toSet() => value.toSet();

  int get length => value.length;

  bool get isEmpty => value.isEmpty;

  bool get isNotEmpty => value.isNotEmpty;

  Iterable<E> take(int count) => value.take(count);

  Iterable<E> takeWhile(bool Function(E value) test) => value.takeWhile(test);

  Iterable<E> skip(int count) => value.skip(count);

  Iterable<E> skipWhile(bool Function(E value) test) => value.skipWhile(test);

  E get first => value.first;

  E get last => value.last;

  E get single => value.single;

  E firstWhere(bool Function(E element) test, {E Function()? orElse}) =>
      value.firstWhere(test, orElse: orElse);

  E lastWhere(bool Function(E element) test, {E Function()? orElse}) =>
      value.lastWhere(test, orElse: orElse);

  E singleWhere(bool Function(E element) test, {E Function()? orElse}) =>
      value.singleWhere(test, orElse: orElse);

  E elementAt(int index) => value.elementAt(index);
}
