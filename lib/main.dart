import 'package:flutter/material.dart';
import 'package:flutter_working_with_provider/provider/auth_provider.dart';
import 'package:flutter_working_with_provider/provider/count_provider.dart';
import 'package:flutter_working_with_provider/provider/example_one_provider.dart';
import 'package:flutter_working_with_provider/provider/favourite_provider.dart';
import 'package:flutter_working_with_provider/provider/theme_changer_provider.dart';
import 'package:flutter_working_with_provider/screen/count_example.dart';
import 'package:flutter_working_with_provider/screen/dark_theme_screen.dart';
import 'package:flutter_working_with_provider/screen/example_one_screen.dart';
import 'package:flutter_working_with_provider/screen/favourite/favorite_screen_without_provider.dart';
import 'package:flutter_working_with_provider/screen/favourite/favourite_screen.dart';
import 'package:flutter_working_with_provider/screen/login_screen.dart';
import 'package:flutter_working_with_provider/screen/value_notify_listner.dart';
import 'package:provider/provider.dart';

import 'Statefull_widget_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  /*
  // below is for the count screen.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CountProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          // useMaterial3: true,
          primarySwatch: Colors.blue,
        ),
        // home: StatefulWidgetScreen(),
        home: CountExample(),
      ),
    );
  }
  */
  // below is for the ExampleOne Screen
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> CountProvider()),
        ChangeNotifierProvider(create: (_)=> ExampleOneProvider()),
        ChangeNotifierProvider(create: (_)=> FavouriteItemProvider()),
        ChangeNotifierProvider(create: (_)=> ThemeChangerProvider()),
        ChangeNotifierProvider(create: (_)=> AuthProvider()),
      ],
      child: Builder(
        builder: (BuildContext context){
          final themeChangerProvider = Provider.of<ThemeChangerProvider>(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            themeMode: themeChangerProvider.themeMode,
            theme: ThemeData(
              primarySwatch: Colors.blue,
              brightness: Brightness.light,
              iconTheme: IconThemeData(color: Colors.blue),
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              primarySwatch: Colors.yellow,
              iconTheme: IconThemeData(color: Colors.green),
              appBarTheme: AppBarTheme(
                color: Colors.green,
              )
            ),
            // ------
            // home: ExampleOneScreen(),
            // home: FavouriteScreenWithoutProvider(),
            // home: FavouriteScreen(),
            // home: DarkThemeScreen(),
            // home: NotifyListenerScreen(),
            home: LogInScreen(),
          );
        },
      )
    );
  }
}










