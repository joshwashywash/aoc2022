import 'dart:io';

bool overlaps(Iterable<Iterable<num>> pairs) {
  return (pairs.first.first <= pairs.last.first &&
          pairs.first.last >= pairs.last.last) ||
      (pairs.last.first <= pairs.first.first &&
          pairs.last.last >= pairs.first.last);
}

Future<List<int>> day4(File file) async {
  final lines = await file.readAsLines();

  final part1 = lines.map((line) {
    final pairs = line.split(',').map((sep) {
      return sep.split('-').map((a) => int.parse(a));
    });

    return overlaps(pairs) ? 1 : 0;
  }).reduce((a, b) => a + b);

  return [part1];
}
