import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:words_note/controller/read_words_cubit/read_words_cubit.dart';
import 'package:words_note/views/styles/color_manager.dart';

class FilterDialoge extends StatelessWidget {
  const FilterDialoge({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReadWordsCubit, ReadWordsState>(
      builder: (context, state) {
        return Dialog(
          backgroundColor: ColorManager.blue,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _textFilterName('Language'),
                _getLanguageFilter(context),
                const Divider(
                  height: 24,
                  color: ColorManager.sunglow,
                ),
                _textFilterName('Sorted By'),
                _getSortedByFilter(context),
                const Divider(
                  height: 24,
                  color: ColorManager.sunglow,
                ),
                _textFilterName('Sorting Type'),
                _getSortingTypeFilter(context),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _getLanguageFilter(BuildContext context) {
    return _getFilterField(
      labals: ['Arabic', 'English', 'Both'],
      onTaps: [
        () => ReadWordsCubit.get(context).updateLanguageFilter(
              LanguageFilter.arabic,
            ),
        () => ReadWordsCubit.get(context).updateLanguageFilter(
              LanguageFilter.english,
            ),
        () => ReadWordsCubit.get(context).updateLanguageFilter(
              LanguageFilter.both,
            ),
      ],
      conditionsOfActivation: [
        ReadWordsCubit.get(context).languageFilter == LanguageFilter.arabic,
        ReadWordsCubit.get(context).languageFilter == LanguageFilter.english,
        ReadWordsCubit.get(context).languageFilter == LanguageFilter.both,
      ],
    );
  }

  Widget _getSortedByFilter(BuildContext context) {
    return _getFilterField(
      labals: ['Time', 'Word Length'],
      onTaps: [
        () => ReadWordsCubit.get(context).updateSortedByFilter(
              SortedByFilter.time,
            ),
        () => ReadWordsCubit.get(context).updateSortedByFilter(
              SortedByFilter.length,
            ),
      ],
      conditionsOfActivation: [
        ReadWordsCubit.get(context).sortedByFilter == SortedByFilter.time,
        ReadWordsCubit.get(context).sortedByFilter == SortedByFilter.length,
      ],
    );
  }

  Widget _getSortingTypeFilter(BuildContext context) {
    return _getFilterField(
      labals: ['ascending', 'descending'],
      onTaps: [
        () => ReadWordsCubit.get(context).updateSortingTypeFilter(
              SortingTypeFilter.ascending,
            ),
        () => ReadWordsCubit.get(context).updateSortingTypeFilter(
              SortingTypeFilter.descending,
            ),
      ],
      conditionsOfActivation: [
        ReadWordsCubit.get(context).sortingTypeFilter ==
            SortingTypeFilter.ascending,
        ReadWordsCubit.get(context).sortingTypeFilter ==
            SortingTypeFilter.descending,
      ],
    );
  }

  Widget _getFilterField({
    required List<String> labals,
    required List<VoidCallback> onTaps,
    required List<bool> conditionsOfActivation,
  }) {
    return Row(
      children: [
        for (int i = 0; i < labals.length; i++)
          Expanded(
              child: InkWell(
            borderRadius: BorderRadius.circular(8),
            splashColor: ColorManager.emerald.withOpacity(.5),
            onTap: onTaps[i],
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: ColorManager.sunglow),
                  borderRadius: BorderRadius.circular(8),
                  color: conditionsOfActivation[i]
                      ? ColorManager.emerald
                      : ColorManager.black,
                ),
                padding: const EdgeInsets.all(4),
                child: Center(
                  child: Text(
                    labals[i],
                    style: TextStyle(
                      fontSize: 16,
                      color: conditionsOfActivation[i]
                          ? ColorManager.black
                          : ColorManager.emerald,
                    ),
                  ),
                ),
              ),
            ),
          ))
      ],
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
