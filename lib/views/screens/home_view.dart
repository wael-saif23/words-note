import 'package:flutter/material.dart';

import 'package:words_note/views/styles/color_manager.dart';
import 'package:words_note/views/widgets/add_word_dialog.dart';
import 'package:words_note/views/widgets/language_filter_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _getFloatingActionButton(context),
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        child: Column(
          children: [
            LanguageFilterWidget(),

          ],
        ),
      ),
    );
  }

  FloatingActionButton _getFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => showDialog(
        context: context,
        builder: (context) => const AddWordDialog(),
      ),
      backgroundColor: ColorManager.emerald,
      child: const Icon(
        Icons.add,
        color: ColorManager.midnightGreen,
      ),
    );
  }
}
