import 'dart:io';

Future<List<String>> day5(File file) async {
  final lines = await file.readAsLines();

  // find first blank line to find where the stack lines end and the move lines
  // begin
  final blankLineIndex = lines.indexOf('');

  final exp = RegExp(r'\d+');
  final instructions = lines.sublist(blankLineIndex + 1).map((move) {
    return exp
        .allMatches(move)
        .map((matches) => int.parse(matches.group(0) ?? '0'));
  });

  final stacksLines = lines.sublist(0, blankLineIndex - 1);

  final stackCount = (stacksLines.first.length + 1) ~/ 4;

  final stacks = [
    for (var stackIndex = 0; stackIndex < stackCount; stackIndex += 1)
      [
        for (var stackLineIndex = 0;
            stackLineIndex < stacksLines.length;
            stackLineIndex += 1)
          stacksLines[stacksLines.length - stackLineIndex - 1]
              [4 * stackIndex + 1]
      ].where((item) => item != ' ').toList(),
  ];

  // deep copy -- will only handle a 2-D list.
  final stacksCopy = [
    for (final stack in stacks) [for (final s in stack) s],
  ];

  for (final instruction in instructions) {
    // pattern matching is coming in dart 3 which should make things like
    // destructuring possible
    final from = instruction.elementAt(1) - 1;
    final to = instruction.last - 1;
    final amount = instruction.first;

    final toMove = <String>[];
    for (var i = 0; i < amount; i += 1) {
      final item = stacks[from].removeLast();
      stacks[to].add(item);

      toMove.add(stacksCopy[from].removeLast());
    }

    stacksCopy[to].addAll(toMove.reversed);
  }

  return [
    stacks,
    stacksCopy,
  ].map((p) => p.map((stack) => stack.last).join()).toList();
}
