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
          height: 300,
          viewportFraction: 1.0,
          onPageChanged: (index, reason) {},
        ),
        items: [
          CachedImage(
            boxFit: BoxFit.fill,
            imageUrl: '',
            width: double.infinity,
            height: 560,
          ),
        ],
      ),
    );
  }
}
