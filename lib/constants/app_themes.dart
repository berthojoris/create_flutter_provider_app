import 'package:flutter/material.dart';
import 'package:noteapp/constants/app_font_family.dart';

class AppThemes {
  AppThemes._();

  // CONSTANTS COLOR RANGE FOR LIGHT THEME
  static const Color _lightPrimaryColor = Colors.black;
  static const Color _lightPrimaryVariantColor = Colors.white;
  static const Color _lightSecondaryColor = Colors.green;
  static const Color _lightOnPrimaryColor = Colors.black; // HEADER PUTIH
  static const Color _lightButtonPrimaryColor = Colors.blue;
  static const Color _lightAppBarColor = Colors.blue;
  static Color _lightIconColor = Colors.blue;
  static Color _lightSnackBarBackgroundErrorColor = Colors.redAccent;

  // TEXT THEME FOR LIGHT THEME
  static final TextStyle _lightScreenHeadingTextStyle = TextStyle(
    fontSize: 20.0,
    color: _lightOnPrimaryColor,
  );
  static final TextStyle _lightScreenTaskNameTextStyle = TextStyle(
    fontSize: 16.0,
    color: _lightOnPrimaryColor,
  );
  static final TextStyle _lightScreenTaskDurationTextStyle = TextStyle(
    fontSize: 14.0,
    color: Colors.grey,
  );
  static final TextStyle _lightScreenButtonTextStyle = TextStyle(
    fontSize: 14.0,
    color: _lightOnPrimaryColor,
    fontWeight: FontWeight.w500,
  );
  static final TextStyle _lightScreenCaptionTextStyle = TextStyle(
    fontSize: 12.0,
    color: _lightAppBarColor,
    fontWeight: FontWeight.w100,
  );

  static final TextTheme _lightTextTheme = TextTheme(
    headline: _lightScreenHeadingTextStyle,
    body1: _lightScreenTaskNameTextStyle,
    body2: _lightScreenTaskDurationTextStyle,
    button: _lightScreenButtonTextStyle,
    title: _lightScreenTaskNameTextStyle,
    subhead: _lightScreenTaskNameTextStyle,
    caption: _lightScreenCaptionTextStyle,
  );

  // CONSTANTS COLOR RANGE FOR DARK THEME
  static const Color _darkPrimaryColor = Colors.white;
  static const Color _darkPrimaryVariantColor = Colors.black;
  static const Color _darkSecondaryColor = Colors.white;
  static const Color _darkOnPrimaryColor = Colors.white;
  static const Color _darkButtonPrimaryColor = Colors.deepPurpleAccent;
  static const Color _darkAppBarColor = Colors.deepPurpleAccent;
  static Color _darkIconColor = Colors.deepPurpleAccent;
  static Color _darkSnackBarBackgroundErrorColor = Colors.redAccent;

  // TEXT THEME FOR DARK THEME
  static final TextStyle _darkScreenHeadingTextStyle =
      _lightScreenHeadingTextStyle.copyWith(color: _darkOnPrimaryColor);
  static final TextStyle _darkScreenTaskNameTextStyle =
      _lightScreenTaskNameTextStyle.copyWith(color: _darkOnPrimaryColor);
  static final TextStyle _darkScreenTaskDurationTextStyle =
      _lightScreenTaskDurationTextStyle;
  static final TextStyle _darkScreenButtonTextStyle = TextStyle(
      fontSize: 14.0, color: _darkOnPrimaryColor, fontWeight: FontWeight.w500);
  static final TextStyle _darkScreenCaptionTextStyle = TextStyle(
      fontSize: 12.0, color: _darkAppBarColor, fontWeight: FontWeight.w100);

  static final TextTheme _darkTextTheme = TextTheme(
    headline: _darkScreenHeadingTextStyle,
    body1: _darkScreenTaskNameTextStyle,
    body2: _darkScreenTaskDurationTextStyle,
    button: _darkScreenButtonTextStyle,
    title: _darkScreenTaskNameTextStyle,
    subhead: _darkScreenTaskNameTextStyle,
    caption: _darkScreenCaptionTextStyle,
  );

  // =========================================== THE LIGHT THEME ===========================================
  static final ThemeData lightTheme = ThemeData(
    fontFamily: AppFontFamily.poppins,
    scaffoldBackgroundColor: _lightPrimaryVariantColor,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: _lightButtonPrimaryColor,
    ),
    appBarTheme: AppBarTheme(
      color: _lightAppBarColor,
      iconTheme: IconThemeData(
        color: _lightOnPrimaryColor,
      ),
      textTheme: _lightTextTheme,
    ),
    colorScheme: ColorScheme.light(
      primary: _lightPrimaryColor,
      primaryVariant: _lightPrimaryVariantColor,
      secondary: _lightSecondaryColor,
      onPrimary: _lightOnPrimaryColor,
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: _lightSnackBarBackgroundErrorColor,
    ),
    iconTheme: IconThemeData(
      color: _lightIconColor,
    ),
    popupMenuTheme: PopupMenuThemeData(
      color: _lightAppBarColor,
    ),
    textTheme: _lightTextTheme,
    buttonTheme: ButtonThemeData(
      buttonColor: _lightButtonPrimaryColor,
      textTheme: ButtonTextTheme.primary,
    ),
    unselectedWidgetColor: _lightPrimaryColor,
    inputDecorationTheme: InputDecorationTheme(
      fillColor: _lightPrimaryColor,
      labelStyle: TextStyle(
        color: _lightPrimaryColor,
      ),
    ),
  );

  // =========================================== THE DARK THEME ===========================================
  static final ThemeData darkTheme = ThemeData(
    fontFamily: AppFontFamily.poppins,
    scaffoldBackgroundColor: _darkPrimaryVariantColor,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: _darkButtonPrimaryColor,
    ),
    appBarTheme: AppBarTheme(
      color: _darkAppBarColor,
      iconTheme: IconThemeData(
        color: _darkOnPrimaryColor,
      ),
      textTheme: _darkTextTheme,
    ),
    colorScheme: ColorScheme.light(
      primary: _darkPrimaryColor,
      primaryVariant: _darkPrimaryVariantColor,
      secondary: _darkSecondaryColor,
      onPrimary: _darkOnPrimaryColor,
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: _darkSnackBarBackgroundErrorColor,
    ),
    iconTheme: IconThemeData(
      color: _darkIconColor,
    ),
    popupMenuTheme: PopupMenuThemeData(
      color: _darkAppBarColor,
    ),
    textTheme: _darkTextTheme,
    buttonTheme: ButtonThemeData(
      buttonColor: _darkButtonPrimaryColor,
      textTheme: ButtonTextTheme.primary,
    ),
    unselectedWidgetColor: _darkPrimaryColor,
    inputDecorationTheme: InputDecorationTheme(
      fillColor: _darkPrimaryColor,
      labelStyle: TextStyle(
        color: _darkPrimaryColor,
      ),
    ),
  );
}
