// ignore_for_file: constant_identifier_names

enum LogLevel {
  NONE,
  INFO,
  DEBUG,
  WARNING,
  ERROR,
  FUNCTIONAL_MESSAGE,
  FUNCTIONAL_ERROR,
}

abstract class Logger {
  Set<LogLevel> levels;
  Logger? _next;

  Logger(this.levels);

  bool get universal => levels.containsAll(LogLevel.values);
  set next(Logger nextLogger) => _next = nextLogger;

  void addLevel(LogLevel level) => levels.add(level);

  void log(LogLevel level, String msg) {
    if (levels.contains(level) || universal) {
      writeLogMessage(msg);
    }
    _next?.log(level, msg);
  }

  void writeLogMessage(String msg);
}

class ConsoleLogger extends Logger {
  ConsoleLogger(super.levels);

  @override
  void writeLogMessage(String msg) => print("[Console]: $msg");
}

class EmailLogger extends Logger {
  EmailLogger(super.levels);

  @override
  void writeLogMessage(String msg) => print("[Email]: $msg");
}

class FileLogger extends Logger {
  FileLogger(super.levels);

  @override
  void writeLogMessage(String msg) => print("[File]: $msg");
}

void main() {
  var logger = ConsoleLogger(Set.from(LogLevel.values));
  var emailLogger =
      EmailLogger({LogLevel.FUNCTIONAL_MESSAGE, LogLevel.FUNCTIONAL_ERROR});
  var fileLogger = FileLogger({LogLevel.WARNING, LogLevel.ERROR});

  logger.next = emailLogger;
  emailLogger.next = fileLogger;

  logger.log(LogLevel.DEBUG, "Some amazingly helpful debug message");
  logger.log(LogLevel.INFO, "Pretty important information");

  logger.log(LogLevel.WARNING, "This is a warning!");
  logger.log(LogLevel.ERROR, "AAAHHHHH");

  logger.log(LogLevel.FUNCTIONAL_ERROR, "This is not a showstopper");
  logger.log(LogLevel.FUNCTIONAL_MESSAGE, "This is basically just info");
}
