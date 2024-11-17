part of '../helpers/export_manager/export_manager.dart';

class IsListLoading extends StatelessWidget {
  const IsListLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      effect: ShimmerEffect(
        baseColor: ColorManager.charCoolColor, // Adjust colors as needed
        highlightColor: ColorManager.charCoolColor.withOpacity(0.5),
        duration: const Duration(seconds: 1),
      ),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0).r,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppString.popular,
                  style: context.textTheme.titleSmall,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0).r,
                    child: Row(
                      children: [
                        Text(
                          AppString.seeMore,
                          style: context.textTheme.labelSmall,
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 16.sp,
                          color: ColorManager.whiteColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 130.h,
            child: ListView.builder(
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, context) => Container(
                padding: EdgeInsets.only(right: 8.w),
                child: InkWell(
                  onTap: () {},
                  child: ClipRRect(
                    borderRadius:
                        const BorderRadius.all(Radius.circular(8.0)).r,
                    child: CachedImage(
                      boxFit: BoxFit.fitHeight,
                      imageUrl: '',
                      width: 120.w,
                      height: 120.h,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
