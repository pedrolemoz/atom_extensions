import 'package:asp/asp.dart';

extension AtomIterableTransformerExtension<E> on Iterable<E> {
  Atom<Iterable<E>> createAtom() => Atom<Iterable<E>>(this);
}

extension AtomListTransformerExtension<E> on List<E> {
  Atom<List<E>> createAtom() => Atom<List<E>>(this);
}

extension AtomSetTransformerExtension<E> on Set<E> {
  Atom<Set<E>> createAtom() => Atom<Set<E>>(this);
}

extension AtomMapTransformerExtension<K, V> on Map<K, V> {
  Atom<Map<K, V>> createAtom() => Atom<Map<K, V>>(this);
}
