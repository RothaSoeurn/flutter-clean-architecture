import 'package:flutter/material.dart';
// import 'package:flutter_clean_architecture_app/core/helper/helper.dart';
// import 'package:flutter_clean_architecture_app/presentation/screens/chat/message_builder.dart';
// import 'package:flutter_clean_architecture_app/presentation/screens/chat/message_director.dart';

class MainScreen extends StatefulWidget {
  static const routeName = 'main';
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    // final textBuilder = TextMessageBuilder();
    // final textDirector = MessageDirector(textBuilder);
    // final textMessage = textDirector.constructMessage(
    //   sender: 'Alice',
    //   receiver: 'Bob',
    //   content: 'Hello, Bob!',
    // );
    // logger(
    //   message:
    //       "textMessage == ${textMessage.id} ${textMessage.sender} ${textMessage.receiver}  ${textMessage.content} ${textMessage.timestamp} ${textMessage.type}",
    // );

    // // Construct a voice message
    // final voiceBuilder = VoiceMessageBuilder();
    // final voiceDirector = MessageDirector(voiceBuilder);
    // final voiceMessage = voiceDirector.constructMessage(
    //   sender: 'Alice',
    //   receiver: 'Bob',
    //   content: 'voice_message.mp3',
    // );
    // logger(
    //   message:
    //       "voiceMessage == ${voiceMessage.id} ${voiceMessage.sender} ${voiceMessage.receiver}  ${voiceMessage.content} ${voiceMessage.timestamp} ${voiceMessage.type}",
    // );

    // // Construct an image message
    // final imageBuilder = ImageMessageBuilder();
    // final imageDirector = MessageDirector(imageBuilder);
    // final imageMessage = imageDirector.constructMessage(
    //   sender: 'Alice',
    //   receiver: 'Bob',
    //   content: 'image.png',
    // );
    // logger(
    //   message:
    //       "imageMessage == ${imageMessage.id} ${imageMessage.sender} ${imageMessage.receiver}  ${imageMessage.content} ${imageMessage.timestamp} ${imageMessage.type}",
    // );

    // // Construct a file message
    // final fileBuilder = FileMessageBuilder();
    // final fileDirector = MessageDirector(fileBuilder);
    // final fileMessage = fileDirector.constructMessage(
    //   sender: 'Alice',
    //   receiver: 'Bob',
    //   content: 'document.pdf',
    // );
    // logger(
    //   message:
    //       "fileMessage == ${fileMessage.id} ${fileMessage.sender} ${fileMessage.receiver}  ${fileMessage.content} ${fileMessage.timestamp} ${fileMessage.type}",
    // );
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: 'Library',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
