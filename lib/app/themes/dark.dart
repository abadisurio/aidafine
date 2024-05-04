part of 'themes.dart';

final darkTheme = ThemeData.dark().copyWith(
  splashColor: Colors.transparent,
  highlightColor: Colors.black12,
  primaryColor: Colors.indigo.shade900,
  dividerColor: Colors.indigo.shade100,
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
    ),
  ),
  iconButtonTheme: IconButtonThemeData(
    style: ButtonStyle(
      iconColor: MaterialStateProperty.all<Color>(Colors.white),
    ),
  ),
  canvasColor: Colors.black45,
  textTheme: GoogleFonts.plusJakartaSansTextTheme(
    ThemeData.dark().textTheme.copyWith(
          titleLarge: const TextStyle(
            fontWeight: FontWeight.w700,
          ),
          titleMedium: const TextStyle(
            fontWeight: FontWeight.w700,
          ),
          titleSmall: const TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
  ),
  // scaffoldBackgroundColor: Colors.grey.shade900,
);

final circleButtonStyle = ElevatedButton.styleFrom(
  minimumSize: const Size.square(36),
  maximumSize: const Size.square(36),
  fixedSize: const Size.square(36),
  padding: EdgeInsets.zero,
  foregroundColor: Colors.white,
  shape: const CircleBorder(),
);
