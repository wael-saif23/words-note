import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:words_note/controller/read_words_cubit/read_words_cubit.dart';
import 'package:words_note/controller/write_words_cubit/write_words_cubit.dart';

import 'package:words_note/views/widgets/ar_or_en_widget.dart';
import 'package:words_note/views/widgets/custom_form.dart';
import 'package:words_note/views/widgets/done_button.dart';

class UpdateWordDialog extends StatefulWidget {
  const UpdateWordDialog(
      {super.key, required this.isExampleWord, required this.colorCode});
  final bool isExampleWord;
  final int colorCode;
  @override
  State<UpdateWordDialog> createState() => _UpdateWordDialogState();
}

class _UpdateWordDialogState extends State<UpdateWordDialog> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor: Color(widget.colorCode),
        child: BlocBuilder<WriteWordsCubit, WriteWordsState>(
          builder: (context, state) {
            return AnimatedContainer(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              duration: const Duration(milliseconds: 500),
              padding: const EdgeInsets.all(12),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ArOrEnWidget(
                      isSelected: WriteWordsCubit.get(context).isArabic,
                      colorCode: widget.colorCode,
                    ),
                    const SizedBox(height: 12),
                    CustomForm(
                        lable: widget.isExampleWord
                            ? 'Expamples'
                            : 'Similar Words',
                        formKey: _formKey),
                    const SizedBox(height: 24),
                    DoneButton(
                      colorCode: widget.colorCode,
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
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
