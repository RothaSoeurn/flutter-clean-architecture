import 'package:flutter_clean_architecture_app/data/models/message_model.dart';
import 'package:flutter_clean_architecture_app/presentation/screens/chat/message_handler.dart';

class ChatContext {
  late MessageHandler _messageHandler;
  void setMessageHandler(MessageHandler messageHandler) {
    _messageHandler = messageHandler;
  }

  void executeMessageHandler(Message message) {
    _messageHandler.handleMessage(message);
  }
}
