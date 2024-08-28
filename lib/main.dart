import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:words_note/controller/read_words_cubit/read_words_cubit.dart';
import 'package:words_note/controller/write_words_cubit/write_words_cubit.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ReadWordsCubit()..getWords(),
        ),
        BlocProvider(
          create: (context) => WriteWordsCubit(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeManager.getTheme(),
        debugShowCheckedModeBanner: false,
        home: const HomeView(),
      ),
    );
  }
}
