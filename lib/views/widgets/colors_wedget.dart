import 'package:flutter/material.dart';
import 'package:words_note/controller/write_words_cubit/write_words_cubit.dart';
import 'package:words_note/views/styles/color_manager.dart';

class ColorsWedget extends StatelessWidget {
  const ColorsWedget({super.key, required this.colorActiveIndex});
  final int colorActiveIndex;

  final List<int> _colorsCode = const [
    0xff9E9E9E,
    0xff000000,
    0xffFFFFFF,
    0xffFFC107,
    0xffE91E63,
    0xff9C27B0,
    0xff673AB7,
    0xff3F51B5,
    0xff03A9F4,
    0xff00BCD4,
    0xff009688,
    0xff4CAF50,
    0xffCDDC39,
    0xffFFEB3B,
    0xffFF5722,
    0xff795548,
    0xff607D8B,
    
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: _colorsCode.length,
        itemBuilder: (context, index) => _itemDesign(index, context),
        separatorBuilder: (context, index) => const SizedBox(
          width: 8,
        ),
      ),
    );
  }

  Widget? _itemDesign(int index, BuildContext context) {
    bool isTheSameColor = colorActiveIndex == _colorsCode[index];
    bool isColorWhite = colorActiveIndex == 0xffFFFFFF;
    return InkWell(
      splashColor: ColorManager.transparent,
      onTap: () =>
          WriteWordsCubit.get(context).updateColorCode(_colorsCode[index]),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        height: isTheSameColor ? 50 : 40,
        width: isTheSameColor ? 50 : 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: isTheSameColor
              ? Border.all(
                  width: 2,
                  color:
                      isColorWhite ? ColorManager.sunglow : ColorManager.white)
              : null,
          color: Color(_colorsCode[index]),
        ),
        child: isTheSameColor
            ? Icon(
                Icons.check,
                color: isColorWhite ? ColorManager.sunglow : ColorManager.white,
              )
            : null,
      ),
    );
  }

}
