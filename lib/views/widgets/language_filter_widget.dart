import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:words_note/controller/read_words_cubit/read_words_cubit.dart';
import 'package:words_note/views/styles/color_manager.dart';
import 'package:words_note/views/widgets/filter_button.dart';

class LanguageFilterWidget extends StatelessWidget {
  const LanguageFilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReadWordsCubit, ReadWordsState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _getLanguageFiltertoString(
                  languageFilter: ReadWordsCubit.get(context).languageFilter),
              style: const TextStyle(
                  fontSize: 20,
                  color: ColorManager.emerald,
                  fontWeight: FontWeight.bold),
            ),
            const FilterButton(),
          ],
        );
      },
    );
  }

  String _getLanguageFiltertoString({required LanguageFilter languageFilter}) {
    switch (languageFilter) {
      case LanguageFilter.arabic:
        return 'Arabic Words';
      case LanguageFilter.english:
        return 'English Words';
      case LanguageFilter.both:
        return 'All Words';
    }
  }
}
