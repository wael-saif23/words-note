import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:words_note/models/word_type_adaptor.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(WordTypeAdaptor());
  await Hive.openBox('words');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(),
    );
  }
}
