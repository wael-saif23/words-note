import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:words_note/controller/write_words_cubit/write_words_cubit.dart';
import 'package:words_note/views/styles/color_manager.dart';
import 'package:words_note/views/widgets/ar_or_en_widget.dart';
import 'package:words_note/views/widgets/colors_wedget.dart';
import 'package:words_note/views/widgets/custom_form.dart';

class AddWordDialog extends StatefulWidget {
  const AddWordDialog({super.key});

  @override
  State<AddWordDialog> createState() => _AddWordDialogState();
}

class _AddWordDialogState extends State<AddWordDialog> {
 final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: ColorManager.transparent,
      child: BlocBuilder<WriteWordsCubit, WriteWordsState>(
          builder: (context, state) {
        return AnimatedContainer(
          decoration: BoxDecoration(
              color:
                  Color(WriteWordsCubit.get(context).colorCode).withOpacity(.8),
              borderRadius: const BorderRadius.all(Radius.circular(12))),
          duration: const Duration(milliseconds: 500),
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              ArOrEnWidget(
                isSelected: WriteWordsCubit.get(context).isArabic,
                colorCode: WriteWordsCubit.get(context).colorCode,
              ),
              const SizedBox(height: 8),
              ColorsWedget(
                  colorActiveIndex: WriteWordsCubit.get(context).colorCode),
              const SizedBox(height: 32),
              CustomForm(lable: 'Add Word', formKey: formKey)
            ],
          ),
        );
      }),
    );
  }
}
