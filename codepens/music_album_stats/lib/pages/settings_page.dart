import 'package:flutter/material.dart';
import 'package:music_album_stats/data/theme_provider.dart';
import 'package:music_album_stats/main.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = ThemeStateContainer.of(context);

    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: SwitchListTile(
        title: Text('Dark Mode'),
        value: themeProvider.isDarkMode,
        secondary: Icon(Icons.brightness_6),
        onChanged: (bool state) => setState(() {
          themeProvider.update(state);
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MainApp(3),
              ));
        }),
      ),
    );
  }
}
