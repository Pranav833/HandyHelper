import 'package:flutter/material.dart';
import 'package:handy_helper_main/auth/pages/login_page.dart';
import 'package:handy_helper_main/common/helpers/show_loading_dialog.dart';
import 'package:handy_helper_main/common/utils/constants.dart';
import 'package:handy_helper_main/common/widgets/custom_otln_button.dart';
import 'package:handy_helper_main/common/widgets/height_spacer.dart';
import 'package:handy_helper_main/common/helpers/show_dialogue.dart';

class IntroPageTwo extends StatelessWidget {
  const IntroPageTwo({super.key});

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
            padding: EdgeInsets.symmetric(horizontal: 30),
            //image
          ),
          HeightSpacer(hieght: 100),
          CustomOtlnBtn(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              width: AppConst.kWidth * 0.9,
              height: AppConst.kHeight * 0.06,
              color: AppConst.kLight,
              text: "Login with a phone number"),
        ],
      ),
    );
  }
}
