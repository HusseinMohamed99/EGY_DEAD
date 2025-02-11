part of '../helpers/export_manager/export_manager.dart';

BoxDecoration buildContainerDecoration(
    {Color? color, Color? borderColor, double? radius}) {
  return BoxDecoration(
    color: color ?? ColorManager.darkPrimary,
    borderRadius: BorderRadius.circular(radius ?? 8).r,
    border: Border.all(
      color: borderColor ?? ColorManager.whiteColor,
    ),
  );
}
