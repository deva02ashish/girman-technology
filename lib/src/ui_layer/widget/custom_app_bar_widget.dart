import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:girman_technology/src/data_layer/res/colors.dart';
import 'package:girman_technology/src/data_layer/res/style.dart';
import 'package:girman_technology/src/data_layer/res/text_style.dart';
import 'package:girman_technology/src/ui_layer/widget/common_web_view_page.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 30.65.w,
        right: 30.65.w,
        bottom: 18.h,
        top: MediaQuery.of(context).padding.top,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: AppStyle.headerBoxShadow,
      ),
      child: Row(
        children: [
          SvgPicture.asset("assets/images/logo.svg"),
          SizedBox(
            width: 5.86.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Girman",
                style: AppTextStyles.poppins17W700.copyWith(
                  fontSize: 17.5.sp,
                ),
              ),
              Text(
                "TECHNOLOGIES",
                style: AppTextStyles.poppins5W600.copyWith(
                  fontSize: 5.21.sp,
                ),
              ),
            ],
          ),
          const Spacer(),
          PopupMenuButton(
            color: AppColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
              side: const BorderSide(
                width: 1,
                color: AppColors.cole3e,
              ),
            ),
            offset: Offset(0, 25.h),
            itemBuilder: (BuildContext context) {
              return [
                _gePopUpMenuItem(item: "SEARCH", onTap: () {}),
                _gePopUpMenuItem(
                    item: "WEBSITE",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const CommonWebViewPage(
                            url: "https://girmantech.com",
                          ),
                        ),
                      );
                    }),
                _gePopUpMenuItem(
                    item: "LINKEDIN",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const CommonWebViewPage(
                            url: "https://www.linkedin.com/company/girmantech/",
                          ),
                        ),
                      );
                    }),
                _gePopUpMenuItem(
                    item: "CONTACT",
                    onTap: () {
                      openEmailApp();
                    }),
              ];
            },
            child: SvgPicture.asset("assets/images/menu_icon.svg"),
          ),
        ],
      ),
    );
  }

  void openEmailApp() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'contact@girmantech.com',
      query: 'subject=Flutter Developer Application&body=I am a mobile application developer with over 2 years of experience specializing in Flutter technology.\n\nI have 2 years and 2 months of experience as a Flutter developer, working on various projects both in teams and independently. My expertise includes creating hybrid mobile applications with rich user experiences, working closely with backend teams to integrate RESTful APIs for seamless data flow to the client, and deploying apps to both the Play Store and the App Store.',
    );

    if (await canLaunchUrl(emailLaunchUri)) {
      await launchUrl(emailLaunchUri,

      );
    } else {
      throw 'Could not launch email app';
    }
  }

  PopupMenuItem<String> _gePopUpMenuItem({
    required String item,
    required void Function() onTap,
  }) {
    return PopupMenuItem(
      onTap: onTap,
      value: item,
      child: Text(
        item,
        style: AppTextStyles.inter12W400,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60.h);
}
