import 'package:flutter/material.dart';
class NewBroadCast extends StatefulWidget {
  const NewBroadCast({super.key});

  @override
  State<NewBroadCast> createState() => _NewBroadCastState();
}

class _NewBroadCastState extends State<NewBroadCast> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('NewBroadCast'),),
      body: Center(
        child: Text('New BroadCast'),
      ),
    );
  }
}
