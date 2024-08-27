import 'package:flutter/material.dart';

import 'package:words_note/views/styles/color_manager.dart';
import 'package:words_note/views/widgets/filter_dialoge.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
            context: context, builder: (context) => const FilterDialoge());
      },
      child: const CircleAvatar(
        backgroundColor: ColorManager.emerald,
        radius: 20,
        child: Icon(
          Icons.filter_list,
          color: ColorManager.midnightGreen,
        ),
      ),
    );
  }
}
