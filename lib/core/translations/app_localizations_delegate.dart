import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_app/core/translations/en.dart';
import 'package:flutter_clean_architecture_app/core/translations/km.dart';
import 'package:flutter_clean_architecture_app/core/utils/constant/enum.dart';

class AppLocalizationsDelegate extends LocalizationsDelegate {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return [LanguageType.en.name, LanguageType.km.name]
        .contains(locale.languageCode);
  }

  @override
  Future load(Locale locale) async {
    if (locale.languageCode == LanguageType.en.name) {
      return AppLocalizationsEn();
    } else if (locale.languageCode == LanguageType.km.name) {
      return AppLocalizationsKh();
    }
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
