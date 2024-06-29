import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:handy_helper_main/common/utils/constants.dart';
import 'package:handy_helper_main/common/widgets/app_style.dart';
import 'package:handy_helper_main/common/widgets/height_spacer.dart';
import 'package:handy_helper_main/common/widgets/reusable_text.dart';
import 'package:handy_helper_main/common/widgets/width_spacer.dart';

class Todotile extends StatelessWidget {
  const Todotile(
      {super.key,
      this.color,
      this.title,
      this.description,
      this.name,
      this.start,
      this.end,
      this.editWidget,
      this.delete,
      this.switcher});

  final Color? color;
  final String? title;
  final String? description;
  final String? start;
  final String? end;
  final Widget? editWidget;
  final void Function()? delete;
  final Widget? switcher;
  final String? name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(8.h),
            decoration: BoxDecoration(
              color: AppConst.kGreyLight,
              borderRadius: BorderRadius.all(
                Radius.circular(AppConst.kRadius),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 80,
                      width: 5,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(AppConst.kRadius),
                          ),
                          color: color ?? AppConst.kRed),
                    ),
                    WidthSpacer(wydth: 15),
                    Padding(
                      padding: EdgeInsets.all(8.h),
                      child: SizedBox(
                        width: AppConst.kWidth * 0.6,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ReusableText(
                              text: name ?? "cant load name",
                              style: appStyle(
                                  18, AppConst.kBkDark, FontWeight.bold),
                            ),
                            ReusableText(
                              text: title ?? "Title of Todo",
                              style: appStyle(
                                  18, AppConst.kLight, FontWeight.bold),
                            ),
                            HeightSpacer(hieght: 3),
                            ReusableText(
                              text: description ?? "Description of Todo",
                              style: appStyle(
                                  18, AppConst.kLight, FontWeight.bold),
                            ),
                            HeightSpacer(hieght: 3),
                            start != null && end != null
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: AppConst.kWidth * 0.3,
                                        height: 25.h,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            width: 0.3,
                                            color: AppConst.kGreyDk,
                                          ),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(AppConst.kRadius),
                                          ),
                                          color: AppConst.kBkDark,
                                        ),
                                        child: ReusableText(
                                          text: "   $start",
                                          style: appStyle(12, AppConst.kLight,
                                              FontWeight.normal),
                                        ),
                                      ),
                                      WidthSpacer(wydth: 20),
                                      Row(
                                        children: [
                                          SizedBox(
                                            child: editWidget,
                                          ),
                                          WidthSpacer(wydth: 20),
                                        ],
                                      ),
                                    ],
                                  )
                                : Container(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 0.h),
                  child: switcher,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
