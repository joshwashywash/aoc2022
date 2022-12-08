import 'dart:io';
import 'dart:math';

Future<List<int>> day1(File file) async {
  final contents = await file.readAsLines();

  const int n = 3;
  final initial = List.generate(n + 1, (_) => 0);
  final bestN = contents.fold(initial, (value, element) {
    if (element.isEmpty) {
      final bestN = value.sublist(0, n);
      final least = bestN.reduce(min);
      if (least < value.last) {
        final pos = bestN.indexOf(least);
        value[pos] = value.last;
      }
      value.last = 0;
    } else {
      value.last += int.parse(element);
    }
    return value;
  }).sublist(0, n);

  final best = bestN.reduce(max);
  final sumOfBestN = bestN.reduce((a, b) => a + b);

  return [best, sumOfBestN];
}