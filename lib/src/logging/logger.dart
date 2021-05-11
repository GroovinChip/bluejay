import 'dart:convert';

import 'package:http/http.dart' as http;

/// The base class for a logging channel or service
///
/// This logging utility was created by Luke Pighetti.
/// Please view the original source [here](https://gist.github.com/lukepighetti/5283229a351ab394376e84cff8277bdb)
abstract class Logger {
  /// Log a message
  void log(String channel, String message);
}

/// The logging service used by the app
class LoggingService implements Logger {
  LoggingService({required this.loggers});

  /// All the loggers to dispatch log events to
  final Set<Logger> loggers;

  @override
  void log(String channel, String message) {
    /// Dispatch this log event to all [loggers]
    for (var logger in loggers) {
      logger.log(channel, message);
    }
  }

  /// Log a future and return the result
  Future<T> logFuture<T>(
      String channel, String message, Future<T> future) async {
    final s = Stopwatch();
    s.start();
    final result = await future;
    s.stop();
    log(channel, '${s.elapsed}: $message');
    return result;
  }
}

/// A logging channel that outputs to the local development console
///
/// This logging utility was created by Luke Pighetti.
/// Please view the original source [here](https://gist.github.com/lukepighetti/5283229a351ab394376e84cff8277bdb)
class ConsoleLogger implements Logger {
  @override
  void log(String channel, String message) {
    print('[$channel] (${DateTime.now()}) $message');
  }
}

/// A logging channel that sends messages to a remote logging endpoint
///
/// This logging utility was created by Luke Pighetti.
/// Please view the original source [here](https://gist.github.com/lukepighetti/5283229a351ab394376e84cff8277bdb)
class RemoteLogger implements Logger {
  RemoteLogger({required this.baseUrl});

  final Uri baseUrl;

  @override
  void log(String channel, String message) async {
    final timestamp = DateTime.now();

    try {
      await http.post(
        baseUrl.resolve('/log'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'channel': '$channel',
          'timestamp': '$timestamp',
          'message': '$message',
        }),
      );
    } catch (e) {
      print('[RemoteLogger] error: $e');
    }
  }
}
