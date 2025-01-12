import 'package:flutter_clean_architecture_app/core/utils/constant/enum.dart';

abstract class Logger {
  void log(String message) {}
}

class DebugLog implements Logger {
  @override
  void log(String message) {
    log('DEBUG: $message');
  }
}

class InfoLog implements Logger {
  @override
  void log(String message) {
    log('INFO: $message');
  }
}

class ErrorLog implements Logger {
  @override
  void log(String message) {
    log('ERROR: $message');
  }
}

class FactoryMethodLogger {
  static getLogger(LoggerType loggerType) {
    switch (loggerType) {
      case LoggerType.debug:
        return DebugLog();
      case LoggerType.info:
        return InfoLog();
      case LoggerType.error:
        return ErrorLog();
    }
  }
}
