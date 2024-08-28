import 'package:flutter/material.dart';
import 'package:words_note/views/styles/color_manager.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(child: CircularProgressIndicator(
      color: ColorManager.sunglow.withOpacity(.3),
     
      
    ));
  }
}