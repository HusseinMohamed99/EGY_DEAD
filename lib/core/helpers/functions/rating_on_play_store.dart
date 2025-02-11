part of './../export_manager/export_manager.dart';

void ratingOnPlayStore() async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();

  String url = '';
  String packageName = packageInfo.packageName;
  if (Platform.isAndroid) {
    url = 'https://play.google.com/store/apps/details?id=$packageName';
    if (!await launchUrl(Uri.parse(url),
        mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }
}
