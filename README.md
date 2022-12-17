## Usage

Make sure an input file is available at root and run:

```console
dart run ./bin/aoc2022.dart --input day1.example.txt --day 1
```

or even

```console
dart run ./bin/aoc2022.dart -i day1.example.txt -d 1
```

Get some help with:

```console
dart run ./bin/aoc2022.dart --help
```

## Output

The output is a list where `list[0]` is the answer to part 1 for that day and `list[1]` is the answer to part 2. If there is one element in the list, that means I haven't done part 2 for that day yet.

## Overall Approach

There is a mix of approaches in the codebase, but there is a trend toward more functional and stream-oriented solutions in later days.
