import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_app/core/utils/constant/enum.dart';
import 'package:flutter_clean_architecture_app/data/models/message_model.dart';
import 'package:flutter_clean_architecture_app/presentation/widgets/image_network_catch.dart';

abstract class MessageFactory {
  Widget build(Message message);
}

class MessageFactoryImpl {
  // Use the factory to get the correct widget
  // final messageWidget = MessageFactoryImpl.create(message.type).build(message);

  static MessageFactory create(ChatMessageType type) {
    switch (type) {
      case ChatMessageType.text:
        return TextMessageFactory();
      case ChatMessageType.image:
        return ImageMessageFactory();
      case ChatMessageType.voice:
        return VoiceMessageFactory();
      case ChatMessageType.file:
        return FileMessageFactory();
      case ChatMessageType.location:
        return LocationMessageFactory();
    }
  }
}

class TextMessageFactory implements MessageFactory {
  @override
  Widget build(Message message) {
    return Text(message.content);
  }
}

class ImageMessageFactory implements MessageFactory {
  @override
  Widget build(Message message) {
    return ImageNetworkCatch(imageUrl: message.content, hash: '');
  }
}

class ViewMessageFactory implements MessageFactory {
  @override
  Widget build(Message message) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class LocationMessageFactory implements MessageFactory {
  @override
  Widget build(Message message) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class FileMessageFactory implements MessageFactory {
  @override
  Widget build(Message message) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class VoiceMessageFactory implements MessageFactory {
  @override
  Widget build(Message message) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
