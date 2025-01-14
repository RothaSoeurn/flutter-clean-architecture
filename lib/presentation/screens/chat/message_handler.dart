import 'package:flutter_clean_architecture_app/data/models/message_model.dart';

abstract class MessageHandler {
  void handleMessage(Message messsage);
}

class TextMessageHandler implements MessageHandler {
  @override
  void handleMessage(Message messsage) {
    // TODO: implement handleMessage
  }
}

class VoiceMessageHandler implements MessageHandler {
  @override
  void handleMessage(Message messsage) {
    // TODO: implement handleMessage
  }
}

class ImageMessageHandler implements MessageHandler {
  @override
  void handleMessage(Message messsage) {
    // TODO: implement handleMessage
  }
}

class LocationMessageHandler implements MessageHandler {
  @override
  void handleMessage(Message messsage) {
    // TODO: implement handleMessage
  }
}

class FileMessageHandler implements MessageHandler {
  @override
  void handleMessage(Message messsage) {
    // TODO: implement handleMessage
  }
}
