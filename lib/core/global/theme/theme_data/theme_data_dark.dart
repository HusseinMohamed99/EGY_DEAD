import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/global/theme/app_color/app_color_dark.dart';

ThemeData getThemeDataDark() => ThemeData(
      scaffoldBackgroundColor: AppColorsDark.darkPrimary,
      primaryColor: AppColorsDark.darkPrimary,
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
        bodyLarge: TextStyle(
          color: AppColorsDark.textColor,
        ),
        bodyMedium: TextStyle(
          color: AppColorsDark.textColor,
        ),
        bodySmall: TextStyle(
          color: AppColorsDark.textColor,
        ),
        titleLarge: TextStyle(color: AppColorsDark.textColor, fontSize: 24.sp),
        titleMedium: TextStyle(
          color: AppColorsDark.textColor,
        ),
        titleSmall: TextStyle(
          color: AppColorsDark.textColor,
        ),
        labelLarge: TextStyle(color: AppColorsDark.textColor, fontSize: 18.sp),
        labelSmall: TextStyle(color: AppColorsDark.textColor, fontSize: 12.sp),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.black,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        selectedIconTheme: IconThemeData(
          size: 30.sp,
          color: Colors.green,
        ),
        unselectedIconTheme: IconThemeData(
          size: 24.sp,
          color: Colors.white,
        ),
        selectedLabelStyle: const TextStyle(
          color: Colors.green,
        ),
        selectedItemColor: Colors.green,
      ),
    );
