import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/global/theme/style/color_manger.dart';
import 'package:movies_app/core/utils/enum.dart';

final getThemeData = {
  AppTheme.darkTheme: ThemeData(
    scaffoldBackgroundColor: ColorManager.darkPrimary,
    primaryColor: ColorManager.darkPrimary,
    appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: ColorManager.greyDarkColor,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(18),
          topRight: Radius.circular(18),
        ).r,
      ),
    ),
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.roboto(
        color: ColorManager.whiteColor,
      ),
      bodyMedium: GoogleFonts.roboto(
        color: ColorManager.whiteColor,
      ),
      bodySmall: GoogleFonts.roboto(
        color: ColorManager.whiteColor,
      ),
      titleLarge: GoogleFonts.roboto(
        color: ColorManager.whiteColor,
        fontSize: 24,
        fontWeight: FontWeight.w700,
      ),
      titleMedium: GoogleFonts.roboto(
        color: ColorManager.whiteColor,
        fontSize: 14,
      ),
      titleSmall: GoogleFonts.roboto(
        color: ColorManager.whiteColor,
      ),
      labelLarge: GoogleFonts.roboto(
        color: ColorManager.whiteColor,
        fontSize: 18,
      ),
      labelMedium: GoogleFonts.roboto(
        color: ColorManager.whiteColor,
        fontSize: 16,
      ),
      labelSmall: GoogleFonts.roboto(
        color: ColorManager.whiteColor,
        fontSize: 12,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.black,
      showSelectedLabels: true,
      showUnselectedLabels: false,
      selectedIconTheme: const IconThemeData(
        size: 30,
        color: ColorManager.primaryGreenColor,
      ),
      unselectedIconTheme: const IconThemeData(
        size: 24,
        color: ColorManager.whiteColor,
      ),
      selectedLabelStyle: GoogleFonts.roboto(
        color: ColorManager.primaryGreenColor,
      ),
      selectedItemColor: ColorManager.primaryGreenColor,
    ),
  ),
};
