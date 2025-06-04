import 'package:flutter/material.dart';
class Payments extends StatefulWidget {
  const Payments({super.key});

  @override
  State<Payments> createState() => _PaymentsState();
}

class _PaymentsState extends State<Payments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Payments'),),
      body: Center(
        child: Text('Payments'),
      ),
    );
  }
}
