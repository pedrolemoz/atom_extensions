import 'package:asp/asp.dart';

extension ReactiveSetExtension<E> on Atom<Set<E>> {
  Set<R> cast<R>() => value.cast<R>();

  bool add(E value) {
    final modifiedValue = this.value;
    final result = modifiedValue.add(value);
    this.value = modifiedValue;
    return result;
  }

  void addAll(Iterable<E> elements) => value = value..addAll(elements);

  bool remove(Object? value) {
    final modifiedValue = this.value;
    final result = modifiedValue.remove(value);
    this.value = modifiedValue;
    return result;
  }

  E? lookup(Object? object) {
    final modifiedValue = value;
    final result = modifiedValue.lookup(object);
    value = modifiedValue;
    return result;
  }

  void removeAll(Iterable<Object?> elements) =>
      value = value..removeAll(elements);

  void retainAll(Iterable<Object?> elements) =>
      value = value..retainAll(elements);

  void removeWhere(bool Function(E element) test) =>
      value = value..removeWhere(test);

  void retainWhere(bool Function(E element) test) =>
      value = value..removeWhere(test);

  bool containsAll(Iterable<Object?> other) {
    final modifiedValue = value;
    final result = modifiedValue.containsAll(other);
    value = modifiedValue;
    return result;
  }

  Set<E> intersection(Set<Object?> other) => value.intersection(other);

  Set<E> union(Set<E> other) => value.union(other);

  Set<E> difference(Set<Object?> other) => value.difference(other);

  void clear() => value = value..clear();

  Set<E> toSet() => value.toSet();
}
