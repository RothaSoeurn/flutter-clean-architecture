import 'package:flutter/foundation.dart';
import 'package:flutter_clean_architecture_app/core/utils/constant/enum.dart';

abstract class Logger {
  void log(String message) {}
}

class DebugLog implements Logger {
  @override
  void log(String message) {
    if (kDebugMode) {
      log('=====================================\n');
      log('DEBUG: $message');
      log('STACK TRACE: ${StackTrace.current}');
      log('=====================================\n');
    }
  }
}

class InfoLog implements Logger {
  @override
  void log(String message) {
    if (kDebugMode) {
      log('=====================================\n');
      log('INFO: $message');
      log('STACK TRACE: ${StackTrace.current}');
      log('=====================================\n');
    }
  }
}

class ErrorLog implements Logger {
  @override
  void log(String message) {
    if (kDebugMode) {
      log('=====================================\n');
      log('ERROR: $message');
      log('STACK TRACE: ${StackTrace.current}');
      log('=====================================\n');
    }
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
