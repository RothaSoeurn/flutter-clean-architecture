import 'package:flutter_clean_architecture_app/data/models/message_model.dart';
import 'package:flutter_clean_architecture_app/presentation/screens/chat/message_builder.dart';

class MessageDirector {
  final MessageBuilder builder;
  MessageDirector(this.builder);

  Message constructMessage({
    required String sender,
    required String receiver,
    required String content,
  }) {
    builder.setSender(sender);
    builder.setReceiver(receiver);
    builder.setContent(content);
    return builder.build();
  }
}
