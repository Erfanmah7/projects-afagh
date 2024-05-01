import 'package:ardakanafagh/widgets/maintab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [Locale('fa')],
      theme: ThemeData(primarySwatch: Colors.indigo),
      title: "Ardakanafagh.ir",
      home: MainTab(),
      debugShowCheckedModeBanner: false,
    );
  }
}
