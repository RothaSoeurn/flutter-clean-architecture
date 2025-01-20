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
          Text(_result, style: const TextStyle(fontSize: 18)),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _startIsolate,
            child: const Text('Start Isolate'),
          ),
        ],
      ),
    );
  }
}
