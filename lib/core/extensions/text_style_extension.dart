part of './../helpers/export_manager/export_manager.dart';

extension TextStyleExtension on BuildContext {
  TextTheme get textTheme => getThemeData(this)[AppTheme.darkTheme]!.textTheme;
}
