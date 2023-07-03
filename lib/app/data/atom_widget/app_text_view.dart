import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class AppTextView extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final double minFontSize;
  final double maxFontSize;
  final double stepGranularity;
  final List<double>? presetFontSizes;
  final TextDirection? textDirection;
  final Locale? locale;
  final StrutStyle? strutStyle;
  final bool wrapWords;
  final TextWidthBasis? textWidthBasis;

  const AppTextView({
    Key? key,
    required this.text,
    this.style,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.minFontSize = 12,
    this.maxFontSize = double.infinity,
    this.stepGranularity = 1,
    this.presetFontSizes,
    this.textDirection,
    this.locale,
    this.strutStyle,
    this.wrapWords = true,
    this.textWidthBasis,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      style: TextStyle(fontSize: 30),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      minFontSize: minFontSize,
      maxFontSize: maxFontSize,
      stepGranularity: stepGranularity,
      presetFontSizes: presetFontSizes,
      textDirection: textDirection,
      locale: locale,
      strutStyle: strutStyle,
      wrapWords: wrapWords,
    );
  }
}
