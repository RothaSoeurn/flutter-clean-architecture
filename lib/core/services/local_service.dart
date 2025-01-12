import 'dart:ui';

class LocalService {
  static final LocalService _instance = LocalService._internal();
  LocalService._internal();
  static LocalService get instance => _instance;

  factory LocalService() {
    return _instance;
  }
  Locale currentLocale = Locale('en', 'EN');
}
