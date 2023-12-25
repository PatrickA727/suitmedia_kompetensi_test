import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'PageOne.dart';
import 'prov/providerr.dart';
import 'prov/providerrr.dart';
import 'SecondPage.dart';
import 'PageThree.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => UserProviderr()),
      ],
      child: MaterialApp(
        title: 'SuitMedia Flutter Test',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
          useMaterial3: true,
        ),
        home: MainPage(),
        routes: {
          '/PageTwo': (context) => PageTwo(),
          '/PageThree': (context) => PageThree(),
        },
      ),
    );
  }
}
