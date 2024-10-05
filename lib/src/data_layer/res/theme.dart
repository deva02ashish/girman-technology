import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static final _instance = AppTheme._privateConstructor();

  AppTheme._privateConstructor();

  static AppTheme get instance => _instance;

  void setStatusBarTheme() {
    /// Set the status bar color to the widget
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }
}
