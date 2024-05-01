import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyleTheme {
  TextStyleTheme(this.context) {
    _textTheme = Theme.of(context).textTheme;
  }

  late TextTheme _textTheme;

  final BuildContext context;
  Brightness get brightness => Theme.of(context).brightness;

  TextStyle? get titleLarge => _textTheme.titleLarge;
  TextStyle? get titleMedium => _textTheme.titleMedium;
  TextStyle? get titleSmall => _textTheme.titleSmall;
  TextStyle? get bodyLarge => _textTheme.bodyLarge;
  TextStyle? get bodyMedium => _textTheme.bodyMedium;
  TextStyle? get bodySmall => _textTheme.bodySmall;
  TextStyle? get labelLarge => _textTheme.labelLarge;
  TextStyle? get labelMedium => _textTheme.labelMedium;
  TextStyle? get labelSmall => _textTheme.labelSmall;

  static TextStyle get baseTitleStyle => GoogleFonts.plusJakartaSans(
        textStyle: const TextStyle(
          height: 1.2,
          letterSpacing: 0,
          fontWeight: FontWeight.w700,
        ),
      );
  static TextStyle get baseBodyStyle => GoogleFonts.plusJakartaSans(
        textStyle: const TextStyle(
          height: 1.2,
          letterSpacing: 0,
          fontWeight: FontWeight.w500,
        ),
      );
  static TextStyle get baseLabelStyle => GoogleFonts.plusJakartaSans(
        textStyle: const TextStyle(
          height: 1.2,
          letterSpacing: 0,
          fontWeight: FontWeight.w400,
        ),
      );
}
