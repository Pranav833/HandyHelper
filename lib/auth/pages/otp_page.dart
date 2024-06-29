import 'package:flutter/material.dart';

import 'package:handy_helper_main/common/utils/constants.dart';
import 'package:handy_helper_main/common/widgets/app_style.dart';
import 'package:handy_helper_main/common/widgets/height_spacer.dart';
import 'package:handy_helper_main/common/widgets/reusable_text.dart';
import 'package:handy_helper_main/auth/repo_and_controller/auth_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pinput/pinput.dart';

class OtpPage extends ConsumerWidget {
  const OtpPage({super.key, required this.smsCodeId, required this.phone});

  final String smsCodeId;
  final String phone;

  verifyOtpCode(BuildContext context, WidgetRef ref, String smsCode) {
    ref.read(authControllerProvider).verifyOtp(
        context: context,
        smsCodeId: smsCodeId,
        smsCode: smsCode,
        mounted: true);

    // return showLoadingDialog(context: context, message: "otp wrnog");
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
          child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            HeightSpacer(hieght: 26),
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 30.w),
            //   child: Image.asset(
            //     "src",
            //     width: AppConst.kWidth * 0.5,
            //   ),
            // ),
            HeightSpacer(hieght: 26),
            ReusableText(
                text: "Enter your otp code",
                style: appStyle(18, AppConst.kLight, FontWeight.bold)),
            HeightSpacer(hieght: 26),
            Pinput(
              length: 6,
              showCursor: true,
              onCompleted: (value) {
                if (value.length == 6) {
                  return verifyOtpCode(context, ref, value);
                }
              },
              onSubmitted: (value) {
                if (value.length == 6) {
                  return verifyOtpCode(context, ref, value);
                }
              },
            )
          ],
        ),
      )),
    );
  }
}
