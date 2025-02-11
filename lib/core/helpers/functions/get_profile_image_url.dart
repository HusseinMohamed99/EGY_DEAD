part of './../export_manager/export_manager.dart';

String getProfileImageUrl(Map<String, dynamic> json) {
  if (json['profile_path'] != null) {
    return ApiConstance.baseProfileUrl + json['profile_path'];
  } else {
    return ApiConstance.castPlaceHolder;
  }
}
