part of './../../../core/helpers/export_manager/export_manager.dart';

class BuildSkeletonCarousel extends StatelessWidget {
  const BuildSkeletonCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      effect: ShimmerEffect(
        baseColor: ColorManager.charCoolColor, // Custom base color
        highlightColor: ColorManager.charCoolColor
            .withOpacity(0.5), // Custom highlight color
        duration: const Duration(seconds: 1),
      ),
      child: CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
          height: 300.h,
          viewportFraction: 1.0,
          onPageChanged: (index, reason) {},
        ),
        items: [
          Stack(
            children: [
              CachedImage(
                boxFit: BoxFit.fill,
                imageUrl: '',
                width: double.infinity,
                height: 560.h,
              ),
              Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin: EdgeInsets.only(left: 8.w, top: 40.h),
                      padding:
                          EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
                      width: 70.w,
                      height: 60.h,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            ColorManager.whiteColor,
                            ColorManager.primaryGreenColor
                          ],
                        ),
                        borderRadius: BorderRadius.circular(50).r,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50).r,
                        child: CachedImage(
                          boxFit: BoxFit.fill,
                          imageUrl: '',
                          width: 60.w,
                          height: 50.h,
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.only(bottom: 16.0.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.circle,
                          color: ColorManager.primaryRedColor,
                          size: 16.sp,
                        ),
                        Space(height: 0, width: 4),
                        Text(
                          AppString.nowPlaying.toUpperCase(),
                          style: context.textTheme.bodySmall!.copyWith(
                            color: ColorManager.whiteColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16).r,
                    child: Text(
                      'Transformers',
                      textAlign: TextAlign.center,
                      style: context.textTheme.titleLarge,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
