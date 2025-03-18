part of './../helpers/export_manager/export_manager.dart';

class CarouselItem extends StatelessWidget {
  const CarouselItem(
      {super.key,
      required this.navigateToDetailsSection,
      required this.imageUrl,
      required this.title,
      required this.sectionName});
  final VoidCallback navigateToDetailsSection;
  final String imageUrl, title, sectionName;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: const Key('openMinimalDetail'),
      onTap: navigateToDetailsSection,
      child: Stack(
        children: [
          CachedImage(
            boxFit: BoxFit.fill,
            imageUrl: imageUrl,
            width: double.infinity,
            height: context.height * 0.3,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 16.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.circle,
                        color: ColorManager.primaryRedColor,
                        size: 16.sp,
                      ),
                      const Space(height: 0, width: 4),
                      Text(
                        sectionName.toUpperCase(),
                        style: TextStyleManager.bodySmall(context: context),
                      ),
                    ],
                  ),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyleManager.titleMedium(context: context),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
