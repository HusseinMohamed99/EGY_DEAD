import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/global/theme/style/color_manger.dart';
import 'package:movies_app/core/network/api_constance.dart';
import 'package:movies_app/core/network/error_message_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:upgrader/upgrader.dart';
import 'package:url_launcher/url_launcher.dart';

part './../../components/size_box.dart';
part './../../components/upgrade_wrapper.dart';
part './../../error/exceptions.dart';
part './../../extensions/snack_bar.dart';
part './../../global/theme/style/responsive_font_size.dart';
part './../../global/theme/style/text_style.dart';
part './../../network/cache_helper.dart';
part './../../utils/function.dart';
