import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/helpers/constant/constant.dart';
import 'package:movies_app/core/helpers/export_manager/export_manager.dart';
import 'package:movies_app/firebase_options.dart';
import 'package:package_info_plus/package_info_plus.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initializeFirebase();
  ScreenUtil.ensureScreenSize();
  Bloc.observer = MyBlocObserver();

  // Initialize all services including BlocProviders
  await serviceLocator();
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  appName = packageInfo.appName;
  appPackageName = packageInfo.packageName;
  appVersion = packageInfo.version;
  appBuildNumber = packageInfo.buildNumber;

  runApp(
    EgyDeadApp(
      appRouter: AppRouters(),
    ),
  );
}

Future<void> _initializeFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  if (kReleaseMode) {
    // Pass all uncaught "fatal" errors from the framework to Crashlytics
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

    // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };
  }
}
