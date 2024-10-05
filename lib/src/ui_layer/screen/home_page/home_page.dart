import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:girman_technology/src/data_layer/res/colors.dart';
import 'package:girman_technology/src/data_layer/res/style.dart';
import 'package:girman_technology/src/data_layer/res/text_style.dart';
import 'package:girman_technology/src/ui_layer/widget/common_text_field.dart';
import 'package:girman_technology/src/ui_layer/widget/custom_app_bar_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWidget(),
      body: _getBody(),
    );
  }

  Widget _getBody() {
    return Container(
      decoration: BoxDecoration(
        gradient: AppStyle.homePageGradient,
      ),
      child: Column(
        children: [
          _getBodyWidgets(),
        ],
      ),
    );
  }

  Widget _getBodyWidgets() {
    return Expanded(
      child: Column(
        children: [
          AppStyle.sbHeight109,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset("assets/images/girman_icon.svg"),
              SizedBox(
                width: 28.w,
              ),
              Text(
                "Girman",
                style: AppTextStyles.poppins17W700.copyWith(
                  fontSize: 57.33.sp,
                ),
              )
            ],
          ),
          AppStyle.sbHeight28,
          _getSearchWidget(),
          AppStyle.sbHeight15,
          _getUsersList(),
        ],
      ),
    );
  }

  Widget _getSearchWidget() {
    return Padding(
      padding: AppStyle.pdH28,
      child: CommonTextField(
        hintText: "Search",
        prefixWidget: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset("assets/images/search_icon.svg"),
        ),
      ),
    );
  }

  Widget _getUsersList() {
    return Expanded(
      child: ListView.separated(
        padding: AppStyle.pdH50V15,
        shrinkWrap: true,
        separatorBuilder: (context, index) => SizedBox(
          height: 27.h,
        ),
        itemCount: 5,
        itemBuilder: (context, index) => _getUserDataCard(),
      ),
    );
  }

  Widget _getUserDataCard() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20.75.w,
        vertical: 20.75.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.colfff,
        borderRadius: BorderRadius.circular(13.84.w),
        border: Border.all(
          width: 0.86.w,
          color: AppColors.cole1e,
        ),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 3.46),
            blurRadius: 8.65,
            spreadRadius: 0,
            color: AppColors.col000.withOpacity(0.1),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(6.92.w),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                width: 0.86.w,
                color: AppColors.colf3f,
              ),
            ),
            height: 67.45.h,
            width: 67.45.h,
            child: Image.asset("assets/images/profile.png"),
          ),
          SizedBox(
            height: 6.92.h,
          ),
          Text(
            "Anjali Sharma",
            style: AppTextStyles.inter28W600,
          ),
          SizedBox(
            height: 7.54.h,
          ),
          Row(
            children: [
              SvgPicture.asset("assets/images/location_icon.svg"),
              SizedBox(
                width: 6.92.w,
              ),
              Text(
                "Mumbai",
                style: AppTextStyles.inter13W500.copyWith(
                  fontSize: 8.65.sp,
                  color: AppColors.col425,
                ),
              )
            ],
          ),
          SizedBox(
            height: 27.67.h,
          ),
          Container(
            color: AppColors.colf3f,
            height: 0.86.h,
          ),
          SizedBox(
            height: 6.92.h,
          ),
          Row(
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      SvgPicture.asset("assets/images/call_icon.svg"),
                      SizedBox(
                        width: 5.92.w,
                      ),
                      Text(
                        "90999 80888",
                        style: AppTextStyles.inter28W600.copyWith(
                          fontSize: 10.38.sp,
                          color: AppColors.col000,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 4.32.h,
                  ),
                  Text(
                    "Available on phone",
                    style: AppTextStyles.inter13W500.copyWith(
                      fontSize: 8.65.sp,
                      color: AppColors.colafa,
                    ),
                  )
                ],
              ),
              const Spacer(),
              GestureDetector(
                onTap: fetchUserDetails,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 13.84.w,
                    vertical: 9.79.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.col181,
                    borderRadius: BorderRadius.circular(6.92.w),
                  ),
                  child: Text(
                    "Fetch Details",
                    style: AppTextStyles.inter13W500.copyWith(
                      fontSize: 12.11.sp,
                      color: AppColors.colfaf,
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  void fetchUserDetails() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(7.41),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x0D000000),
                  offset: Offset(0, 3.7),
                  blurRadius: 5.55,
                  spreadRadius: -1.85,
                ),
                BoxShadow(
                  color: Color(0x1A000000),
                  offset: Offset(0, 9.26),
                  blurRadius: 13.89,
                  spreadRadius: -2.78,
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.only(
                left: 22.22.w,
                right: 22.22.w,
                top: 22.2.h,
                bottom: 80.h,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Fetch Details",
                        style: AppTextStyles.inter28W600.copyWith(
                          fontSize: 22.22.sp,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child:
                            SvgPicture.asset("assets/images/cancel_icon.svg"),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 7.41.h,
                  ),
                  Text(
                    "Here are the details of following employee.",
                    style: AppTextStyles.inter12W400.copyWith(
                      fontSize: 12.96.sp,
                      color: AppColors.col717,
                    ),
                  ),
                  SizedBox(
                    height: 14.81.h,
                  ),
                  Text(
                    "Name: Anjali Sharma",
                    style: AppTextStyles.inter13W500.copyWith(
                      color: AppColors.col090,
                    ),
                  ),
                  Text(
                    "Location: Mumbai",
                    style: AppTextStyles.inter13W500.copyWith(
                      color: AppColors.col090,
                    ),
                  ),
                  Text(
                    "Contact Number: 9918893873",
                    style: AppTextStyles.inter13W500.copyWith(
                      color: AppColors.col090,
                    ),
                  ),
                  SizedBox(
                    height: 14.81.h,
                  ),
                  Image.asset(
                    "assets/images/full_profile_img.png",
                    height: 191.h,
                    width: 191.w,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
