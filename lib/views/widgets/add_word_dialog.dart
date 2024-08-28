import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:words_note/controller/read_words_cubit/read_words_cubit.dart';
import 'package:words_note/controller/write_words_cubit/write_words_cubit.dart';
import 'package:words_note/views/styles/color_manager.dart';
import 'package:words_note/views/widgets/ar_or_en_widget.dart';
import 'package:words_note/views/widgets/colors_wedget.dart';
import 'package:words_note/views/widgets/custom_form.dart';
import 'package:words_note/views/widgets/done_button.dart';

class AddWordDialog extends StatefulWidget {
  const AddWordDialog({super.key});

  @override
  State<AddWordDialog> createState() => _AddWordDialogState();
}

class _AddWordDialogState extends State<AddWordDialog> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return 
    Dialog(
        backgroundColor: ColorManager.transparent,
        child: BlocConsumer<WriteWordsCubit, WriteWordsState>(
          listener: (context, state) {
            if (state is WriteWordsSuccess) {
              Navigator.pop(context);
            } else if (state is WriteWordsFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    backgroundColor: ColorManager.sunglow,
                    content: Text(
                      state.message,
                      style: const TextStyle(color: ColorManager.brightPink),
                    )),
              );
            }
          },
          builder: (context, state) {
            return AnimatedContainer(
              decoration: BoxDecoration(
                  color: Color(WriteWordsCubit.get(context).colorCode)
                      .withOpacity(.95),
                  borderRadius: const BorderRadius.all(Radius.circular(12))),
              duration: const Duration(milliseconds: 500),
              padding: const EdgeInsets.all(12),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ArOrEnWidget(
                      isSelected: WriteWordsCubit.get(context).isArabic,
                      colorCode: WriteWordsCubit.get(context).colorCode,
                    ),
                    const SizedBox(height: 12),
                    ColorsWedget(
                        colorActiveIndex:
                            WriteWordsCubit.get(context).colorCode),
                    const SizedBox(height: 24),
                    CustomForm(lable: 'Add Word', formKey: formKey),
                    const SizedBox(height: 24),
                    DoneButton(
                      colorCode: WriteWordsCubit.get(context).colorCode,
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          WriteWordsCubit.get(context).addWord();
                          ReadWordsCubit.get(context).getWords();
                        }
                        
                      },
                    )
                  ],
                ),
              ),
            );
          },
        ));
  
  }
}
