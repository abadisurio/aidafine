part of 'themes.dart';

final darkTheme = ThemeData.dark().copyWith(
  splashColor: Colors.transparent,
  highlightColor: Colors.black12,
  primaryColor: Colors.indigo.shade900,
  dividerColor: Colors.indigo.shade100,
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
    ),
  ),
  iconButtonTheme: IconButtonThemeData(
    style: ButtonStyle(
      iconColor: WidgetStateProperty.all<Color>(Colors.white),
    ),
  ),
  canvasColor: Colors.black45,
  textTheme: GoogleFonts.plusJakartaSansTextTheme(
    ThemeData.dark().textTheme.copyWith(
          titleLarge: TextStyle(
            fontWeight: FontWeight.w700,
            color: Colors.grey.shade100,
          ),
          titleMedium: TextStyle(
            fontWeight: FontWeight.w700,
            color: Colors.grey.shade100,
          ),
          titleSmall: TextStyle(
            fontWeight: FontWeight.w700,
            color: Colors.grey.shade100,
          ),
        ),
  ),
  scaffoldBackgroundColor:
      HSLColor.fromColor(Colors.grey).withLightness(0.01).toColor(),
);

final circleButtonStyle = ElevatedButton.styleFrom(
  minimumSize: const Size.square(36),
  maximumSize: const Size.square(36),
  fixedSize: const Size.square(36),
  padding: EdgeInsets.zero,
  foregroundColor: Colors.white,
  shape: const CircleBorder(),
);
