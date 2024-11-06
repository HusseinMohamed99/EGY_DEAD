part of './../helpers/export_manager/export_manager.dart';

extension SkeletonizerExtension on Widget {
  Widget skeletonize({bool enabled = true}) {
    return Skeletonizer(
      effect: ShimmerEffect(
        baseColor: ColorManager.charCoolColor,
        highlightColor: ColorManager.charCoolColor,
        duration: const Duration(seconds: 200),
      ),
      enabled: enabled,
      enableSwitchAnimation: true,
      child: this,
    );
  }
}
