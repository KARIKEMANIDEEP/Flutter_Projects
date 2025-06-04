import 'package:flutter/material.dart';
class LinkedDevice extends StatefulWidget {
  const LinkedDevice({super.key});

  @override
  State<LinkedDevice> createState() => _LinkedDeviceState();
}

class _LinkedDeviceState extends State<LinkedDevice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('LinkedDevice'),),
      body: Center(
        child: Text('Linded Device'),
      ),
    );
  }
}
