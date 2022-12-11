import 'dart:io';

import 'package:aoc2022/aoc2022.dart';
import 'package:args/args.dart';

final days = [
  day1,
  day2,
  day3,
  day4,
].asMap().map((key, value) => MapEntry('${key + 1}', value));

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
    allowed: days.keys,
    help: 'Day number to use.',
    defaultsTo: '1',
  )
  ..addFlag(
    'help',
    abbr: 'h',
    negatable: false,
  );

void main(List<String> arguments) async {
  try {
    final results = parser.parse(arguments);
    if (results['help']) {
      print(parser.usage);
    } else {
      final file = File(results['input']);
      final day = results['day'];

      final result = await days[day]!(file);
      print(result);
    }
  } catch (e) {
    print('error: $e\n${parser.usage}');
  }
}
