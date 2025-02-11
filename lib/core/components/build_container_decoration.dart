part of './../helpers/export_manager/export_manager.dart';

BoxDecoration buildContainerDecoration({Color? color, Color? borderColor}) {
  return BoxDecoration(
    color: color ?? ColorManager.darkPrimary,
    borderRadius: BorderRadius.circular(8).r,
    border: Border.all(
      color: borderColor ?? ColorManager.whiteColor,
    ),
  );
}
