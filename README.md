# Atom Extensions

This package is meant to be a helper for ASP (Atomic State Pattern) in Dart.

Since ASP package deprecated `RxList`, `RxSet` and `RxMap` classes, this package aims to simplify the usage of collections in ASP.

For example, without Atom Extensions, you would write:

```dart
final myReactiveList = Atom<List<String>>([]);
final newList = myReactiveList.value;
newList.add('Pedro Lemos');
myReactiveList.setValue(newList);
```

With ASP, the same behavior is reduced to:

```dart
final myReactiveList = <String>[].createAtom();
myReactiveList.add('Pedro Lemos');
```