import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // 1
  static TextTheme lightTextTheme = TextTheme(
    bodyText1: GoogleFonts.openSans(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    headline1: GoogleFonts.openSans(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    headline2: GoogleFonts.openSans(
      fontSize: 21.0,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    headline3: GoogleFonts.openSans(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    headline6: GoogleFonts.openSans(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
  );

// 2
  static TextTheme darkTextTheme = TextTheme(
    bodyText1: GoogleFonts.openSans(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    headline1: GoogleFonts.openSans(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headline2: GoogleFonts.openSans(
      fontSize: 21.0,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    headline3: GoogleFonts.openSans(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    headline6: GoogleFonts.openSans(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  );

// 3
  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateColor.resolveWith(
          (states) {
            return Colors.black;
          },
        ),
      ),
      appBarTheme: const AppBarTheme(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.green,
      ),
      textTheme: lightTextTheme,
    );
  }

// 4
  static ThemeData dark() {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: const Color(0xFF17162E),
      appBarTheme: const AppBarTheme(
        foregroundColor: Colors.white,
        backgroundColor: Color(0xFF17162E),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        backgroundColor: Colors.green,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.green,
      ),
      textTheme: darkTextTheme,
    );
  }

}
//no
final AppBarTheme _appBarTheme = AppBarTheme(
  color: Colors.white,
  elevation: 0.0,
  iconTheme: IconThemeData(color: Colors.black),
  textTheme: TextTheme(
    headline6: _TextStyles.headline6.copyWith(color: Colors.black87),
  ),
);

const PageTransitionsTheme _pageTransitionsTheme = PageTransitionsTheme(
  builders: <TargetPlatform, PageTransitionsBuilder>{
    TargetPlatform.android: ZoomPageTransitionsBuilder(),
  },
);

final TextTheme _textTheme = TextTheme(
  headline4: _TextStyles.headline4,
  headline5: _TextStyles.headline5,
  headline6: _TextStyles.headline6,
  subtitle1: _TextStyles.subtitle1,
  subtitle2: _TextStyles.subtitle2,
  bodyText1: _TextStyles.bodyText1,
  bodyText2: _TextStyles.bodyText2,
);

class _TextStyles {
  static final TextStyle headline4 = TextStyle(
    fontFamily: 'RobotoMedium',
    fontSize: 34.0,
    color: Colors.black.withOpacity(0.75),
  );
  static final TextStyle headline5 = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 24.0,
    color: Colors.black.withOpacity(0.65),
  );
  static final TextStyle headline6 = TextStyle(
    fontFamily: 'RobotoMedium',
    fontSize: 20.0,
    color: Colors.black.withOpacity(0.65),
  );
  static final TextStyle subtitle1 = TextStyle(
    fontFamily: 'RobotoMedium',
    fontSize: 16.0,
    color: Colors.black.withOpacity(0.65),
  );
  static final TextStyle subtitle2 = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 16.0,
    color: Colors.black.withOpacity(0.65),
  );
  static final TextStyle bodyText1 = TextStyle(
    fontFamily: 'RobotoMedium',
    fontSize: 14.0,
    color: Colors.black.withOpacity(0.65),
  );
  static final TextStyle bodyText2 = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 14.0,
    color: Colors.black.withOpacity(0.65),
  );
}
