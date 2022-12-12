import 'dart:io';

bool fullyContains(Iterable<Iterable<num>> pairs) {
  return (pairs.first.first <= pairs.last.first &&
          pairs.first.last >= pairs.last.last) ||
      (pairs.last.first <= pairs.first.first &&
          pairs.last.last >= pairs.first.last);
}

Future<List<int>> day4(File file) async {
  final lines = await file.readAsLines();

  final pairs = lines.map(
      (line) => line.split(',').map((sep) => sep.split('-').map(int.parse)));

  final part1 = pairs.map((pair) => fullyContains(pair));

  return [part1].map((p) {
    return p.map((predicate) => predicate ? 1 : 0).reduce((a, b) => a + b);
  }).toList();
}
