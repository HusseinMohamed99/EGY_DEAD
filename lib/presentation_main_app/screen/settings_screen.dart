import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/components/image_shimmer.dart';
import 'package:movies_app/core/components/size_box.dart';
import 'package:movies_app/core/global/theme/app_color/app_color_dark.dart';
import 'package:movies_app/core/global/theme/theme_data/theme_data_dark.dart';
import 'package:movies_app/presentation_main_app/screen/about_us_screen.dart';
import 'package:movies_app/presentation_main_app/screen/help_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = getThemeDataDark().textTheme;

    return Scaffold(
      body: SingleChildScrollView(
        key: const Key('settingsScrollView'),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 60, bottom: 20).r,
              child: CircleAvatar(
                maxRadius: 93.r,
                minRadius: 93.r,
                backgroundColor: Colors.yellow,
                child: CircleAvatar(
                  maxRadius: 90.r,
                  minRadius: 90.r,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(95).r,
                    child: ImageWithShimmer(
                        imageUrl:
                            'https://scontent.fcai20-2.fna.fbcdn.net/v/t39.30808-1/334981904_1091437138478765_5655346587829136132_n.jpg?stp=dst-jpg_p240x240&_nc_cat=109&cb=99be929b-3346023f&ccb=1-7&_nc_sid=7206a8&_nc_ohc=lFXApVUoF74AX-PPxQV&_nc_ht=scontent.fcai20-2.fna&oh=00_AfBN3gIGqefTIvVc0KwDmb5jlqeJt5cR5BlZMY8P5UQkCg&oe=64A4F175',
                        width: double.infinity,
                        height: 200.h),
                  ),
                ),
              ),
            ),
            Text(
              'Hussein Mohamed'.toUpperCase(),
              style: textTheme.bodyLarge,
            ),
            Space(
              width: 0.w,
              height: 30.h,
            ),
            Card(
              color: AppColorsDark.greyDarkColor,
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15).r),
              elevation: 10,
              child: InkWell(
                onTap: () {},
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
                          Icons.dark_mode_outlined,
                          size: 26.sp,
                          color: const Color(0xff699BF7),
                        ),
                      ),
                      Space(
                        width: 35.w,
                        height: 0.h,
                      ),
                      Text(
                        'Change Theme',
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
              color: AppColorsDark.greyDarkColor,
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15).r),
              elevation: 10,
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return const AboutUsScreen();
                  }));
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
                          color: const Color(0xff699BF7),
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
              color: AppColorsDark.greyDarkColor,
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15).r),
              elevation: 10,
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return const HelpScreen();
                  }));
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
                          color: const Color(0xff699BF7),
                        ),
                      ),
                      Space(
                        width: 35.w,
                        height: 0.h,
                      ),
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
      ),
    );
  }
}
