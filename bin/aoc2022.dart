import 'dart:io';

import 'package:aoc2022/aoc2022.dart';
import 'package:args/args.dart';

final days = [
  day1,
  day2,
  day3,
  day4,
  day5,
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
    if (results['help'] as bool) {
      print(parser.usage);
    } else {
      final file = File(results['input'] as String);
      final day = results['day'];

      final f = days[day] ?? (File file) => Future.value([]);

      final result = await f(file);
      if (result.isEmpty) {
        throw Exception('Somehow you got past the arg parser. Nice job.');
      } else {
        print(result);
      }
    }
  } catch (e) {
    print('error: $e${'\n' * 2}${parser.usage}');
  }
}
