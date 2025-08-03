part of './../export_manager/export_manager.dart';

Future<void> checkForUpdate(BuildContext context, bool mounted) async {
  final remoteConfig = FirebaseRemoteConfig.instance;

  await remoteConfig.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(seconds: 10),
    minimumFetchInterval: const Duration(hours: 1),
  ));

  try {
    await remoteConfig.fetchAndActivate();
    final latestVersion = remoteConfig.getString('latest_version');
    dev.log('Latest version fetched: $latestVersion');

    final packageInfo = await PackageInfo.fromPlatform();
    final currentVersion = packageInfo.version;
    dev.log('Current app version: $currentVersion');

    if (_isVersionOlder(currentVersion, latestVersion)) {
      if (context.mounted) {
        await _showUpdateDialog(context);
      }
    }
  } catch (e) {
    dev.log('Error fetching remote config: $e');
  }
}

bool _isVersionOlder(String currentVersion, String remoteVersion) {
  final currentParts = currentVersion.split('.').map(int.parse).toList();
  final remoteParts = remoteVersion.split('.').map(int.parse).toList();

  for (var i = 0; i < remoteParts.length; i++) {
    if (remoteParts[i] > currentParts[i]) return true;
    if (remoteParts[i] < currentParts[i]) return false;
  }
  return false;
}

Future<void> _showUpdateDialog(BuildContext context) async {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'تحديث جديد متاح',
          style: TextStyleManager.titleSmall(context: context),
        ),
        content: const Text(
          'يوجد إصدار جديد من التطبيق. يُفضل تحديث التطبيق للحصول على أحدث الميزات.',
        ),
        actions: <Widget>[
          TextButton(
            child: Text(
              'لاحقًا',
              style: TextStyleManager.titleSmall(
                context: context,
                color: ColorManager.primaryRedColor,
              ),
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          TextButton(
            child: Text(
              'تحديث الآن',
              style: TextStyleManager.titleSmall(
                context: context,
                color: ColorManager.primaryGreenColor,
              ),
            ),
            onPressed: () {
              _launchURL(
                'https://play.google.com/store/apps/details?id=$appPackageName',
              );
            },
          ),
        ],
      ),
    );
  });
}

Future<void> _launchURL(String url) async {
  final uri = Uri.parse(url);
  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    throw Exception('لا يمكن فتح الرابط $url');
  }
}
