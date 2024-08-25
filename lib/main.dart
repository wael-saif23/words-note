import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:words_note/hive_constants.dart';
import 'package:words_note/models/word_type_adaptor.dart';
import 'package:words_note/views/screens/home_view.dart';
import 'package:words_note/views/styles/theme_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(WordTypeAdaptor());
  await Hive.openBox(HiveConstants.wordsBox);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeManager.getTheme(),
      debugShowCheckedModeBanner: false,
      home: const HomeView(),
    );
  }
}
