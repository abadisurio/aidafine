part of 'themes.dart';

final blueTheme = ThemeData.dark().copyWith(
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
  canvasColor: Colors.blue,
  scaffoldBackgroundColor: Colors.blue.shade900,
  textTheme: GoogleFonts.plusJakartaSansTextTheme(TextStyleTheme.darkTextTheme),
  // scaffoldBackgroundColor: Colors.grey.shade900,
);
