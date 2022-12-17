import 'dart:io';

Future<List<String>> day5(File file) async {
  final lines = await file.readAsLines();

  // find first blank line to find where the stack lines end and the move lines
  // begin
  final blankLineIndex = lines.indexOf('');
  final stacksLines = lines.sublist(0, blankLineIndex - 1);

  final stackCount = (stacksLines.first.length + 1) ~/ 4;

  final stacks = List<List<String>>.generate(
    stackCount,
    (stackIndex) => List<String>.generate(
      stacksLines.length,
      (stackLineIndex) {
        final stackLine = stacksLines[stacksLines.length - stackLineIndex - 1];
        // adding 1 skips the first `[`
        return stackLine[4 * stackIndex + 1];
      },
    ),
  ).map((stack) {
    return stack.where((item) => item != ' ').toList();
  }).toList();

  final moves = lines.sublist(blankLineIndex + 1);
  final exp = RegExp(r'\d+');
  final instructions = moves.map((move) {
    return exp
        .allMatches(move)
        .map((matches) => matches.group(0) ?? '0')
        .map(int.parse);
  });

  // pattern matching is coming in dart 3 which should make things like
  // destructuring possible
  for (final instruction in instructions) {
    for (var i = 0; i < instruction.first; i += 1) {
      final item = stacks[instruction.elementAt(1) - 1].removeLast();
      stacks[instruction.last - 1].add(item);
    }
  }

  final tops = stacks.map((stack) => stack.last).join();

  return [tops];
}
