import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/helpers/constant/constant.dart';
import 'package:movies_app/core/helpers/export_manager/export_manager.dart';
import 'package:movies_app/firebase_options.dart';
import 'package:package_info_plus/package_info_plus.dart';

Future<void> main() async {
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await ScreenUtil.ensureScreenSize();
  Bloc.observer = MyBlocObserver();
  await dotenv.load(fileName: '.env');
  await serviceLocator();
  FlutterNativeSplash.remove();

  runApp(
    EgyDeadApp(
      appRouter: AppRouters(),
    ),
  );

  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  appPackageName = packageInfo.packageName;
  appVersion = packageInfo.version;
}
