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
        controller: textEditingcontroller,
        maxLines: 2,
        minLines: 1,
        cursorColor: ColorManager.emerald,
        style: const TextStyle(color: ColorManager.emerald),
        decoration: _inputDecoration(),
        onChanged: (value) => WriteWordsCubit.get(context).updateText(value),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }

          _validate(
              isArabic: WriteWordsCubit.get(context).isArabic, value: value);
          return null;
        },
      ),
    );
  }

  String? _validate({required bool isArabic, String? value}) {
    
    return null;
  }
  InputDecoration _inputDecoration() {
    return InputDecoration(
        labelStyle: const TextStyle(color: ColorManager.emerald),
        labelText: widget.lable,
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
