import 'package:bible_assistant/stt-models/Telugu-TTS.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      home: MaterialApp(home: TeluguSTTScreen()),
    );
  }
}