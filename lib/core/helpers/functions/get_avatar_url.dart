part of './../export_manager/export_manager.dart';

String getAvatarUrl(String? path) {
  if (path != null) {
    if (path.startsWith('/https://www.gravatar.com/avatar')) {
      return path.substring(1);
    } else {
      return ApiConstance.baseAvatarUrl + path;
    }
  } else {
    return ApiConstance.avatarPlaceHolder;
  }
}
