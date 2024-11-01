import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:movies_app/core/helpers/export_manager/export_manager.dart';
import 'package:movies_app/core/routing/routes.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:upgrader/upgrader.dart';
import 'package:url_launcher/url_launcher.dart';

import 'core/helpers/app_string/app_string.dart';
import 'core/helpers/enum/enum.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ScreenUtil.ensureScreenSize();
  Bloc.observer = MyBlocObserver();

  // Initialize all services including BlocProviders
  await ServiceLocator().init();
  if (kReleaseMode) {
    try {
      await requestReview();
    } catch (e) {
      log('Error requesting review: $e');
    }
  }
  if (kDebugMode) {
    await Upgrader.clearSavedSettings();
  }
  runApp(const EgyDeadApp());
}

class EgyDeadApp extends StatelessWidget {
  const EgyDeadApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, __) {
        SystemChrome.setPreferredOrientations(
          [
            DeviceOrientation.portraitUp,
            DeviceOrientation.portraitDown,
          ],
        );
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.moviesScreen,
          onGenerateRoute: AppRouters().generateRoute,
          title: AppString.appTitle,
          theme: getThemeData(context)[AppTheme.darkTheme],
          darkTheme: getThemeData(context)[AppTheme.darkTheme],
          home: const HomePage(),
        );
      },
    );
  }
}

Future<void> requestReview() async {
  final InAppReview inAppReview = InAppReview.instance;

  if (await inAppReview.isAvailable()) {
    await inAppReview.requestReview();
  } else {
    goToApplicationOnPlayStore();
  }
}

Future<void> goToApplicationOnPlayStore() async {
  try {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String packageName = packageInfo.packageName;
    String url = 'https://play.google.com/store/apps/details?id=$packageName';

    if (Platform.isAndroid &&
        !await launchUrl(Uri.parse(url),
            mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  } catch (e) {
    log('Error launching URL: $e');
  }
}
