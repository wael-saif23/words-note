import 'package:flutter/material.dart';
import 'package:words_note/controller/write_words_cubit/write_words_cubit.dart';
import 'package:words_note/views/styles/color_manager.dart';

class CustomForm extends StatefulWidget {
  const CustomForm({super.key, required this.lable, required this.formKey});
  final String lable;
  final GlobalKey<FormState> formKey;

  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  final TextEditingController textEditingcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: TextFormField(
        autofocus: true,
        controller: textEditingcontroller,
        maxLines: 2,
        minLines: 1,
        cursorColor: ColorManager.emerald,
        style: const TextStyle(color: ColorManager.emerald),
        decoration: _inputDecoration(),
        onChanged: (value) => WriteWordsCubit.get(context).updateText(value),
        validator: (value) {
          return _validate(
              isArabic: WriteWordsCubit.get(context).isArabic, value: value);
        },
      ),
    );
  }

  String? _validate({required bool isArabic, String? value}) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter some text';
    }
    for (var i = 0; i < value.length; i++) {
      CharType charType = _getCharType(value.codeUnitAt(i));
      if (charType == CharType.notValid) {
        return 'character nomber ${i + 1} is not valid';
      } else if (charType == CharType.arabic && isArabic == false) {
        return 'character nomber ${i + 1} is not english';
      } else if (charType == CharType.english && isArabic == true) {
        return 'character nomber ${i + 1} is not arabic';
      }
    }
    return null;
  }

  _getCharType(int codeUnit) {
    if (codeUnit >= 65 && codeUnit <= 90 || codeUnit >= 97 && codeUnit <= 122) {
      return CharType.english;
    } else if (codeUnit >= 1569 && codeUnit <= 1610) {
      return CharType.arabic;
    } else if (codeUnit == 32) {
      return CharType.space;
    }
    return CharType.notValid;
  }

  InputDecoration _inputDecoration() {
    return InputDecoration(
        labelStyle: const TextStyle(color: ColorManager.emerald),
        labelText: widget.lable,
        errorStyle: const TextStyle(color: ColorManager.brightPink),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: ColorManager.emerald,
            width: 2.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: ColorManager.emerald,
            width: 2.0,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: ColorManager.brightPink,
            width: 2.0,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: ColorManager.brightPink,
            width: 2.0,
          ),
        ));
  }
}

enum CharType { arabic, english, space, notValid }
