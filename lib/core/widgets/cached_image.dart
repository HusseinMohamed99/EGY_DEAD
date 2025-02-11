part of '../helpers/export_manager/export_manager.dart';

class CachedImage extends StatelessWidget {
  const CachedImage({
    super.key,
    this.imageUrl,
    this.width,
    this.height,
    this.boxFit,
  });

  final String? imageUrl;
  final double? height;
  final double? width;
  final BoxFit? boxFit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl?.isNotEmpty == true
          ? imageUrl!
          : 'https://firebasestorage.googleapis.com/v0/b/egydead-df0d2.firebasestorage.app/o/no-data.png?alt=media&token=0eb352ef-76ec-4d9e-afce-80c58757b697',
      height: height?.h,
      width: width?.w,
      fit: boxFit ?? BoxFit.fitWidth,
      placeholder: (_, __) => const Center(
        child: SpinKitDoubleBounce(
          color: ColorManager.primaryGreenColor,
          duration: Duration(milliseconds: 3000),
          size: 50.0,
        ),
      ),
      errorWidget: (_, __, ___) => Center(
        child: SvgPicture.asset(
          Assets.imagesError,
          fit: BoxFit.fitWidth,
          width: width,
          height: 60.h,
        ),
      ),
    );
  }
}
