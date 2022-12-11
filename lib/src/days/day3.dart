import 'dart:io';

import 'package:collection/collection.dart';

import '../utils.dart' as utils;

final cases = [
  ['a', 'z'],
  ['A', 'Z']
].map((pair) => pair.map((l) => l.codeUnitAt(0))).map(
  (units) {
    return List.generate(
      1 + units.last - units.first,
      (i) => String.fromCharCode(units.first + i),
    );
  },
);

final alphabet = [for (final c in cases) ...c];

final flipped = utils.reverseMap(alphabet.asMap());

Future<List<int>> day3(File file) async {
  final content = await file.readAsLines();

  final part1 = content.map((line) {
    final halfway = line.length ~/ 2;

    final common = line
        .split('')
        .slices(halfway)
        .map((piece) => piece.toSet())
        .reduce((a, b) => a.intersection(b));

    return (flipped[common.first] ?? 0) + 1;
  }).reduce((a, b) => a + b);

  const groupSize = 3;

  final part2 = content.slices(groupSize).map((group) {
    final common = group
        .map((list) => list.split('').toSet())
        .reduce((a, b) => a.intersection(b));
    return (flipped[common.first] ?? 0) + 1;
  }).reduce((a, b) => a + b);

  return [part1, part2];
}
