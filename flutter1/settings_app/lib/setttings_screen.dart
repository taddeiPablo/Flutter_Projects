//
import 'package:flutter/material.dart';
import 'package:settings_app/preference_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

//
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

//
class _SettingsScreenState extends State<SettingsScreen> {
  //
  bool _darkMode = false;
  //
  String _language = 'es';
  //
  double _fontSize = 16.0;

  //
  @override
  void initState() {
    super.initState();
    _loadPreference();
  }

  //
  _loadPreference() async {
    // Simulate loading preference from a database or shared preferences
    final prefs = await SharedPreferences.getInstance();
    //
    setState(() {
      //
      _darkMode = prefs.getBool(PreferenceKeys.darkMode) ?? false;
      //
      _language = prefs.getString(PreferenceKeys.language) ?? 'es';
      //
      _fontSize = prefs.getDouble(PreferenceKeys.fontSize) ?? 16.0;
    });
  }

  _savePreference(String key, dynamic value) async {
    // Simulate saving preference to a database or shared preferences
    final prefs = await SharedPreferences.getInstance();
    //
    if (value is bool) {
      prefs.setBool(key, value);
    } else if (value is String) {
      prefs.setString(key, value);
    } else if (value is double) {
      prefs.setDouble(key, value);
    }
  }

  //
  @override
  Widget build(BuildContext context) {
    //
    return MaterialApp(
      //
      theme: _darkMode ? ThemeData.dark() : ThemeData.light(),
      //
      home: Scaffold(
        appBar: AppBar(title: const Text('Settings')),
        body: settingsMethod(),
      ),
    );
  }

  //
  Column settingsMethod() {
    return Column(
      children: [
        //
        SwitchListTile(
          title: const Text('Dark Mode'),
          value: _darkMode,
          onChanged: (value) {
            setState(() {
              _darkMode = value;
              _savePreference(PreferenceKeys.darkMode, _darkMode);
            });
          },
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            top: 8,
            bottom: 8,
          ),
          //
          child: DropdownButtonFormField(
            value: _language,
            items: [
              DropdownMenuItem(value: 'en', child: Text('English')),
              DropdownMenuItem(value: 'es', child: Text('Spanish')),
              DropdownMenuItem(value: 'fr', child: Text('French')),
            ],
            onChanged: (language) {
              if (language != null) {
                setState(() {
                  _language = language;
                  _savePreference(PreferenceKeys.language, _language);
                });
              }
            },
            decoration: const InputDecoration(
              labelText: 'Language',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        Text("Tamaño de la fuente: ${_fontSize.toStringAsFixed(0)}"),
        //
        Slider(
          value: _fontSize,
          min: 10,
          max: 30,
          onChanged: (value) {
            setState(() {
              _fontSize = value;
              _savePreference(PreferenceKeys.fontSize, _fontSize);
            });
          },
        ),
      ],
    );
  }
}
