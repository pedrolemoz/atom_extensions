import 'package:asp/asp.dart';
import 'package:atom_extensions/atom_extensions.dart';
import 'package:test/test.dart';

void main() {
  test('cast: Should cast List<num> to List<int> as expected', () {
    final list = List<num>.generate(
      10,
      (index) => index,
    ).createAtom();

    var interactions = 0;

    rxObserver(
      () => list.value,
      effect: (value) => interactions++,
    );

    final castList = list.cast<int>();

    expect(
      interactions,
      isA<int>().having((value) => value, 'No interactions detected', 0),
    );
    expect(list, isA<Atom<List<num>>>());
    expect(castList, isA<List<int>>());
  });

  test('[]: Should return element at position 10 of List<int> as expected', () {
    final list = List<int>.generate(
      50,
      (index) => index,
    ).createAtom();

    var interactions = 0;

    rxObserver(
      () => list.value,
      effect: (value) => interactions++,
    );

    final element = list[10];

    expect(
      interactions,
      isA<int>().having((value) => value, 'No interactions detected', 0),
    );
    expect(list, isA<Atom<List<int>>>());
    expect(
      element,
      isA<int>().having(
        (value) => value,
        'Has the correct value',
        10,
      ),
    );
  });

  test(
      '[]=: Should change the value of element at position 10 of List<int> as expected',
      () {
    final list = List<int>.generate(
      50,
      (index) => index,
    ).createAtom();

    var interactions = 0;

    rxObserver(
      () => list.value,
      effect: (value) => interactions++,
    );

    list[10] = -1;
    final modifiedValue = list[10];

    expect(
      interactions,
      isA<int>().having(
        (value) => value,
        'The correct amount of interactions were detected',
        1,
      ),
    );
    expect(list, isA<Atom<List<int>>>());
    expect(
      modifiedValue,
      isA<int>().having(
        (value) => value,
        'Has the correct value',
        -1,
      ),
    );
  });

  test('[]=: Should change the value of first element of List<int> as expected',
      () {
    final list = List<int>.generate(
      50,
      (index) => index,
    ).createAtom();

    var interactions = 0;

    rxObserver(
      () => list.value,
      effect: (value) => interactions++,
    );

    list.first = -1;
    final modifiedValue = list[0];

    expect(
      interactions,
      isA<int>().having(
        (value) => value,
        'The correct amount of interactions were detected',
        1,
      ),
    );
    expect(list, isA<Atom<List<int>>>());
    expect(
      modifiedValue,
      isA<int>().having(
        (value) => value,
        'Has the correct value',
        -1,
      ),
    );
  });

  test('get first: Should return the first element of List<int> as expected',
      () {
    final list = List<int>.generate(5, (index) => index).createAtom();

    var interactions = 0;

    rxObserver(
      () => list.value,
      effect: (value) => interactions++,
    );

    final value = list.first;

    expect(
      interactions,
      isA<int>().having((value) => value, 'No interactions detected', 0),
    );
    expect(list, isA<Atom<List<int>>>());
    expect(value, 0);
  });

  test(
      'set first: Should change the value of the first element of List<int> as expected',
      () {
    final list = List<int>.generate(5, (index) => index).createAtom();

    var interactions = 0;

    rxObserver(
      () => list.value,
      effect: (value) => interactions++,
    );

    list.first = -1;
    final modifiedValue = list.first;

    expect(
      interactions,
      isA<int>().having(
        (value) => value,
        'The correct amount of interactions were detected',
        1,
      ),
    );
    expect(list, isA<Atom<List<int>>>());
    expect(modifiedValue, -1);
  });

  test('get last: Should return the last element of List<int> as expected', () {
    final list = List<int>.generate(5, (index) => index).createAtom();

    var interactions = 0;

    rxObserver(
      () => list.value,
      effect: (value) => interactions++,
    );

    final value = list.last;

    expect(
      interactions,
      isA<int>().having((value) => value, 'No interactions detected', 0),
    );
    expect(list, isA<Atom<List<int>>>());
    expect(value, 4);
  });

  test(
      'set last: Should change the value of the last element of List<int> as expected',
      () {
    final list = List<int>.generate(5, (index) => index).createAtom();

    var interactions = 0;

    rxObserver(
      () => list.value,
      effect: (value) => interactions++,
    );

    list.last = -1;
    final modifiedValue = list.last;

    expect(
      interactions,
      isA<int>().having(
        (value) => value,
        'The correct amount of interactions were detected',
        1,
      ),
    );
    expect(list, isA<Atom<List<int>>>());
    expect(modifiedValue, -1);
  });

  test(
      'set length: Should change the value of the length of List<int> as expected',
      () {
    final list = List<int?>.generate(5, (index) => index).createAtom();

    var interactions = 0;

    rxObserver(
      () => list.value,
      effect: (value) => interactions++,
    );

    list.length = 50;
    final modifiedValue = list.length;

    expect(
      interactions,
      isA<int>().having(
        (value) => value,
        'The correct amount of interactions were detected',
        1,
      ),
    );
    expect(list, isA<Atom<List<int?>>>());
    expect(modifiedValue, 50);
  });

  test('get length: Should return length of List<int> as expected', () {
    final list = List<int>.generate(5, (index) => index).createAtom();

    var interactions = 0;

    rxObserver(
      () => list.value,
      effect: (value) => interactions++,
    );

    final value = list.length;

    expect(
      interactions,
      isA<int>().having((value) => value, 'No interactions detected', 0),
    );
    expect(list, isA<Atom<List<int>>>());
    expect(value, 5);
  });

  test('add: Should add one element at the end of List<int> as expected', () {
    final list = List<int>.generate(5, (index) => index).createAtom();

    var interactions = 0;

    rxObserver(
      () => list.value,
      effect: (value) => interactions++,
    );

    list.add(-1);

    expect(
      interactions,
      isA<int>().having(
        (value) => value,
        'The correct amount of interactions were detected',
        1,
      ),
    );
    expect(
      list,
      isA<Atom<List<int>>>().having(
        (values) => values.value,
        'Has the correct values',
        [0, 1, 2, 3, 4, -1],
      ),
    );
  });

  test('addAll: Should add all elements at the end of List<int> as expected',
      () {
    final list = List<int>.generate(5, (index) => index).createAtom();

    var interactions = 0;

    rxObserver(
      () => list.value,
      effect: (value) => interactions++,
    );

    list.addAll([-1, -2, -3, -4, -5]);

    expect(
      interactions,
      isA<int>().having(
        (value) => value,
        'The correct amount of interactions were detected',
        1,
      ),
    );
    expect(
      list,
      isA<Atom<List<int>>>().having(
        (values) => values.value,
        'Has the correct values',
        [0, 1, 2, 3, 4, -1, -2, -3, -4, -5],
      ),
    );
  });

  test('reversed: Should return a reversed List<int> as expected', () {
    final list = List<int>.generate(5, (index) => index).createAtom();

    var interactions = 0;

    rxObserver(
      () => list.value,
      effect: (value) => interactions++,
    );

    final reversedList = list.reversed;

    expect(
      interactions,
      isA<int>().having((value) => value, 'No interactions detected', 0),
    );
    expect(list, isA<Atom<List<int>>>());
    expect(
      reversedList,
      isA<Iterable<int>>().having(
        (values) => values,
        'Has the correct values',
        [4, 3, 2, 1, 0],
      ),
    );
  });

  test('sort: Should sort all elements of List<int> as expected', () {
    final list = [5, 4, 3, 2, 1, 0].createAtom();

    var interactions = 0;

    rxObserver(
      () => list.value,
      effect: (value) => interactions++,
    );

    list.sort();

    expect(
      interactions,
      isA<int>().having(
        (value) => value,
        'The correct amount of interactions were detected',
        1,
      ),
    );
    expect(
      list,
      isA<Atom<List<int>>>().having(
        (values) => values.value,
        'Has the correct values',
        [0, 1, 2, 3, 4, 5],
      ),
    );
  });

  test('shuffle: Should shuffle all elements of List<int> as expected', () {
    final list = List<int>.generate(5, (index) => index).createAtom();

    var interactions = 0;

    rxObserver(
      () => list.value,
      effect: (value) => interactions++,
    );

    list.shuffle();

    expect(
      interactions,
      isA<int>().having(
        (value) => value,
        'The correct amount of interactions were detected',
        1,
      ),
    );
    expect(list, isA<Atom<List<int>>>());
  });

  test(
      'indexOf: Should return the index of an element of List<int> as expected',
      () {
    final list = List<int>.generate(
      5,
      (index) => (index * 100) + (1 * index),
    ).createAtom();

    var interactions = 0;

    rxObserver(
      () => list.value,
      effect: (value) => interactions++,
    );

    final value = list.indexOf(303);

    expect(
      interactions,
      isA<int>().having((value) => value, 'No interactions detected', 0),
    );
    expect(list, isA<Atom<List<int>>>());
    expect(value, 3);
  });

  test(
      'indexWhere: Should return the index of an element of List<int> where an element match a certain condition as expected',
      () {
    final list = List<int>.generate(5, (index) => index).createAtom();

    var interactions = 0;

    rxObserver(
      () => list.value,
      effect: (value) => interactions++,
    );

    final value = list.indexWhere((e) => e == 2);

    expect(
      interactions,
      isA<int>().having((value) => value, 'No interactions detected', 0),
    );
    expect(list, isA<Atom<List<int>>>());
    expect(value, 2);
  });

  test(
      'lastIndexWhere: Should return the last index of an element of List<int> where an element match a certain condition as expected',
      () {
    final list = List<int>.generate(5, (index) => index).createAtom();

    var interactions = 0;

    rxObserver(
      () => list.value,
      effect: (value) => interactions++,
    );

    final value = list.lastIndexWhere((e) => e.isEven);

    expect(
      interactions,
      isA<int>().having((value) => value, 'No interactions detected', 0),
    );
    expect(list, isA<Atom<List<int>>>());
    expect(value, 4);
  });

  test(
      'lastIndexOf: Should return the index of an element of List<int> as expected',
      () {
    final list = List<int>.generate(
      5,
      (index) => index.isEven ? 10 : 20,
    ).createAtom();

    var interactions = 0;

    rxObserver(
      () => list.value,
      effect: (value) => interactions++,
    );

    final value = list.lastIndexOf(10);

    expect(
      interactions,
      isA<int>().having((value) => value, 'No interactions detected', 0),
    );
    expect(list, isA<Atom<List<int>>>());
    expect(value, 4);
  });

  test('clear: Should clear all elements of List<int> as expected', () {
    final list = List<int>.generate(5, (index) => index).createAtom();

    var interactions = 0;

    rxObserver(
      () => list.value,
      effect: (value) => interactions++,
    );

    list.clear();

    expect(
      interactions,
      isA<int>().having(
        (value) => value,
        'The correct amount of interactions were detected',
        1,
      ),
    );
    expect(
      list,
      isA<Atom<List<int>>>().having(
        (values) => values.value,
        'Has the correct values',
        [],
      ),
    );
  });

  test('insert: Should insert one element at an index of List<int> as expected',
      () {
    final list = List<int>.generate(5, (index) => index).createAtom();

    var interactions = 0;

    rxObserver(
      () => list.value,
      effect: (value) => interactions++,
    );

    list.insert(0, -1);

    expect(
      interactions,
      isA<int>().having(
        (value) => value,
        'The correct amount of interactions were detected',
        1,
      ),
    );
    expect(
      list,
      isA<Atom<List<int>>>().having(
        (values) => values.value,
        'Has the correct values',
        [-1, 0, 1, 2, 3, 4],
      ),
    );
  });

  test(
      'insertAll: Should add all elements at an index of List<int> as expected',
      () {
    final list = List<int>.generate(5, (index) => index).createAtom();

    var interactions = 0;

    rxObserver(
      () => list.value,
      effect: (value) => interactions++,
    );

    list.insertAll(0, [-1, -2, -3, -4, -5]);

    expect(
      interactions,
      isA<int>().having(
        (value) => value,
        'The correct amount of interactions were detected',
        1,
      ),
    );
    expect(
      list,
      isA<Atom<List<int>>>().having(
        (values) => values.value,
        'Has the correct values',
        [-1, -2, -3, -4, -5, 0, 1, 2, 3, 4],
      ),
    );
  });

  test('setAll: Should overwrites elements of List<int> as expected', () {
    final list = List<int>.generate(6, (index) => index).createAtom();

    var interactions = 0;

    rxObserver(
      () => list.value,
      effect: (value) => interactions++,
    );

    list.setAll(3, [-3, -4, -5]);

    expect(
      interactions,
      isA<int>().having(
        (value) => value,
        'The correct amount of interactions were detected',
        1,
      ),
    );
    expect(
      list,
      isA<Atom<List<int>>>().having(
        (values) => values.value,
        'Has the correct values',
        [0, 1, 2, -3, -4, -5],
      ),
    );
  });

  test('remove: Should remove an element of List<int> as expected', () {
    final list = List<int>.generate(5, (index) => index).createAtom();

    var interactions = 0;

    rxObserver(
      () => list.value,
      effect: (value) => interactions++,
    );

    final result = list.remove(3);

    expect(
      interactions,
      isA<int>().having(
        (value) => value,
        'The correct amount of interactions were detected',
        1,
      ),
    );
    expect(result, true);
    expect(
      list,
      isA<Atom<List<int>>>().having(
        (values) => values.value,
        'Has the correct values',
        [0, 1, 2, 4],
      ),
    );
  });

  test(
      'removeAt: Should remove an element at an index of List<int> as expected',
      () {
    final list = List<int>.generate(5, (index) => index).createAtom();

    var interactions = 0;

    rxObserver(
      () => list.value,
      effect: (value) => interactions++,
    );

    final removedElement = list.removeAt(0);

    expect(
      interactions,
      isA<int>().having(
        (value) => value,
        'The correct amount of interactions were detected',
        1,
      ),
    );
    expect(removedElement, 0);
    expect(
      list,
      isA<Atom<List<int>>>().having(
        (values) => values.value,
        'Has the correct values',
        [1, 2, 3, 4],
      ),
    );
  });

  test('removeAt: Should remove the last element of List<int> as expected', () {
    final list = List<int>.generate(5, (index) => index).createAtom();

    var interactions = 0;

    rxObserver(
      () => list.value,
      effect: (value) => interactions++,
    );

    final removedElement = list.removeLast();

    expect(
      interactions,
      isA<int>().having(
        (value) => value,
        'The correct amount of interactions were detected',
        1,
      ),
    );
    expect(removedElement, 4);
    expect(
      list,
      isA<Atom<List<int>>>().having(
        (values) => values.value,
        'Has the correct values',
        [0, 1, 2, 3],
      ),
    );
  });

  test(
      'removeWhere: Should remove all elements of List<int> that match a certain condition as expected',
      () {
    final list = List<int>.generate(5, (index) => index).createAtom();

    var interactions = 0;

    rxObserver(
      () => list.value,
      effect: (value) => interactions++,
    );

    list.removeWhere((e) => e.isEven);

    expect(
      interactions,
      isA<int>().having(
        (value) => value,
        'The correct amount of interactions were detected',
        1,
      ),
    );
    expect(
      list,
      isA<Atom<List<int>>>().having(
        (values) => values.value,
        'Has the correct values',
        [1, 3],
      ),
    );
  });

  test(
      'retainWhere: Should remove all elements of List<int> that do not match a certain condition as expected',
      () {
    final list = List<int>.generate(5, (index) => index).createAtom();

    var interactions = 0;

    rxObserver(
      () => list.value,
      effect: (value) => interactions++,
    );

    list.retainWhere((e) => e.isEven);

    expect(
      interactions,
      isA<int>().having(
        (value) => value,
        'The correct amount of interactions were detected',
        1,
      ),
    );
    expect(
      list,
      isA<Atom<List<int>>>().having(
        (values) => values.value,
        'Has the correct values',
        [0, 2, 4],
      ),
    );
  });

  test('+: Should concatenate two List<int> as expected', () {
    final list = List<int>.generate(5, (index) => index).createAtom();

    var interactions = 0;

    rxObserver(
      () => list.value,
      effect: (value) => interactions++,
    );

    final concatenationList = list + [-1, -2, -3, -4, -5];

    expect(
      interactions,
      isA<int>().having((value) => value, 'No interactions detected', 0),
    );
    expect(list, isA<Atom<List<int>>>());
    expect(
      concatenationList,
      isA<List<int>>().having(
        (values) => values,
        'Has the correct values',
        [0, 1, 2, 3, 4, -1, -2, -3, -4, -5],
      ),
    );
  });

  test(
      'getRange: Should return element of List<int> following a certain range as expected',
      () {
    final list = List<int>.generate(5, (index) => index).createAtom();

    var interactions = 0;

    rxObserver(
      () => list.value,
      effect: (value) => interactions++,
    );

    final subList = list.getRange(0, 2);

    expect(
      interactions,
      isA<int>().having((value) => value, 'No interactions detected', 0),
    );
    expect(list, isA<Atom<List<int>>>());
    expect(
      subList,
      isA<Iterable<int>>().having(
        (values) => values,
        'Has the correct values',
        [0, 1],
      ),
    );
  });
}
