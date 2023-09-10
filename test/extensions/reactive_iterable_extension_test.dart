import 'package:asp/asp.dart';
import 'package:atom_extensions/atom_extensions.dart';
import 'package:test/test.dart';

void main() {
  test('cast: Should cast Iterable<num> to Iterable<int> as expected', () {
    final iterable = Iterable<num>.generate(
      10,
      (index) => index,
    ).createAtom();

    var interactions = 0;

    rxObserver(
      () => iterable.value,
      effect: (value) => interactions++,
    );

    final castIterable = iterable.cast<int>();

    expect(
      interactions,
      isA<int>().having((value) => value, 'No interactions detected', 0),
    );
    expect(iterable, isA<Atom<Iterable<num>>>());
    expect(castIterable, isA<Iterable<int>>());
  });

  test('followedBy: Should lazy concatenate two Iterables as expected', () {
    final iterable = Iterable<int>.generate(
      5,
      (index) => index,
    ).createAtom();

    final anotherIterable = Iterable<int>.generate(
      5,
      (index) => index * 10,
    );

    var interactions = 0;

    rxObserver(
      () => iterable.value,
      effect: (value) => interactions++,
    );

    final concatenationIterable = iterable.followedBy(anotherIterable);

    expect(
      interactions,
      isA<int>().having((value) => value, 'No interactions detected', 0),
    );
    expect(iterable, isA<Atom<Iterable<int>>>());
    expect(
      concatenationIterable,
      isA<Iterable<int>>().having(
        (iterable) => iterable,
        'Has the correct values',
        [0, 1, 2, 3, 4, 0, 10, 20, 30, 40],
      ),
    );
  });

  test(
      'map: Should transform Iterable<int> into a Iterable<double> as expected',
      () {
    final iterable = Iterable<int>.generate(
      10,
      (index) => index,
    ).createAtom();

    var interactions = 0;

    rxObserver(
      () => iterable.value,
      effect: (value) => interactions++,
    );

    final doubleIterable = iterable.map<double>((e) => e.toDouble());

    expect(
      interactions,
      isA<int>().having((value) => value, 'No interactions detected', 0),
    );
    expect(iterable, isA<Atom<Iterable<int>>>());
    expect(
      doubleIterable,
      isA<Iterable<double>>().having(
        (iterable) => iterable,
        'Has the correct values',
        [0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0],
      ),
    );
  });

  test('where: Should return odd numbers from a Iterable<int> as expected', () {
    final iterable = Iterable<int>.generate(
      10,
      (index) => index,
    ).createAtom();

    var interactions = 0;

    rxObserver(
      () => iterable.value,
      effect: (value) => interactions++,
    );

    final oddIterable = iterable.where((e) => e.isOdd);

    expect(
      interactions,
      isA<int>().having((value) => value, 'No interactions detected', 0),
    );
    expect(iterable, isA<Atom<Iterable<int>>>());
    expect(
      oddIterable,
      isA<Iterable<int>>().having(
        (iterable) => iterable,
        'Has the correct values',
        [1, 3, 5, 7, 9],
      ),
    );
  });

  test('whereType: Should return integers from a Iterable<num> as expected',
      () {
    final iterable = Iterable<num>.generate(
      10,
      (index) => index.isOdd ? index.toDouble() : index,
    ).createAtom();

    var interactions = 0;

    rxObserver(
      () => iterable.value,
      effect: (value) => interactions++,
    );

    final integersIterable = iterable.whereType<int>();

    expect(
      interactions,
      isA<int>().having((value) => value, 'No interactions detected', 0),
    );
    expect(iterable, isA<Atom<Iterable<num>>>());
    expect(
      integersIterable,
      isA<Iterable<int>>().having(
        (iterable) => iterable,
        'Has the correct values',
        [0, 2, 4, 6, 8],
      ),
    );
  });

  test('expand: Should expand Iterable<int> using [e, e + 1] as expected', () {
    final iterable = Iterable<int>.generate(5, (index) => index).createAtom();

    var interactions = 0;

    rxObserver(
      () => iterable.value,
      effect: (value) => interactions++,
    );

    final expandedIterable = iterable.expand<int>((e) => [e, e + 1]);

    expect(
      interactions,
      isA<int>().having((value) => value, 'No interactions detected', 0),
    );
    expect(iterable, isA<Atom<Iterable<int>>>());
    expect(
      expandedIterable,
      isA<Iterable<int>>().having(
        (iterable) => iterable,
        'Has the correct values',
        [0, 1, 1, 2, 2, 3, 3, 4, 4, 5],
      ),
    );
  });

  test('contains: Should contain the element in Iterable<int> as expected', () {
    final iterable = Iterable<int>.generate(5, (index) => index).createAtom();

    var interactions = 0;

    rxObserver(
      () => iterable.value,
      effect: (value) => interactions++,
    );

    final result = iterable.contains(0);

    expect(
      interactions,
      isA<int>().having((value) => value, 'No interactions detected', 0),
    );
    expect(iterable, isA<Atom<Iterable<int>>>());
    expect(result, true);
  });

  test('forEach: Should iterate over Iterable<int> as expected', () {
    final iterable = Iterable<int>.generate(5, (index) => index).createAtom();

    var interactions = 0;

    rxObserver(
      () => iterable.value,
      effect: (value) => interactions++,
    );

    final elements = [];

    iterable.forEach(elements.add);

    expect(
      interactions,
      isA<int>().having((value) => value, 'No interactions detected', 0),
    );
    expect(iterable, isA<Atom<Iterable<int>>>());
    expect(elements, [0, 1, 2, 3, 4]);
  });

  test('reduce: Should sum all elements in Iterable<int> as expected', () {
    final iterable = Iterable<int>.generate(5, (index) => index).createAtom();

    var interactions = 0;

    rxObserver(
      () => iterable.value,
      effect: (value) => interactions++,
    );

    final result = iterable.reduce((a, b) => a += b);

    expect(
      interactions,
      isA<int>().having((value) => value, 'No interactions detected', 0),
    );
    expect(iterable, isA<Atom<Iterable<int>>>());
    expect(result, 10);
  });

  test('fold: Should combine elements in Iterable<int> as expected', () {
    final iterable = Iterable<int>.generate(5, (index) => index).createAtom();

    var interactions = 0;

    rxObserver(
      () => iterable.value,
      effect: (value) => interactions++,
    );

    final result = iterable.fold(100, (a, b) => a += b);

    expect(
      interactions,
      isA<int>().having((value) => value, 'No interactions detected', 0),
    );
    expect(iterable, isA<Atom<Iterable<int>>>());
    expect(result, 110);
  });

  test(
      'every: Should verify if every element in Iterable<int> is satisfied by a condition as expected',
      () {
    final iterable = Iterable<int>.generate(5, (index) => index).createAtom();

    var interactions = 0;

    rxObserver(
      () => iterable.value,
      effect: (value) => interactions++,
    );

    final result = iterable.every((e) => e < 5);

    expect(
      interactions,
      isA<int>().having((value) => value, 'No interactions detected', 0),
    );
    expect(iterable, isA<Atom<Iterable<int>>>());
    expect(result, true);
  });

  test(
      'join: Should join all elements in Iterable<int> using a separator as expected',
      () {
    final iterable = Iterable<int>.generate(5, (index) => index).createAtom();

    var interactions = 0;

    rxObserver(
      () => iterable.value,
      effect: (value) => interactions++,
    );

    final result = iterable.join(' => ');

    expect(
      interactions,
      isA<int>().having((value) => value, 'No interactions detected', 0),
    );
    expect(iterable, isA<Atom<Iterable<int>>>());
    expect(result, '0 => 1 => 2 => 3 => 4');
  });

  test(
      'any: Should verify if any element in Iterable<int> is satisfied by a condition as expected',
      () {
    final iterable = Iterable<int>.generate(5, (index) => index).createAtom();

    var interactions = 0;

    rxObserver(
      () => iterable.value,
      effect: (value) => interactions++,
    );

    final result = iterable.any((e) => e >= 0);

    expect(
      interactions,
      isA<int>().having((value) => value, 'No interactions detected', 0),
    );
    expect(iterable, isA<Atom<Iterable<int>>>());
    expect(result, true);
  });

  test('toList: Should return a List<int> from a Iterable<int> as expected',
      () {
    final iterable = Iterable<int>.generate(5, (index) => index).createAtom();

    var interactions = 0;

    rxObserver(
      () => iterable.value,
      effect: (value) => interactions++,
    );

    final listOfIntegers = iterable.toList();

    expect(
      interactions,
      isA<int>().having((value) => value, 'No interactions detected', 0),
    );
    expect(iterable, isA<Atom<Iterable<int>>>());
    expect(
      listOfIntegers,
      isA<List<int>>().having(
        (values) => values,
        'Has the correct values',
        [0, 1, 2, 3, 4],
      ),
    );
  });

  test('toSet: Should return a Set<int> from a Iterable<int> as expected', () {
    final iterable = Iterable<int>.generate(5, (index) => index).createAtom();

    var interactions = 0;

    rxObserver(
      () => iterable.value,
      effect: (value) => interactions++,
    );

    final setOfIntegers = iterable.toSet();

    expect(
      interactions,
      isA<int>().having((value) => value, 'No interactions detected', 0),
    );
    expect(iterable, isA<Atom<Iterable<int>>>());
    expect(
      setOfIntegers,
      isA<Set<int>>().having(
        (values) => values,
        'Has the correct values',
        {0, 1, 2, 3, 4},
      ),
    );
  });

  test('length: Should return the correct length of Iterable<int>', () {
    final iterable = Iterable<int>.generate(5, (index) => index).createAtom();

    var interactions = 0;

    rxObserver(
      () => iterable.value,
      effect: (value) => interactions++,
    );

    final value = iterable.length;

    expect(
      interactions,
      isA<int>().having((value) => value, 'No interactions detected', 0),
    );
    expect(iterable, isA<Atom<Iterable<int>>>());
    expect(value, 5);
  });

  test('isEmpty: Should return the true if Iterable<int> is empty', () {
    final iterable = const Iterable<int>.empty().createAtom();

    var interactions = 0;

    rxObserver(
      () => iterable.value,
      effect: (value) => interactions++,
    );

    final result = iterable.isEmpty;

    expect(
      interactions,
      isA<int>().having((value) => value, 'No interactions detected', 0),
    );
    expect(iterable, isA<Atom<Iterable<int>>>());
    expect(result, true);
  });

  test('isNotEmpty: Should return the true if Iterable<int> is not empty', () {
    final iterable = Iterable<int>.generate(5, (index) => index).createAtom();

    var interactions = 0;

    rxObserver(
      () => iterable.value,
      effect: (value) => interactions++,
    );

    final result = iterable.isNotEmpty;

    expect(
      interactions,
      isA<int>().having((value) => value, 'No interactions detected', 0),
    );
    expect(iterable, isA<Atom<Iterable<int>>>());
    expect(result, true);
  });

  test('take: Should return 10 items from Iterable<int> as expected', () {
    final iterable = Iterable<int>.generate(50, (index) => index).createAtom();

    var interactions = 0;

    rxObserver(
      () => iterable.value,
      effect: (value) => interactions++,
    );

    final iterableOfIntegers = iterable.take(10);

    expect(
      interactions,
      isA<int>().having((value) => value, 'No interactions detected', 0),
    );
    expect(iterable, isA<Atom<Iterable<int>>>());
    expect(
      iterableOfIntegers,
      isA<Iterable<int>>().having(
        (values) => values.length,
        'Has the correct amount of items',
        10,
      ),
    );
  });

  test(
      'takeWhile: Should return all items from Iterable<int> that match a certain condition as expected',
      () {
    final iterable = Iterable<int>.generate(50, (index) => index).createAtom();

    var interactions = 0;

    rxObserver(
      () => iterable.value,
      effect: (value) => interactions++,
    );

    final iterableOfNaturals = iterable.takeWhile((e) => e < 10);

    expect(
      interactions,
      isA<int>().having((value) => value, 'No interactions detected', 0),
    );
    expect(iterable, isA<Atom<Iterable<int>>>());
    expect(
      iterableOfNaturals,
      isA<Iterable<int>>().having(
        (values) => values,
        'Has the correct values',
        [0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
      ),
    );
  });

  test('skip: Should skip 10 items from Iterable<int> as expected', () {
    final iterable = Iterable<int>.generate(10, (index) => index).createAtom();

    var interactions = 0;

    rxObserver(
      () => iterable.value,
      effect: (value) => interactions++,
    );

    final iterableSubset = iterable.skip(5);

    expect(
      interactions,
      isA<int>().having((value) => value, 'No interactions detected', 0),
    );
    expect(iterable, isA<Atom<Iterable<int>>>());
    expect(
      iterableSubset,
      isA<Iterable<int>>().having(
        (values) => values,
        'Has the correct values',
        [5, 6, 7, 8, 9],
      ),
    );
  });

  test(
      'skipWhile: Should skip all items from Iterable<int> that match a certain condition as expected',
      () {
    final iterable = Iterable<int>.generate(20, (index) => index).createAtom();

    var interactions = 0;

    rxObserver(
      () => iterable.value,
      effect: (value) => interactions++,
    );

    final iterableSubset = iterable.skipWhile((e) => e < 10);

    expect(
      interactions,
      isA<int>().having((value) => value, 'No interactions detected', 0),
    );
    expect(iterable, isA<Atom<Iterable<int>>>());
    expect(
      iterableSubset,
      isA<Iterable<int>>().having(
        (values) => values,
        'Has the correct values',
        [10, 11, 12, 13, 14, 15, 16, 17, 18, 19],
      ),
    );
  });

  test('first: Should return the first element of Iterable<int>', () {
    final iterable = Iterable<int>.generate(5, (index) => index).createAtom();

    var interactions = 0;

    rxObserver(
      () => iterable.value,
      effect: (value) => interactions++,
    );

    final value = iterable.first;

    expect(
      interactions,
      isA<int>().having((value) => value, 'No interactions detected', 0),
    );
    expect(iterable, isA<Atom<Iterable<int>>>());
    expect(value, 0);
  });

  test('last: Should return the last element of Iterable<int>', () {
    final iterable = Iterable<int>.generate(5, (index) => index).createAtom();

    var interactions = 0;

    rxObserver(
      () => iterable.value,
      effect: (value) => interactions++,
    );

    final value = iterable.last;

    expect(
      interactions,
      isA<int>().having((value) => value, 'No interactions detected', 0),
    );
    expect(iterable, isA<Atom<Iterable<int>>>());
    expect(value, 4);
  });

  test('single: Should return the unique element of Iterable<int>', () {
    final iterable = Iterable<int>.generate(1, (index) => index).createAtom();

    var interactions = 0;

    rxObserver(
      () => iterable.value,
      effect: (value) => interactions++,
    );

    final value = iterable.single;

    expect(
      interactions,
      isA<int>().having((value) => value, 'No interactions detected', 0),
    );
    expect(iterable, isA<Atom<Iterable<int>>>());
    expect(value, 0);
  });

  test(
      'firstWhere: Should return the first odd number from a Iterable<int> as expected',
      () {
    final iterable = Iterable<int>.generate(
      10,
      (index) => index,
    ).createAtom();

    var interactions = 0;

    rxObserver(
      () => iterable.value,
      effect: (value) => interactions++,
    );

    final oddNumber = iterable.firstWhere((e) => e.isOdd);

    expect(
      interactions,
      isA<int>().having((value) => value, 'No interactions detected', 0),
    );
    expect(iterable, isA<Atom<Iterable<int>>>());
    expect(
      oddNumber,
      isA<int>().having(
        (value) => value,
        'Has the correct value',
        1,
      ),
    );
  });

  test(
      'lastWhere: Should return the last odd number from a Iterable<int> as expected',
      () {
    final iterable = Iterable<int>.generate(
      10,
      (index) => index,
    ).createAtom();

    var interactions = 0;

    rxObserver(
      () => iterable.value,
      effect: (value) => interactions++,
    );

    final oddNumber = iterable.lastWhere((e) => e.isOdd);

    expect(
      interactions,
      isA<int>().having((value) => value, 'No interactions detected', 0),
    );
    expect(iterable, isA<Atom<Iterable<int>>>());
    expect(
      oddNumber,
      isA<int>().having(
        (value) => value,
        'Has the correct value',
        9,
      ),
    );
  });

  test(
      'singleWhere: Should return the unique element of Iterable<int> that satisfied the condition as expected',
      () {
    final iterable = Iterable<int>.generate(
      1,
      (index) => index + 1,
    ).createAtom();

    var interactions = 0;

    rxObserver(
      () => iterable.value,
      effect: (value) => interactions++,
    );

    final oddNumber = iterable.singleWhere((e) => e.isOdd);

    expect(
      interactions,
      isA<int>().having((value) => value, 'No interactions detected', 0),
    );
    expect(iterable, isA<Atom<Iterable<int>>>());
    expect(
      oddNumber,
      isA<int>().having(
        (value) => value,
        'Has the correct value',
        1,
      ),
    );
  });

  test(
      'elementAt: Should return element at position 10 of Iterable<int> as expected',
      () {
    final iterable = Iterable<int>.generate(
      50,
      (index) => index,
    ).createAtom();

    var interactions = 0;

    rxObserver(
      () => iterable.value,
      effect: (value) => interactions++,
    );

    final element = iterable.elementAt(10);

    expect(
      interactions,
      isA<int>().having((value) => value, 'No interactions detected', 0),
    );
    expect(iterable, isA<Atom<Iterable<int>>>());
    expect(
      element,
      isA<int>().having(
        (value) => value,
        'Has the correct value',
        10,
      ),
    );
  });
}
