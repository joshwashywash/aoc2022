import 'dart:io';

import 'package:collection/collection.dart';

import '../utils.dart' as utils;

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

final flipped = utils.reverseMap(alphabet.asMap());

Future<List<int>> day3(File file) async {
  final content = await file.readAsLines();

  final part1 = content.map((line) => line.split('').slices(line.length ~/ 2));

  const groupSize = 3;

  final part2 = content
      .slices(groupSize)
      .map((group) => group.map((list) => list.split('')));

  return [part1, part2]
      .map((p) => p
          .map((s) => s.map((l) => l.toSet()))
          .map((s) => s.reduce((a, b) => a.intersection(b)))
          .map((s) => 1 + (flipped[s.first] ?? 0))
          .reduce((a, b) => a + b))
      .toList();
}
