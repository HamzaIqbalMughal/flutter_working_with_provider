import 'package:flutter/material.dart';
import 'package:flutter_working_with_provider/provider/theme_changer_provider.dart';
import 'package:provider/provider.dart';

class DarkThemeScreen extends StatefulWidget {
  const DarkThemeScreen({super.key});

  @override
  State<DarkThemeScreen> createState() => _DarkThemeScreenState();
}

class _DarkThemeScreenState extends State<DarkThemeScreen> {
  @override
  Widget build(BuildContext context) {
    final themeChangerProvider = Provider.of<ThemeChangerProvider>(context);
    return Scaffold(
      appBar: AppBar(
      ),
      body: Column(
        children: [
          RadioListTile(
            title: Text('Light Mode'),
              value: ThemeMode.light,
              groupValue: themeChangerProvider.themeMode,
              onChanged: themeChangerProvider.setTheme,
          ),
          RadioListTile(
            title: Text('Dark Mode'),
            value: ThemeMode.dark,
            groupValue: themeChangerProvider.themeMode,
            onChanged: themeChangerProvider.setTheme,
          ),
          RadioListTile(
            title: Text('System Mode'),
            value: ThemeMode.system,
            groupValue: themeChangerProvider.themeMode,
            onChanged: themeChangerProvider.setTheme,
          ),
          Icon(Icons.favorite),
        ],
      ),
    );
  }
}
