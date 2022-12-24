import 'dart:io';

Future<List<String>> day6(File file) async {
  final input = await file.readAsString();

  final chars = input.split('');

  return [
    04, // part 1
    14, // part 2
  ].map((size) {
    final position = [
      for (var i = 0; i < chars.length - size + 1; i += 1)
        chars.sublist(i, i + size)
    ].indexWhere((w) => {...w}.length == size);

    return '${position + size}';
  }).toList();
}
