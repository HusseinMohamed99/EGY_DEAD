import 'dart:developer';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/core/helpers/app_string/app_string.dart';
import 'package:movies_app/core/helpers/constant/constant.dart';
import 'package:movies_app/core/helpers/enum/enum.dart';
import 'package:movies_app/core/helpers/export_manager/export_manager.dart';
import 'package:movies_app/image_assets.dart';
import 'package:movies_app/presentation_main_app/screen/main_screen.dart';
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
      checkForUpdate(context, mounted);
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
                  child: const MainScreen(),
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

Future<void> checkForUpdate(BuildContext context, bool mounted) async {
  final remoteConfig = FirebaseRemoteConfig.instance;

  await remoteConfig.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(seconds: 10),
    minimumFetchInterval: const Duration(hours: 1),
  ));

  try {
    await remoteConfig.fetchAndActivate();
    final latestVersion = remoteConfig.getString('latest_version');
    log('Latest version fetched: $latestVersion');

    final packageInfo = await PackageInfo.fromPlatform();
    final currentVersion = packageInfo.version;
    log('Current app version: $currentVersion');

    if (_isVersionOlder(currentVersion, latestVersion)) {
      if (mounted) {
        await _showUpdateDialog(context);
      }
    }
  } catch (e) {
    log('Error fetching remote config: $e');
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
