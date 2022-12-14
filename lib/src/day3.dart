import 'dart:io';

import 'package:collection/collection.dart';

const _lowercases = 'abcdefghijklmnopqrstuvwxyz';
final _uppercases = _lowercases.toUpperCase();

final _alphabet = '$_lowercases$_uppercases'.split('').asMap().map((k, v) {
  return MapEntry(v, k);
});

Future<List<String>> day3(File file) async {
  final lines = await file.readAsLines();

  final part1 = lines.map((line) => line.split('').slices(line.length ~/ 2));

  const groupSize = 3;

  final part2 = lines
      .slices(groupSize)
      .map((group) => group.map((list) => list.split('')));

  return [part1, part2].map((p) {
    return p
        .map((s) {
          final single = s
              .map((list) => list.toSet())
              .reduce((a, b) => a.intersection(b))
              .first;
          return (_alphabet[single] ?? 0) + 1;
        })
        .reduce((a, b) => a + b)
        .toString();
  }).toList();
}
