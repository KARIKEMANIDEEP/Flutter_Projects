import 'package:flutter/material.dart';
import 'add.dart';



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // Set the app's primary theme color
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      home: MapMethodExample(),
    );
  }
}

class MapMethodExample extends StatelessWidget {
  final List<Map<String, String>> countriesData = [
    {"country": "India", "capital": "New Delhi"},
    {"country": "USA", "capital": "Washington, D.C."},
    {"country": "Canada", "capital": "Ottawa"},
    {"country": "Germany", "capital": "Berlin"},
    {"country": "France", "capital": "Paris"},
    {"country": "Japan", "capital": "Tokyo"},
    {"country": "Japan", "capital": "Tokyo"},
    {"country": "Japan", "capital": "Tokyo"},
    {"country": "Japan", "capital": "Tokyo"},
    {"country": "Japan", "capital": "Tokyo"},
    {"country": "Japan", "capital": "Tokyo"},
    {"country": "Japan", "capital": "Tokyo"},
    {"country": "Japan", "capital": "Tokyo"},
    {"country": "Japan", "capital": "Tokyo"},
    {"country": "Japan", "capital": "Tokyo"},
    {"country": "Japan", "capital": "Tokyo"},

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text('map() Method Example'),
      ),
      body: ListView(
        children: countriesData.map((countryInfo) {
          final String? country = countryInfo['country'];
          final String? capital = countryInfo['capital'];

          return ListTile(
            title: Text(country!),
            subtitle: Text('Capital: $capital'),
          );
        }).toList(),

      ),




    );
  }
}
