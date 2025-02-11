part of './../export_manager/export_manager.dart';

Future<void> appPolicy() async {
  String url =
      'https://drive.google.com/file/d/1qIvMxdkYUaJXj01EwtQpXvd6xTgASDvP/view?usp=sharing';
  if (!await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication)) {
    throw Exception('Could not launch $url');
  }
}
