import 'dart:isolate';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _result = "Waiting...";

  @override
  void initState() {
    super.initState();

    _startIsolate();
  }

  static void isolateTask(SendPort sendPort) {
    int result = 0;
    for (int i = 0; i <= 100000000; i++) {
      result += i;
    }
    sendPort.send(result); // Send the result back to the main isolate
  }

  Future<void> _startIsolate() async {
    final ReceivePort receivePort = ReceivePort();
    try {
      // Spawn the isolate and pass the sendPort
      await Isolate.spawn(isolateTask, receivePort.sendPort);

      // Listen for the message from the isolate
      receivePort.listen((message) {
        setState(() {
          _result = 'Result from isolate: $message';
        });
        receivePort.close();
      });
    } catch (e) {
      // Handle any error that might occur during isolate spawning
      setState(() {
        _result = 'Error occurred: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Text(_result, style: const TextStyle(fontSize: 18)),
          // const SizedBox(height: 20),
          // ElevatedButton(
          //   onPressed: _startIsolate,
          //   child: const Text('Start Isolate'),
          // ),
          SizedBox(
            height: 300,
            child: CarouselView.weighted(
              padding: EdgeInsets.all(10),
              itemSnapping: true,
              flexWeights: [3],
              children: [
                Image.network(
                  'https://cdn.pixabay.com/photo/2022/02/01/02/47/smartphone-6985369_1280.png',
                  fit: BoxFit.cover,
                ),
                Image.network(
                    'https://cdn.martech.zone/wp-content/uploads/2019/01/ios-android-mobile-app-banner.png',
                    fit: BoxFit.cover),
                Image.network(
                    'https://twinr.dev/wp-content/uploads/2024/06/1.-Featured-Image-1024x536.webp',
                    fit: BoxFit.cover),
              ],
            ),
          )
        ],
      ),
    );
  }
}
