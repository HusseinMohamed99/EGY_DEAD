import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:movies_app/core/helpers/constant/constant.dart';
import 'package:movies_app/core/helpers/export_manager/export_manager.dart';
import 'package:movies_app/firebase_options.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

Future<void> main() async {
  SentryWidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await MobileAds.instance.initialize();
  await ScreenUtil.ensureScreenSize();
  Bloc.observer = MyBlocObserver();
  await dotenv.load(fileName: '.env');
  await serviceLocator();

  if (kReleaseMode) {
    await SentryFlutter.init(
      (options) {
        options.dsn = dotenv.env['sentryKey'];
        options.tracesSampleRate = 0.01;
      },
      appRunner: () => runApp(
        EgyDeadApp(
          appRouter: AppRouters(),
        ),
      ),
    );
  } else {
    runApp(
      EgyDeadApp(
        appRouter: AppRouters(),
      ),
    );
  }
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  appPackageName = packageInfo.packageName;
  appVersion = packageInfo.version;
}
