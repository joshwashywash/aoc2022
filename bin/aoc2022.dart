import 'dart:io';

import 'package:aoc2022/aoc2022.dart';
import 'package:args/args.dart';

void main(List<String> arguments) async {
  const days = 2;

  final parser = ArgParser()
    ..addOption(
      'input',
      abbr: 'i',
      help: 'File path of the input file.',
      defaultsTo: 'day1.example.txt',
    )
    ..addOption(
      'day',
      abbr: 'd',
      allowed: List.generate(days, (i) => '${1 + i}'),
      help: 'Day number to use.',
      defaultsTo: '1',
    )
    ..addFlag(
      'help',
      abbr: 'h',
      negatable: false,
    );

  try {
    final results = parser.parse(arguments);
    if (results['help']) {
      print(parser.usage);
    } else {
      final file = File(results['input']);
      final day = results['day'];

      final map = {'1': day1, '2': day2};
      if (map.containsKey(day)) {
        final result = await map[day]!(file);
        print(result);
      }
    }
  } catch (e) {
    print('error: $e\n');
    print(parser.usage);
  }
}
