import 'dart:io';
import 'dart:math';

import 'package:collection/collection.dart';

Future<List<String>> day1(File file) async {
  const n = 3;
  final lines = await file.readAsLines();
  final maxes = lines.splitBefore((e) => e.isEmpty).map((thing) {
    return thing.map((e) => int.tryParse(e) ?? 0).reduce((a, b) => a + b);
  }).fold(
    List.filled(n, 0),
    (maxes, element) {
      final minIndex = maxes.indexOf(maxes.reduce(min));
      if (maxes[minIndex] < element) maxes[minIndex] = element;
      return maxes;
    },
  );

  final part1 = maxes.reduce(max);
  final part2 = maxes.reduce((a, b) => a + b);

  return [part1, part2].map((p) => '$p').toList();
}
