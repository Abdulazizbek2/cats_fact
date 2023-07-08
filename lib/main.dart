import 'package:cats_fact/blocs/get_facts/get_facts_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/first/first.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Namer App',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: Provider(
        create: (_) => GetFactsBloc(),
        child: const MyHomePage(),
        dispose: (context, value) {
          value.close();
        },
      ),
    );
  }
}
