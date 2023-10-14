import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/global/theme/app_color/app_color_dark.dart';
import 'package:movies_app/core/utils/enum.dart';

final getThemeData = {
  AppTheme.darkTheme: ThemeData(
    scaffoldBackgroundColor: AppColorsDark.darkPrimary,
    primaryColor: AppColorsDark.darkPrimary,
    appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: AppColorsDark.greyDarkColor,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(18),
          topRight: Radius.circular(18),
        ).r,
      ),
    ),
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.roboto(
        color: AppColorsDark.textColor,
      ),
      bodyMedium: GoogleFonts.roboto(
        color: AppColorsDark.textColor,
      ),
      bodySmall: GoogleFonts.roboto(
        color: AppColorsDark.textColor,
      ),
      titleLarge: GoogleFonts.roboto(
        color: AppColorsDark.textColor,
        fontSize: 24,
        fontWeight: FontWeight.w700,
      ),
      titleMedium: GoogleFonts.roboto(
        color: AppColorsDark.textColor,
        fontSize: 14,
      ),
      titleSmall: GoogleFonts.roboto(
        color: AppColorsDark.textColor,
      ),
      labelLarge: GoogleFonts.roboto(
        color: AppColorsDark.textColor,
        fontSize: 18,
      ),
      labelMedium: GoogleFonts.roboto(
        color: AppColorsDark.textColor,
        fontSize: 16,
      ),
      labelSmall: GoogleFonts.roboto(
        color: AppColorsDark.textColor,
        fontSize: 12,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.black,
      showSelectedLabels: true,
      showUnselectedLabels: false,
      selectedIconTheme: const IconThemeData(
        size: 30,
        color: AppColorsDark.primaryGreenColor,
      ),
      unselectedIconTheme: const IconThemeData(
        size: 24,
        color: AppColorsDark.textColor,
      ),
      selectedLabelStyle: GoogleFonts.roboto(
        color: AppColorsDark.primaryGreenColor,
      ),
      selectedItemColor: AppColorsDark.primaryGreenColor,
    ),
  ),
};
