part of '../helpers/export_manager/export_manager.dart';

class CinemaDuration extends StatelessWidget {
  const CinemaDuration({super.key, required this.duration});

  final int? duration;

  @override
  Widget build(BuildContext context) {
    return Text(
      _showDuration(duration ?? 0),
      style: context.textTheme.labelSmall!.copyWith(
        color: ColorManager.greyColor,
      ),
    );
  }
}
