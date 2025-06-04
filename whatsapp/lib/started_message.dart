import 'package:flutter/material.dart';
class StartedMessage extends StatefulWidget {
  const StartedMessage({super.key});

  @override
  State<StartedMessage> createState() => _StartedMessageState();
}

class _StartedMessageState extends State<StartedMessage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('StartedMessage'),),
      body: Center(
        child: Text('Started Message'),
      ),
    );
  }
}
