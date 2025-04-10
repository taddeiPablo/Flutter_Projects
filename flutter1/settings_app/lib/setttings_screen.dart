// immportando librerias necesarias para trabajara en este ejemplo
import 'package:flutter/material.dart';
import 'package:settings_app/preference_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

// aaqui creo un wwidget llamado SettingsScreen que extiende de StatefulWidget
// y que tiene un constructor sin argumentos
// Lo creo para crear una vista de configuraciones.
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  //aqui creo una clase para el manejo de estados.
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

// aqui creo la clase _SettingsScreenState que extiende de State<SettingsScreen>
// y que tiene un constructor sin argumentos
// Lo creo para crear una vista de configuraciones.
// Esta clase es la que se encarga de manejar el estado de la vista de configuraciones
class _SettingsScreenState extends State<SettingsScreen> {
  // variable tipo bool para setear el modo oscuro
  bool _darkMode = false;
  // variable tipo String para setear el idioma
  String _language = 'es';
  // variable tipo double para setear el tamaño de la fuente
  double _fontSize = 16.0;

  // aqui sobreescribo un metodo que viene de la clase State
  // y que se llama initState
  // Lo hago para inicializar el estado de la vista de configuraciones
  // Este metodo se llama una sola vez cuando se crea la vista de configuraciones
  // y es el lugar donde se inicializan las variables de estado.
  @override
  void initState() {
    super.initState();
    //
    _loadPreference();
  }

  // aqui en este metodo cargo las preferencia de la aplicacion
  // previamente guardadess en el dispossitivo
  _loadPreference() async {
    // Simulate loading preference from a database or shared preferences
    final prefs = await SharedPreferences.getInstance();
    // aqui manejamos el estado de la aplicacion
    setState(() {
      // aqui recuperamos los valores de las preferencias guardadas
      // el valor del darkmode
      _darkMode = prefs.getBool(PreferenceKeys.darkMode) ?? false;
      // aqui recuperamos el valor del idioma configurado
      _language = prefs.getString(PreferenceKeys.language) ?? 'es';
      // aqui recuperamos el valor del tamaño de la fuente
      _fontSize = prefs.getDouble(PreferenceKeys.fontSize) ?? 16.0;
    });
  }

  // aqui creo una funcion para guardar las preferencias de la aplicacion
  // como por ejemplo lo que tiene que ver con el darkmode
  // el idioma y el tamaño de la fuente
  _savePreference(String key, dynamic value) async {
    // Simulate saving preference to a database or shared preferences
    final prefs = await SharedPreferences.getInstance();
    // aqui guardamos el valor del darkmode
    // el idioma y el tamaño de la fuente
    if (value is bool) {
      prefs.setBool(key, value);
    } else if (value is String) {
      prefs.setString(key, value);
    } else if (value is double) {
      prefs.setDouble(key, value);
    }
  }

  // aqui sobreescribo el metodo build que viene de la clase State
  // y que se llama cada vez que se construye la vista de configuraciones
  @override
  Widget build(BuildContext context) {
    // aqui creo una variable tipo bool que se llama darkMode
    // y que se inicializa con el valor del darkmode
    return MaterialApp(
      // aqui le asigno el tema a la aplicacion
      theme: _darkMode ? ThemeData.dark() : ThemeData.light(),
      // aqui le asigno el home a la aplicacion
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
