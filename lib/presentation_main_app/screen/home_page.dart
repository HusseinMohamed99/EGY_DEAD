import 'dart:developer';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/core/helpers/app_string/app_string.dart';
import 'package:movies_app/core/helpers/enum/enum.dart';
import 'package:movies_app/core/helpers/export_manager/export_manager.dart';
import 'package:movies_app/image_assets.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      checkForUpdate(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        body: Center(
          child: BlocConsumer<InternetCubit, InternetState>(
            listener: (context, state) {
              if (state == InternetState.lost) {
                context.showSnackBar(
                  AppString.checkInternetConnection,
                  color: ColorManager.primaryRedColor,
                );
              }
            },
            builder: (context, state) {
              if (state == InternetState.gained) {
                // Navigate to MainScreen once connected

                return BlocProvider(
                  create: (context) => sl<MainBloc>(),
                  child: MainScreen(),
                ); // Temporary loading indicator while navigating
              } else if (state == InternetState.lost) {
                return SvgPicture.asset(Assets.imagesError);
              } else {
                return const CircularProgressIndicator
                    .adaptive(); // Loading indicator
              }
            },
          ),
        ),
      ),
    );
  }
}

Future<void> checkForUpdate(BuildContext context) async {
  final remoteConfig = FirebaseRemoteConfig.instance;

  // Set the Remote Config fetch settings
  await remoteConfig.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(seconds: 10),
    minimumFetchInterval: const Duration(hours: 1),
  ));

  try {
    // Fetch and activate the remote config
    await remoteConfig.fetchAndActivate();

    // Get the remote version from Remote Config
    final latestVersion = remoteConfig.getString('latest_version');

    // Log the latest version to check if it's fetched correctly
    log('Latest version fetched: $latestVersion');

    // Get the current app version
    final packageInfo = await PackageInfo.fromPlatform();
    final currentVersion = packageInfo.version;

    // Log the current version
    log('Current app version: $currentVersion');

    // Check if the app needs to be updated
    if (_isVersionOlder(currentVersion, latestVersion)) {
      await showUpdateDialog(context);
    }
  } catch (e) {
    log('Error fetching remote config: $e');
  }
}

bool _isVersionOlder(String remoteVersion, String currentVersion) {
  // Split the versions and parse each part as an integer
  List<int> remoteParts =
      remoteVersion.split('.').map((part) => int.tryParse(part) ?? 0).toList();
  List<int> currentParts =
      currentVersion.split('.').map((part) => int.tryParse(part) ?? 0).toList();

  for (int i = 0; i < remoteParts.length; i++) {
    if (remoteParts[i] > currentParts[i]) {
      return true; // Remote version is newer
    } else if (remoteParts[i] < currentParts[i]) {
      return false; // Current version is up-to-date
    }
  }
  return false; // Versions are the same
}

Future<void> showUpdateDialog(BuildContext context) async {
  // Ensure the dialog is shown after the frame is rendered
  WidgetsBinding.instance.addPostFrameCallback((_) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'تحديث جديد متاح',
            style: context.textTheme.titleSmall,
          ),
          content: const Text(
              'يوجد إصدار جديد من التطبيق. يُفضل تحديث التطبيق للحصول على أحدث الميزات.'),
          actions: <Widget>[
            TextButton(
              child: Text(
                'لاحقًا',
                style: context.textTheme.titleSmall!.copyWith(
                  color: ColorManager.primaryRedColor,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(
                'تحديث الآن',
                style: context.textTheme.titleSmall!.copyWith(
                  color: ColorManager.primaryGreenColor,
                ),
              ),
              onPressed: () {
                _launchURL(
                    'https://play.google.com/store/apps/details?id=com.example.your_app_id');
              },
            ),
          ],
        );
      },
    );
  });
}

Future<void> _launchURL(String url) async {
  !await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  {
    throw Exception('لا يمكن فتح الرابط $url');
  }
}
