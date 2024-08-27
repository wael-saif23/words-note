import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:words_note/views/styles/color_manager.dart';

class FilterDialoge extends StatelessWidget {
  const FilterDialoge({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: ColorManager.black,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _textFilterName('Language'),
            _textFilterName('Sorted By'),
            _textFilterName('Sorting Type'),
          ],
        ),
      ),
    );
  }

  

  Widget _textFilterName(
    String text,
  ) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 20,
        color: ColorManager.emerald,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
