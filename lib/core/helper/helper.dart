import 'package:flutter_clean_architecture_app/core/utils/constant/enum.dart';
import 'package:flutter_clean_architecture_app/core/utils/log/logger.dart';

logger({LoggerType loggerType = LoggerType.debug, String message = ""}) {
  Logger logger = FactoryMethodLogger.getLogger(loggerType);
  return logger.log(message);
}
