part of './../../../core/helpers/export_manager/export_manager.dart';

class BuildHeaderWidget extends StatelessWidget {
  const BuildHeaderWidget({
    super.key,
    required this.movieItems,
  });
  final MovieSeeMoreModel movieItems;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            movieItems.title,
            style: TextStyleManager.titleSmall(context: context),
          ),
          GestureDetector(
            onTap: () {
              navigateToSeeMore(
                context: context,
                model: movieItems,
              );
            },
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
