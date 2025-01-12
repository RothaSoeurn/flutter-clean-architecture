import 'package:flutter_clean_architecture_app/core/error/feature.dart';
import 'package:flutter_clean_architecture_app/core/helper/helper.dart';

class ServerException extends Feature {
  ServerException(super.message);

  @override
  void showMessage() {
    logger(message: message);
    super.showMessage();
  }
}

class NetworkException extends Feature {
  NetworkException(super.message);
  @override
  void showMessage() {
    logger(message: message);
    super.showMessage();
  }
}

class GeneralException extends Feature {
  GeneralException(super.message);
  @override
  void showMessage() {
    logger(message: message);
    super.showMessage();
  }
}
