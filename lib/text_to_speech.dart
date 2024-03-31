import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class TextToSpeech extends StatefulWidget {
  const TextToSpeech({super.key});

  @override
  State<TextToSpeech> createState() => _TextToSpeechState();
}

class _TextToSpeechState extends State<TextToSpeech> {
  TextEditingController value = TextEditingController();
  FlutterTts flutterTts = FlutterTts();
  speak() async {
    await flutterTts.speak(value.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        flutterTts.stop();
      },child: const Icon(Icons.stop_circle),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(28),
            child: Center(
              child: TextField(
                controller: value,
                decoration: const InputDecoration(hintText: 'Enter Text'),
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          ElevatedButton(
              onPressed: () {}, child: const Icon(Icons.volume_up_outlined))
        ],
      ),
    );
  }
}
