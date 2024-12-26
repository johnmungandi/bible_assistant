import 'package:flutter/material.dart';

class TestingModel extends StatefulWidget {
  const TestingModel({super.key});

  @override
  State<TestingModel> createState() => _TestingModelState();
}

class _TestingModelState extends State<TestingModel> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Testing'),
      ),
      body: const Center(
        child: Text('Testing'),
      ),
    );
  }
}