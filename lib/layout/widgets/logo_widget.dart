part of '../../core/helpers/export_manager/export_manager.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    super.key,
    this.topPadding,
  });
  final double? topPadding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16.w,
        right: 16.w,
        top: topPadding ?? 60.h,
        bottom: 20.h,
      ),
      child: CircleAvatar(
        maxRadius: 52.r,
        minRadius: 52.r,
        backgroundColor: ColorManager.primaryGreenColor,
        child: CircleAvatar(
          maxRadius: 50.r,
          minRadius: 50.r,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50).r,
            child: Image.asset(
              Assets.imagesLogo,
            ),
          ),
        ),
      ),
    );
  }
}
