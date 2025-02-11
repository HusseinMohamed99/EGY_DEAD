part of '../helpers/export_manager/export_manager.dart';

class CinemaDuration extends StatelessWidget {
  const CinemaDuration({super.key, required this.duration});

  final int? duration;

  @override
  Widget build(BuildContext context) {
    return Text(
      showDuration(duration ?? 0),
      style: TextStyleManager.labelSmall(
        context: context,
        color: ColorManager.greyColor,
      ),
    );
  }
}
