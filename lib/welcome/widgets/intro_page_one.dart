import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:handy_helper_main/common/utils/constants.dart';
import 'package:handy_helper_main/common/widgets/app_style.dart';
import 'package:handy_helper_main/common/widgets/height_spacer.dart';
import 'package:handy_helper_main/common/widgets/reusable_text.dart';

class IntroPageOne extends StatelessWidget {
  const IntroPageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppConst.kHeight,
      width: AppConst.kWidth,
      color: AppConst.kBkDark,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            //image
          ),
          HeightSpacer(hieght: 100),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ReusableText(
                  text: "Handy Helper",
                  style: appStyle(30, AppConst.kLight, FontWeight.w600)),
              HeightSpacer(hieght: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Text(
                  "Welcome! get quick services for your household chores",
                  textAlign: TextAlign.center,
                  style: appStyle(16, AppConst.kLight, FontWeight.normal),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
