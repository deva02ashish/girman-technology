import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:girman_technology/src/data_layer/res/theme.dart';
import 'package:girman_technology/src/giraman_app.dart';

void main() async {

  /// Ensuring Size of the phone in UI Design
  await ScreenUtil.ensureScreenSize();

  /// Sets the status bar color of the widget
  AppTheme.instance.setStatusBarTheme();

  runApp(const GiramanApp());
}
