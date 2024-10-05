import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:girman_technology/src/provider_registration.dart';
import 'package:girman_technology/src/ui_layer/screen/home_page/home_page.dart';
import 'package:provider/provider.dart';

class GiramanApp extends StatelessWidget {
  const GiramanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: ProviderRegistration.getProviders(context),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Girman Technology',
        builder: (BuildContext context, Widget? child) {
          ScreenUtil.init(context, designSize: const Size(375, 792));
          return child ?? Container();
        },
        home: const HomePage(),
      ),
    );
  }
}
