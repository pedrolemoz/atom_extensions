# Atom Extensions

This package is meant to be an helper for ASP (Atomic State Pattern) in Dart.

Since ASP package has deprecated `RxList`, `RxSet` and `RxMap` classes, this package aims to simplify the usage of collections in ASP.

For example, without Atom Extensions, you would write:

```dart
final myReactiveList = Atom<List<int>>([]);
final newList = myReactiveList.value;
newList.add('Pedro Lemos');
myReactiveList.setValue(newList);
```

With ASP, the same behavior is reduced to:

```dart
final myReactiveList = Atom<List<int>>([]);
myReactiveList.add('Pedro Lemos');
```
