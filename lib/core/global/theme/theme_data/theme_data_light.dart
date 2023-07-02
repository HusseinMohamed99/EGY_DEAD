import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/global/theme/app_color/app_color_light.dart';

ThemeData getThemeDataLight() => ThemeData(
      scaffoldBackgroundColor: AppColors.lightPrimary,
      primaryColor: AppColors.lightPrimary,
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: AppColors.bottomSheetColor,
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(18),
            topRight: Radius.circular(18),
          ).r,
        ),
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(
          color: AppColors.textColor,
        ),
        bodyMedium: TextStyle(
          color: AppColors.textColor,
        ),
        bodySmall: TextStyle(
          color: AppColors.textColor,
        ),
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
