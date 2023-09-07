import 'package:asp/asp.dart';

extension ReactiveMapExtension<K, V> on Atom<Map<K, V>> {
  Map<RK, RV> cast<RK, RV>() => value.cast<RK, RV>();

  bool containsValue(Object? value) => this.value.containsValue(value);

  bool containsKey(Object? key) => value.containsKey(key);

  V? operator [](Object? key) => value[key];

  void operator []=(K key, V value) => this.value = this.value..[key] = value;

  Iterable<MapEntry<K, V>> get entries => value.entries;

  Map<K2, V2> map<K2, V2>(MapEntry<K2, V2> Function(K key, V value) convert) =>
      value.map(convert);

  void addEntries(Iterable<MapEntry<K, V>> newEntries) =>
      value = value..addEntries(newEntries);

  V update(K key, V Function(V value) update, {V Function()? ifAbsent}) {
    final modifiedValue = value;
    final element = modifiedValue.update(key, update, ifAbsent: ifAbsent);
    value = modifiedValue;
    return element;
  }

  void updateAll(V Function(K key, V value) update) =>
      value = value..updateAll(update);

  void removeWhere(bool Function(K key, V value) test) =>
      value = value..removeWhere(test);

  V putIfAbsent(K key, V Function() ifAbsent) {
    final modifiedValue = value;
    final element = modifiedValue.putIfAbsent(key, ifAbsent);
    value = modifiedValue;
    return element;
  }

  void addAll(Map<K, V> other) => value = value..addAll(other);

  V? remove(Object? key) {
    final modifiedValue = value;
    final element = modifiedValue.remove(key);
    value = modifiedValue;
    return element;
  }

  void clear() => value = value..clear();

  void forEach(void Function(K key, V value) action) => value.forEach(action);

  Iterable<K> get keys => value.keys;

  Iterable<V> get values => value.values;

  int get length => value.length;

  bool get isEmpty => value.isEmpty;

  bool get isNotEmpty => value.isNotEmpty;
}
