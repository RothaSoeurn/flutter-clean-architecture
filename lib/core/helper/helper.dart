import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_app/core/utils/constant/enum.dart';
import 'package:flutter_clean_architecture_app/core/utils/constant/key.dart';
import 'package:flutter_clean_architecture_app/core/utils/log/logger.dart';

logger({LoggerType loggerType = LoggerType.debug, String message = ""}) {
  Logger logger = FactoryMethodLogger.getLogger(loggerType);
  return logger.log(message);
}

showMessage({
  MessageType messageType = MessageType.success,
  String message = "",
}) {
  if (messageType == MessageType.success) {
    //TODO COLOR
  } else if (messageType == MessageType.warning) {
    //TODO COLOR
  } else {
    //TODO COLOR
  }
  scaffoldMessengerKey?.currentState?.showSnackBar(
    SnackBar(
      content: Text(message),
      duration: Duration(seconds: 2),
    ),
  );
}
