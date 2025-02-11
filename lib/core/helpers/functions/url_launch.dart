part of '../export_manager/export_manager.dart';

Future<void> urlLauncher(Uri url) async {
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}
