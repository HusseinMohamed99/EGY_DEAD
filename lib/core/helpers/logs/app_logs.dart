// part of '../export_manager/export_manager.dart';

// class AppLogs {
//   AppLogs._();

//   // Set to true to enable logging in release mode
//   static const bool logInRelease = true;

//   static String get _getCurrentTime {
//     final DateTime now = DateTime.now();
//     return '${now.minute}:${now.second}:${now.millisecond}';
//   }

//   static bool get _shouldLog => kDebugMode || logInRelease;

//   //* Success
//   static void successLog(String message, [String tag = 'Success']) {
//     if (_shouldLog) {
//       log(
//         '\x1B[32m$tag ✅✅✅✅✅✅✅✅✅✅✅✅✅:  $message\x1B[0m',
//         name: 'Success $_getCurrentTime',
//         level: 0,
//       );
//     }
//   }

//   //* Debug
//   static void debugLog(String message, [String tag = 'Debug']) {
//     if (_shouldLog) {
//       log(
//         '\x1B[37m$tag 🐛🐛🐛🐛🐛🐛🐛🐛🐛🐛🐛🐛🐛🐛: $message\x1B[0m',
//         name: 'Debug $_getCurrentTime',
//         level: 1,
//       );
//     }
//   }

//   //* Info
//   static void infoLog(String message, [String tag = 'Info']) {
//     if (_shouldLog) {
//       log(
//         '\x1B[33m$tag 📣📣📣📣📣📣📣📣📣📣📣📣📣: $message\x1B[0m',
//         name: 'Info $_getCurrentTime',
//         level: 2,
//       );
//     }
//   }

//   //* Error
//   static void errorLog(String message, [String tag = 'Error']) {
//     if (_shouldLog) {
//       log(
//         '\x1B[31m$tag ❌❌❌❌❌❌❌❌❌❌❌❌❌: $message\x1B[0m',
//         name: 'Error $_getCurrentTime',
//         level: 3,
//       );
//     }
//   }
// }
