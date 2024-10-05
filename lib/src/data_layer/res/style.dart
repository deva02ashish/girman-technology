import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:girman_technology/src/data_layer/res/colors.dart';

class AppStyle {
  static final SizedBox sbHeight1 = SizedBox(height: 1.h);
  static final SizedBox sbHeight15 = SizedBox(height: 15.h);
  static final SizedBox sbHeight28 = SizedBox(height: 28.h);
  static final SizedBox sbHeight109 = SizedBox(height: 109.h);
  static final SizedBox sbWidth1 = SizedBox(width: 1.w);

  static EdgeInsets pdH20 = EdgeInsets.symmetric(horizontal: 20.w);
  static EdgeInsets pdH28 = EdgeInsets.symmetric(horizontal: 28.w);
  static EdgeInsets pdH50V15 = EdgeInsets.symmetric(horizontal: 50.w,vertical: 15.h);

  static Gradient homePageGradient=const LinearGradient(
    colors: [
      AppColors.white,
      AppColors.white,
      AppColors.colb1c,
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

 static List<BoxShadow> headerBoxShadow=[
   BoxShadow(
     color: Colors.black.withOpacity(0.25),
     offset: const Offset(0, 1.41),
     blurRadius: 8.43,
     spreadRadius: 0,
   ),
 ];
}
