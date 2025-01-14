import 'package:flutter_clean_architecture_app/core/helper/helper.dart';
import 'package:flutter_clean_architecture_app/core/utils/constant/enum.dart';
import 'package:flutter_clean_architecture_app/data/models/message_model.dart';

abstract class MessageBuilder {
  void setSender(String sender) {}
  void setReceiver(String receiver) {}
  void setContent(String content);
  Message build();
}

class TextMessageBuilder implements MessageBuilder {
  late String _sender;
  late String _receiver;
  late String _content;
  @override
  Message build() {
    return Message(
      id: generateUniqueId(),
      content: _content,
      sender: _sender,
      receiver: _receiver,
      type: ChatMessageType.text.name,
      timestamp: DateTime.now(),
    );
  }

  @override
  void setContent(String content) {
    _content = content;
  }

  @override
  void setReceiver(String receiver) {
    _receiver = receiver;
  }

  @override
  void setSender(String sender) {
    _sender = sender;
  }
}

class VoiceMessageBuilder implements MessageBuilder {
  late String _sender;
  late String _receiver;
  late String _content;
  @override
  Message build() {
    return Message(
      id: generateUniqueId(),
      sender: _sender,
      receiver: _receiver,
      timestamp: DateTime.now(),
      type: ChatMessageType.voice.name,
      content: _content,
    );
  }

  @override
  void setContent(String content) {
    _content = content;
  }

  @override
  void setReceiver(String receiver) {
    _receiver = receiver;
  }

  @override
  void setSender(String sender) {
    _sender = sender;
  }
}

class ImageMessageBuilder implements MessageBuilder {
  late String _sender;
  late String _receiver;
  late String _content;
  @override
  Message build() {
    return Message(
      id: generateUniqueId(),
      content: _content,
      sender: _sender,
      receiver: _receiver,
      timestamp: DateTime.now(),
      type: ChatMessageType.image.name,
    );
  }

  @override
  void setContent(String content) {
    _content = content;
  }

  @override
  void setReceiver(String receiver) {
    _receiver = receiver;
  }

  @override
  void setSender(String sender) {
    _sender = sender;
  }
}

class FileMessageBuilder implements MessageBuilder {
  late String _sender;
  late String _receiver;
  late String _content;

  @override
  Message build() {
    return Message(
      id: generateUniqueId(),
      content: _content,
      sender: _sender,
      receiver: _receiver,
      timestamp: DateTime.now(),
      type: ChatMessageType.file.name,
    );
  }

  @override
  void setContent(String content) => _content = content;

  @override
  void setReceiver(String receiver) => _receiver = receiver;

  @override
  void setSender(String sender) => _sender = sender;
}

class LocationMessageBuilder implements MessageBuilder {
  late String _sender;
  late String _receiver;
  late String _content;

  @override
  Message build() {
    return Message(
      id: generateUniqueId(),
      content: _content,
      sender: _sender,
      receiver: _receiver,
      timestamp: DateTime.now(),
      type: ChatMessageType.location.name,
    );
  }

  @override
  void setContent(String content) => _content = content;

  @override
  void setReceiver(String receiver) => _receiver = receiver;

  @override
  void setSender(String sender) => _sender = sender;
}
