import 'package:firebase/login.dart';
import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void _logout(){
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context)=>Login())
    );
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home page'),
      actions: [
        IconButton(
          icon: Icon(Icons.logout),
          tooltip: 'Logout',
          onPressed: _logout,
        )
      ],
      ),
      body: Center(
        child: Text('Home Page!!'),
      ),
    );
  }
}
