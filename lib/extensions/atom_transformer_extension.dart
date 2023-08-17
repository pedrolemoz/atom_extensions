import 'package:asp/asp.dart';

extension AtomIterableTransformerExtension<T> on Iterable<T> {
  Atom<Iterable<T>> createAtom() => Atom<Iterable<T>>(this);
}

extension AtomListTransformerExtension<T> on List<T> {
  Atom<List<T>> createAtom() => Atom<List<T>>(this);
}

extension AtomSetTransformerExtension<T> on Set<T> {
  Atom<Set<T>> createAtom() => Atom<Set<T>>(this);
}

extension AtomMapTransformerExtension<K, V> on Map<K, V> {
  Atom<Map<K, V>> createAtom() => Atom<Map<K, V>>(this);
}
