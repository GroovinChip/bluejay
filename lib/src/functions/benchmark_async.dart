import 'dart:async';

Future<void> benchmarkAsync(String name, FutureOr<void> Function() fn) async {
  const timeLimit = Duration(seconds: 5);
  const subIterations = 5;
  const leftColumnWidth = 25;
  const rightColumnWidth = 6;

  var iterations = 0;

  final stopwatch = Stopwatch()..start();

  while (stopwatch.elapsed < timeLimit) {
    for (var i = 0; i < subIterations; i++) {
      await fn();
    }

    iterations++;
  }

  stopwatch.stop();

  print('${name.padRight(leftColumnWidth)} '
      '${(iterations ~/ 1000).toString().padLeft(rightColumnWidth)}k '
      'x $subIterations iterations '
      '/ ${timeLimit.inMilliseconds / 1000}s');
}
