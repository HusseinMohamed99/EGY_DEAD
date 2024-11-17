part of './../helpers/export_manager/export_manager.dart';

class CachedImage extends StatelessWidget {
  const CachedImage({
    super.key,
    this.imageUrl,
    required this.width,
    required this.height,
    this.boxFit,
  });

  final String? imageUrl;
  final double height;
  final double width;
  final BoxFit? boxFit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl ?? '',
      height: height.h,
      width: width.w,
      fit: boxFit ?? BoxFit.cover,
      errorWidget: (_, __, ___) => Container(
        width: width.w,
        height: height.h,
        decoration: BoxDecoration(
          color: ColorManager.charCoolColor,
          borderRadius: BorderRadius.circular(10).r,
        ),
        child: Image.asset(
          Assets.imagesOopsError,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
