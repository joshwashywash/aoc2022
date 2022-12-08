import 'dart:io';
import 'package:args/args.dart';
import 'package:aoc2022/aoc2022.dart';

void main(List<String> arguments) async {
  const days = 1;

  final allowed = [for (var i = 0; i < days; i += 1) '${i + 1}'];

  final parser = ArgParser()
    ..addOption('input', abbr: 'i', help: 'File path of the input file.')
    ..addOption('day', abbr: 'd', allowed: allowed, help: 'Day number to use.')
    ..addFlag('help', abbr: 'h', negatable: false);

  final results = parser.parse(arguments);
  if (results['help']) {
    print(parser.usage);
  } else {
    final file = File(results['input']);
    final day = results['day'];

    final map = {'1': day1};
    if (map.containsKey(day)) {
      final result = await map[day]!(file);
      print(result);
    }
  }
}
