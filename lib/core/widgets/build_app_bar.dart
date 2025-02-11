part of '../helpers/export_manager/export_manager.dart';

AppBar _buildAppBar(BuildContext context, {required String title}) {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: ColorManager.charCoolColor,
    elevation: 0,
    title: Text(
      title,
      style: TextStyleManager.labelMedium(context: context),
    ),
    centerTitle: true,
  );
}
