import 'dart:io';
import 'package:args/args.dart';
import 'package:aoc2022/aoc2022.dart';

void main(List<String> arguments) async {
  const days = 5;

  final allowed =
      List<int>.generate(days, (index) => 1 + index, growable: false)
          .map((e) => '$e');

  final parser = ArgParser()
    ..addOption('file', abbr: 'f')
    ..addOption('day', abbr: 'd', allowed: allowed);

  final results = parser.parse(arguments);
  final file = File(results['file']);
  final day = results['day'];

  final map = {'1': day1};
  if (map.containsKey(day)) {
    final result = await map[day]!(file);
    print(result);
  }
}
