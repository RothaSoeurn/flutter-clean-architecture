class Message {
  final String id;
  final String sender;
  final String receiver;
  final String content;
  final String type; // text, voice, file
  final DateTime timestamp;

  Message({
    required this.id,
    required this.sender,
    required this.receiver,
    required this.content,
    required this.type,
    required this.timestamp,
  });
}
