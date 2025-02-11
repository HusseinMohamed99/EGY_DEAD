part of '../helpers/export_manager/export_manager.dart';

class BuildErrorMessage extends StatelessWidget {
  const BuildErrorMessage({super.key, required this.errorMessage});
  final String errorMessage;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.h,
      child: Center(
        child: Text(
          errorMessage,
          style: TextStyleManager.labelMedium(context: context),
        ),
      ),
    );
  }
}
