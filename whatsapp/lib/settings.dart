import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_provider.dart';
class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: ListView(
        children: [
          ListTile(
            title: Text('Dark mode'),
            trailing: Switch(
                value: themeProvider.isDarkMode,
                onChanged: (value){
                  themeProvider.toggleTheme(value);
                }
            ),
          )
        ],
      ),
    );
  }
}
