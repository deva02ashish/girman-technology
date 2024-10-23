import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:girman_technology/src/bussiness_layer/provider/firebase_storage_provider.dart';
import 'package:girman_technology/src/data_layer/models/users_response_model.dart';
import 'package:girman_technology/src/data_layer/res/colors.dart';
import 'package:girman_technology/src/data_layer/res/style.dart';
import 'package:girman_technology/src/data_layer/res/text_style.dart';
import 'package:girman_technology/src/ui_layer/widget/common_text_field.dart';
import 'package:girman_technology/src/ui_layer/widget/custom_app_bar_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late FirebaseStorageProvider _firebaseStorageProvider;
  final FocusNode _focusNode = FocusNode();
 final TextEditingController _searchController=TextEditingController();

  @override
  void initState() {
    _firebaseStorageProvider = context.read<FirebaseStorageProvider>();
    SchedulerBinding.instance.addPostFrameCallback((duration) {
      _firebaseStorageProvider.fetchUsersData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  CustomAppBarWidget(
        onSearchTap: (){
          FocusScope.of(context).requestFocus(_focusNode);
        },
      ),
      body: _getBody(),
    );
  }

  Widget _getBody() {
    return Container(
      decoration:  BoxDecoration(
        gradient: AppStyle.homePageGradient,
      ),
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
          _getUsersList(),
        ],
      ),
    );
  }


  Widget _getSearchWidget() {
    return Padding(
      padding: AppStyle.pdH28,
      child: CommonTextField(
        onTapOutside: (pointerDownEvent){
          FocusManager.instance.primaryFocus?.unfocus();
          _firebaseStorageProvider.searchUsers(_searchController.text.trim());
        },
        focusNode: _focusNode,
        onFieldSubmitted: (val) {
          _firebaseStorageProvider.searchUsers(_searchController.text.trim());
        },
        controller: _searchController,
        textInputAction: TextInputAction.search,
        hintText: "Search",
        prefixWidget: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset("assets/images/search_icon.svg"),
        ),
      ),
    );
  }

  Widget _getUsersList() {
    return Consumer<FirebaseStorageProvider>(
      builder: (context, provider, child) {
        return Expanded(
          child: ListView.separated(
            padding: AppStyle.pdH50V15,
            shrinkWrap: true,
            separatorBuilder: (context, index) => SizedBox(
              height: 27.h,
            ),
            itemCount: provider.usersList.length,
            itemBuilder: (context, index) =>
                _getUserDataCard(provider.usersList[index]),
          ),
        );
      },
    );
  }

  Widget _getUserDataCard(Users data) {
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
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                height: 67.45.h,
                width: 67.45.h,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                imageUrl: data.profileImage ?? "",
              ),
            ),
          ),
          SizedBox(
            height: 6.92.h,
          ),
          Text(
            data.name ?? "",
            style: AppTextStyles.inter28W600,
            overflow: TextOverflow.ellipsis,
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
                data.location ?? "",
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
                        data.contactNumber ?? "",
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
                onTap: () => fetchUserDetails(data),
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

  void fetchUserDetails(Users data) {
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
                    "Name: ${data.name}",
                    style: AppTextStyles.inter13W500.copyWith(
                      color: AppColors.col090,
                    ),
                  ),
                  Text(
                    "Location: ${data.location}",
                    style: AppTextStyles.inter13W500.copyWith(
                      color: AppColors.col090,
                    ),
                  ),
                  Text(
                    "Contact Number: ${data.contactNumber}",
                    style: AppTextStyles.inter13W500.copyWith(
                      color: AppColors.col090,
                    ),
                  ),
                  SizedBox(
                    height: 14.81.h,
                  ),
                  CachedNetworkImage(
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    imageUrl: data.profileImage ?? "",
                    height: 191.h,
                    width: 191.w,
                    fit: BoxFit.cover,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
