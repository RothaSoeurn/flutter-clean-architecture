import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_app/core/services/local_service.dart';
import 'package:flutter_clean_architecture_app/core/translations/en.dart';
import 'package:flutter_clean_architecture_app/core/translations/km.dart';
import 'package:flutter_clean_architecture_app/core/utils/constant/color.dart';
import 'package:flutter_clean_architecture_app/core/utils/constant/enum.dart';
import 'package:flutter_clean_architecture_app/core/utils/constant/key.dart';
import 'package:flutter_clean_architecture_app/core/utils/constant/size_config.dart';
import 'package:flutter_clean_architecture_app/core/utils/log/logger.dart';
import 'package:flutter_clean_architecture_app/presentation/widgets/text_widget.dart';

logger({LoggerType loggerType = LoggerType.debug, String message = ""}) {
  Logger logger = FactoryMethodLogger.getLogger(loggerType);
  return logger.log(message);
}

showMessage({
  MessageType messageType = MessageType.success,
  String message = "",
}) {
  Color color = appGreen;
  if (messageType == MessageType.success) {
    color = appGreen;
  } else if (messageType == MessageType.warning) {
    color = appYellow;
  } else {
    color = appRed;
  }
  scaffoldMessengerKey.currentState?.showSnackBar(
    SnackBar(
      content: TextWidget(text: message),
      backgroundColor: color,
      duration: Duration(seconds: 2),
    ),
  );
}

extension TranslationExtension on String {
  String get tr {
    final locale = LocalService().currentLocale.languageCode;

    if (locale == LanguageType.en.name) {
      return AppLocalizationsEn.strings[this] ?? this;
    } else if (locale == LanguageType.km.name) {
      return AppLocalizationsKh.strings[this] ?? this;
    } else {
      return this;
    }
  }
}

extension ScaleInt on int {
  double get scale {
    return scaleFontSize(toDouble());
  }
}

extension ScaleDouble on double {
  double get scale {
    return scaleFontSize(this);
  }
}
