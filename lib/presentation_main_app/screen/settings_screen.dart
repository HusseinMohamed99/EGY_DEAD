import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/components/size_box.dart';
import 'package:movies_app/core/global/theme/style/color_manger.dart';
import 'package:movies_app/core/global/theme/theme_data/theme_data.dart';
import 'package:movies_app/core/utils/enum.dart';
import 'package:movies_app/image_assets.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = getThemeData[AppTheme.darkTheme]!.textTheme;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 60, bottom: 20).r,
            child: CircleAvatar(
              maxRadius: 93.r,
              minRadius: 93.r,
              backgroundColor: ColorManager.primaryGreenColor,
              child: CircleAvatar(
                maxRadius: 90.r,
                minRadius: 90.r,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(95).r,
                  child: Image.asset(
                    Assets.imagesLogo,
                    fit: BoxFit.fill,
                    width: double.infinity,
                    height: 200.h,
                  ),
                ),
              ),
            ),
          ),
          Text(
            'Hussein Mohamed',
            style: GoogleFonts.pacifico(
              textStyle: TextStyle(
                color: ColorManager.whiteColor,
                fontSize: 20.sp,
              ),
            ),
          ),
          Space(width: 0.w, height: 30.h),
          Card(
            color: ColorManager.greyDarkColor,
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15).r,
            ),
            elevation: 10,
            child: InkWell(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (BuildContext context) {
                //       return const AboutUsScreen();
                //     },
                //   ),
                // );
              },
              child: Container(
                padding: const EdgeInsets.all(10).r,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 22.r,
                      backgroundColor:
                          const Color.fromRGBO(105, 155, 247, 0.15),
                      child: Icon(
                        Icons.info_outline,
                        size: 26.sp,
                        color: ColorManager.primaryGreenColor,
                      ),
                    ),
                    Space(
                      width: 35.w,
                      height: 0.h,
                    ),
                    Text(
                      'About us',
                      style: textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Space(
            width: 0.w,
            height: 8.h,
          ),
          Card(
            color: ColorManager.greyDarkColor,
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15).r),
            elevation: 10,
            child: InkWell(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (BuildContext context) {
                //       return const HelpScreen();
                //     },
                //   ),
                // );
              },
              child: Container(
                padding: const EdgeInsets.all(10).r,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 22.r,
                      backgroundColor:
                          const Color.fromRGBO(105, 155, 247, 0.15),
                      child: Icon(
                        Icons.help_outline,
                        size: 26.sp,
                        color: ColorManager.primaryGreenColor,
                      ),
                    ),
                    Space(width: 35.w, height: 0.h),
                    Text(
                      'Help',
                      style: textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
