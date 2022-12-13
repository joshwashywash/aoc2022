import 'dart:io';
import 'dart:convert';

bool fullyContains(Iterable<Iterable<num>> pairs) {
  return (pairs.first.first <= pairs.last.first &&
          pairs.first.last >= pairs.last.last) ||
      (pairs.last.first <= pairs.first.first &&
          pairs.last.last >= pairs.first.last);
}

bool overlaps(Iterable<Iterable<num>> pairs) {
  return pairs.first.first <= pairs.last.last &&
      pairs.first.last >= pairs.last.first;
}

Future<List<int>> day4(File file) async {
  final l = await file
      .openRead()
      .transform(utf8.decoder)
      .transform(LineSplitter())
      .map((line) {
    final pairs = line.split(',').map((sep) => sep.split('-').map(int.parse));
    return [fullyContains, overlaps].map((f) => f(pairs) ? 1 : 0);
  }).reduce((prev, curr) {
    return [
      prev.first + curr.first,
      prev.last + curr.last,
    ];
  });
  return l.toList();
}
