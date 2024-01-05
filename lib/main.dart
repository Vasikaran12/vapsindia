import 'package:flutter/material.dart';
import 'package:vapsindia/vaps_screen.dart';
import 'package:provider/provider.dart';

import 'vaps_provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<VapsProvider>(create: (_) => VapsProvider())
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const VapsScreen(),
    );
  }
}
