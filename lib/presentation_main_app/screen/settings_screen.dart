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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 60, bottom: 20),
            child: Align(
              alignment: Alignment.topCenter,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(70),
                child: CachedNetworkImage(
                  height: MediaQuery.of(context).size.height / 7,
                  width: MediaQuery.of(context).size.width / 3,
                  imageUrl:
                      'https://scontent.fcai20-2.fna.fbcdn.net/v/t39.30808-6/354262316_597026632519901_4053590601695216731_n.jpg?_nc_cat=104&cb=99be929b-3346023f&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=zb4V0JHJUJ4AX-NupXx&_nc_ht=scontent.fcai20-2.fna&oh=00_AfBchD6Sx5-flYL67ROqJF-0OMnYkL5EtmaOqOEdjGKJxw&oe=649B8DA5',
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Text(
            'Hussein Mohamed'.toUpperCase(),
            style: const TextStyle(fontSize: 16.0, color: Colors.white),
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
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Space(
            width: 0.w,
            height: 20.h,
          ),
        ],
      ),
    );
  }
}
