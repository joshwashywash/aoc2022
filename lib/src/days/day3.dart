import 'dart:io';

import 'package:collection/collection.dart';

final cases = [
  ['a', 'z'],
  ['A', 'Z']
].map((pair) => pair.map((l) => l.codeUnitAt(0))).map((units) {
  return List.generate(
    1 + units.last - units.first,
    (i) => String.fromCharCode(units.first + i),
  );
});

final alphabet = [for (final c in cases) ...c];

final flipped = alphabet.asMap().map((key, value) => MapEntry(value, key));

Future<List<int>> day3(File file) async {
  final lines = await file.readAsLines();

  final part1 = lines.map((line) => line.split('').slices(line.length ~/ 2));

  const groupSize = 3;

  final part2 = lines
      .slices(groupSize)
      .map((group) => group.map((list) => list.split('')));

  return [part1, part2].map((p) {
    return p.map((s) {
      final single = s
          .map((list) => list.toSet())
          .reduce((a, b) => a.intersection(b))
          .first;
      return (flipped[single] ?? 0) + 1;
    }).reduce((a, b) => a + b);
  }).toList();
}
