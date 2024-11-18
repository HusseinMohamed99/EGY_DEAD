part of './../helpers/export_manager/export_manager.dart';

extension SkeletonizerExtension on Widget {
  Widget skeletonize({bool enabled = true}) {
    return Skeletonizer(
      effect: ShimmerEffect(
        baseColor: ColorManager.charCoolColor, // Adjust colors as needed
        highlightColor: ColorManager.charCoolColor.withOpacity(0.5),
        duration: const Duration(seconds: 1),
      ),
      switchAnimationConfig: SwitchAnimationConfig(
        duration: Duration(milliseconds: 800),
        reverseDuration: Duration(milliseconds: 800),
      ),
      enabled: enabled,
      enableSwitchAnimation: true,
      child: this,
    );
  }
}
