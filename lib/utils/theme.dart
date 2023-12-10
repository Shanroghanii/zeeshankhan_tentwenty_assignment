import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      appBarTheme: const AppBarTheme(
        color: Colors.white,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: TextStyle(color: Colors.black87, fontSize: 24),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      // drawerTheme: DrawerThemeData(elevation: 100, width: Get.width * 0.8),

      primaryColor: primaryColor,
      hintColor: Colors.grey,
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: primaryColor,
        selectionHandleColor: primaryColor,
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        filled: true,
        fillColor: Colors.white,
        iconColor: primaryColor,
        prefixIconColor: primaryColor,
        suffixIconColor: primaryColor,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: primaryColorLight)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: primaryColor)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: errorColor)),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: primaryColorLight)),
      ),

      // floatingActionButtonTheme: const FloatingActionButtonThemeData(
      //   backgroundColor: primaryColor,
      // ),

      iconTheme: const IconThemeData(color: primaryColor),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: TextStyle(color: backgroundColor),
          padding: const EdgeInsets.all(0),
          backgroundColor: blueColor,
          // shadowColor: blueColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        ),
      ),
      // textButtonTheme: TextButtonThemeData(
      //
      // ),
      textTheme: TextTheme(
        bodyLarge: GoogleFonts.poppins(),
        displayLarge: GoogleFonts.poppins(),
        displayMedium: GoogleFonts.poppins(),
        bodyMedium: GoogleFonts.poppins(),
        labelLarge: GoogleFonts.poppins(),
      ),
      colorScheme: ColorScheme.fromSeed(seedColor: primaryColor)
          .copyWith(background: backgroundColor),
      listTileTheme: ListTileThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: primaryColorLight),
        ),
        iconColor: primaryColor,
        selectedTileColor: primaryColor,
      ));
}
