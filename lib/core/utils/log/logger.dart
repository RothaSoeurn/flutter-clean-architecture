import 'package:flutter/foundation.dart';
import 'package:flutter_clean_architecture_app/core/utils/constant/enum.dart';

abstract class Logger {
  void log(String message) {}
}

class DebugLog implements Logger {
  @override
  void log(String message) {
    if (kDebugMode) {
      debugPrint('=====================================\n');
      debugPrint('DEBUG: $message');
      // log('STACK TRACE: ${StackTrace.current}');
      debugPrint('=====================================\n');
    }
  }
}

class InfoLog implements Logger {
  @override
  void log(String message) {
    if (kDebugMode) {
      debugPrint('=====================================\n');
      debugPrint('INFO: $message');
      // debugPrint('STACK TRACE: ${StackTrace.current}');
      debugPrint('=====================================\n');
    }
  }
}

class ErrorLog implements Logger {
  @override
  void log(String message) {
    if (kDebugMode) {
      debugPrint('=====================================\n');
      debugPrint('ERROR: $message');
      // debugPrint('STACK TRACE: ${StackTrace.current}');
      debugPrint('=====================================\n');
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
