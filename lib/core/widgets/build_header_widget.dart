part of '../helpers/export_manager/export_manager.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key, required this.title, required this.onTap});
  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyleManager.titleSmall(context: context),
          ),
          GestureDetector(
            onTap: onTap,
            child: Row(
              children: [
                Text(
                  AppString.seeMore,
                  style: TextStyleManager.labelSmall(context: context),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 16.sp,
                  color: ColorManager.whiteColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
