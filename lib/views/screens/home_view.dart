import 'package:flutter/material.dart';
import 'package:words_note/views/styles/color_manager.dart';
import 'package:words_note/views/widgets/add_word_dialog.dart';
import 'package:words_note/views/widgets/colors_wedget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _getFloatingActionButton(context),
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: const Column(
        children: [
          
        ],
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
