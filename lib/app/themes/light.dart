part of 'themes.dart';

final lightTheme = ThemeData.light().copyWith(
  splashColor: Colors.transparent,
  highlightColor: Colors.black12,
  primaryColor: Colors.indigo.shade50,
  dividerColor: Colors.indigo.shade100,
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
    ),
  ),
  textTheme: GoogleFonts.plusJakartaSansTextTheme(ThemeData.light().textTheme),
  canvasColor: const Color.fromARGB(255, 129, 139, 195),
);
