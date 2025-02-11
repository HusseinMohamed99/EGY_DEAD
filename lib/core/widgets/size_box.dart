part of '../helpers/export_manager/export_manager.dart';

class Space extends StatelessWidget {
  const Space({required this.height, required this.width, super.key});
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
      height: height.h,
    );
  }
}
