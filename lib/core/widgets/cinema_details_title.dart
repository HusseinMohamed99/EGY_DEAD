part of '../helpers/export_manager/export_manager.dart';

class CinemaTitle extends StatelessWidget {
  const CinemaTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyleManager.titleMedium(context: context),
    );
  }
}
