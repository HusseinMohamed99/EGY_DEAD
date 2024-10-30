part of './../../export_manager/export_manager.dart';

Map<AppTheme, ThemeData> getThemeData(BuildContext context) => {
      AppTheme.darkTheme: ThemeData(
        scaffoldBackgroundColor: ColorManager.darkPrimary,
        primaryColor: ColorManager.darkPrimary,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
        ),
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: ColorManager.greyDarkColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18),
              topRight: Radius.circular(18),
            ).r,
          ),
        ),
        textTheme: GoogleFonts.robotoTextTheme().copyWith(
          headlineSmall: buildTextStyle(
            context: context,
            fontSize: 24,
            color: ColorManager.whiteColor,
          ),
          titleLarge: buildTextStyle(
            context: context,
            fontSize: 22,
            color: ColorManager.whiteColor,
          ),
          titleMedium: buildTextStyle(
            context: context,
            fontSize: 16,
            color: ColorManager.whiteColor,
          ),
          titleSmall: buildTextStyle(
            context: context,
            color: ColorManager.whiteColor,
            fontSize: 14,
          ),
          labelMedium: buildTextStyle(
            context: context,
            fontSize: 12.sp,
            color: ColorManager.whiteColor,
          ),
          labelSmall: buildTextStyle(
            context: context,
            fontSize: 11.sp,
            color: ColorManager.whiteColor,
          ),
          bodySmall: buildTextStyle(
            context: context,
            fontSize: 8.sp,
            color: ColorManager.greyColor,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.black,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          selectedIconTheme: IconThemeData(
            size: 30.sp,
            color: ColorManager.primaryGreenColor,
          ),
          unselectedIconTheme: IconThemeData(
            size: 24.sp,
            color: ColorManager.whiteColor,
          ),
          selectedLabelStyle: GoogleFonts.roboto(
            color: ColorManager.primaryGreenColor,
          ),
          selectedItemColor: ColorManager.primaryGreenColor,
        ),
      ),
    };
