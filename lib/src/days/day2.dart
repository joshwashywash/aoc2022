import 'dart:io';

Future<List<int>> day2(File file) async {
  final lines = await file.readAsLines();

  // could generate these maps but meh

  final partOneMap = {
    'A X': 1 + 3, // draw
    'A Y': 2 + 6, // win
    'A Z': 3 + 0, // loss
    'B X': 1 + 0, // loss
    'B Y': 2 + 3, // draw
    'B Z': 3 + 6, // win
    'C X': 1 + 6, // win
    'C Y': 2 + 0, // loss
    'C Z': 3 + 3, // draw
  };

  final partTwoMap = {
    'A X': 3 + 0,
    'A Y': 1 + 3,
    'A Z': 2 + 6,
    'B X': 1 + 0,
    'B Y': 2 + 3,
    'B Z': 3 + 6,
    'C X': 2 + 0,
    'C Y': 3 + 3,
    'C Z': 1 + 6,
  };

  return [
    lines.map((line) => partOneMap[line] ?? 0),
    lines.map((line) => partTwoMap[line] ?? 0),
  ].map((c) => c.reduce((a, b) => a + b)).toList();
}
