import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/components/size_box.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        key: const Key('settingsScrollView'),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 60, bottom: 20),
              child: CircleAvatar(
                maxRadius: 93.r,
                minRadius: 93.r,
                backgroundColor: Colors.yellow,
                child: CircleAvatar(
                  maxRadius: 90.r,
                  minRadius: 90.r,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(95).r,
                    child: CachedNetworkImage(
                      imageUrl:
                          'https://scontent.fcai20-2.fna.fbcdn.net/v/t39.30808-6/354262316_597026632519901_4053590601695216731_n.jpg?_nc_cat=104&cb=99be929b-3346023f&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=zb4V0JHJUJ4AX-NupXx&_nc_ht=scontent.fcai20-2.fna&oh=00_AfBchD6Sx5-flYL67ROqJF-0OMnYkL5EtmaOqOEdjGKJxw&oe=649B8DA5',
                      fit: BoxFit.fill,
                      height: 200.h,
                      width: double.infinity,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      errorWidget: (context, url, error) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Text(
              'Hussein Mohamed'.toUpperCase(),
              style: GoogleFonts.roboto(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            Space(
              width: 0.w,
              height: 30.h,
            ),
            Card(
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
                          Icons.edit_outlined,
                          size: 26.sp,
                          color: const Color(0xff699BF7),
                        ),
                      ),
                      Space(
                        width: 35.w,
                        height: 0.h,
                      ),
                      Text(
                        'Custom Profile',
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w400,
                          fontSize: 18.sp,
                          color: Colors.white,
                        ),
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
                          Icons.password,
                          size: 26.sp,
                          color: const Color(0xff699BF7),
                        ),
                      ),
                      Space(
                        width: 35.w,
                        height: 0.h,
                      ),
                      Text(
                        'Change Password',
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w400,
                          fontSize: 18.sp,
                          color: Colors.white,
                        ),
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
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w400,
                          fontSize: 18.sp,
                          color: Colors.white,
                        ),
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
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w400,
                          fontSize: 18.sp,
                          color: Colors.white,
                        ),
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
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w400,
                          fontSize: 18.sp,
                          color: Colors.white,
                        ),
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
                          Icons.delete_forever,
                          size: 26.sp,
                          color: const Color(0xff699BF7),
                        ),
                      ),
                      Space(
                        width: 35.w,
                        height: 0.h,
                      ),
                      Text(
                        'Delete Account',
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w400,
                          fontSize: 18.sp,
                          color: Colors.white,
                        ),
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
                          Icons.logout,
                          size: 26.sp,
                          color: const Color(0xff699BF7),
                        ),
                      ),
                      Space(
                        width: 35.w,
                        height: 0.h,
                      ),
                      Text(
                        'Log Out',
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w400,
                          fontSize: 18.sp,
                          color: Colors.white,
                        ),
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
          ],
        ),
      ),
    );
  }
}
