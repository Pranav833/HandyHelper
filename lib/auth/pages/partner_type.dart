import 'package:flutter/material.dart';
import 'package:handy_helper_main/auth/pages/user_info_page.dart';
import 'package:handy_helper_main/common/routes/routes.dart';
import 'package:handy_helper_main/common/utils/constants.dart';
import 'package:handy_helper_main/common/widgets/app_style.dart';
import 'package:handy_helper_main/common/widgets/reusable_text.dart';

class PartnerTypeSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Container(
                  // decoration: BoxDecoration(
                  //   color: AppConst.kLight, // Background color
                  //   borderRadius:
                  //       BorderRadius.circular(10), // Rounded border radius
                  // ),

                  decoration: BoxDecoration(
                      color: AppConst.kLight,
                      borderRadius: BorderRadius.circular(AppConst.kRadius)),
                  height: AppConst.kHeight * 0.2,
                  width: AppConst.kWidth * 0.5,

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(Icons.person),
                        iconSize: 50,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    UserInfoPage(user_type: "cook")),
                          );
                        },
                      ),
                      ReusableText(
                        text: 'Cook',
                        style: appStyle(16, AppConst.kBkDark, FontWeight.bold),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: AppConst.kLight,
                      borderRadius: BorderRadius.circular(AppConst.kRadius)),
                  height: AppConst.kHeight * 0.2,
                  width: AppConst.kWidth * 0.5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(Icons.person),
                        iconSize: 50,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    UserInfoPage(user_type: "cleaner")),
                          );
                        },
                      ),
                      ReusableText(
                        text: 'cleaner',
                        style: appStyle(16, AppConst.kBkDark, FontWeight.bold),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  height: AppConst.kHeight * 0.2,
                  width: AppConst.kWidth * 0.5,
                  decoration: BoxDecoration(
                      color: AppConst.kLight,
                      borderRadius: BorderRadius.circular(AppConst.kRadius)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(Icons.person),
                        iconSize: 50,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    UserInfoPage(user_type: "electrician")),
                          );
                        },
                      ),
                      ReusableText(
                        text: 'electrician',
                        style: appStyle(16, AppConst.kBkDark, FontWeight.bold),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  height: AppConst.kHeight * 0.2,
                  width: AppConst.kWidth * 0.5,
                  decoration: BoxDecoration(
                      color: AppConst.kLight,
                      borderRadius: BorderRadius.circular(AppConst.kRadius)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(Icons.person),
                        iconSize: 50,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    UserInfoPage(user_type: "plumber")),
                          );
                        },
                      ),
                      ReusableText(
                        text: 'plumber',
                        style: appStyle(16, AppConst.kBkDark, FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
