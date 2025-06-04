import 'package:flutter/material.dart';
class welcome extends StatefulWidget {
  const welcome({super.key});

  @override
  State<welcome> createState() => _welcomeState();
}

class _welcomeState extends State<welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HOME PAGE"),
      ),
      body: Center(
        child: Container(
          child: Center(
            child: Text("WELCOME  !!"),
          ),
        ),
      ),
    );
  }
}
