import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/helpers/export_manager/export_manager.dart';
import 'package:upgrader/upgrader.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ScreenUtil.ensureScreenSize();
  Bloc.observer = MyBlocObserver();

  // Initialize all services including BlocProviders
  await serviceLocator();

  if (kDebugMode) {
    await Upgrader.clearSavedSettings();
  }
  runApp(
    EgyDeadApp(
      appRouter: AppRouters(),
    ),
  );
}
