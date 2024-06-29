import 'package:flutter/material.dart';
import 'package:handy_helper_main/auth/pages/partner_type.dart';
import 'package:handy_helper_main/auth/pages/user_info_page.dart';
import 'package:handy_helper_main/common/routes/routes.dart';
import 'package:handy_helper_main/common/utils/constants.dart';
import 'package:handy_helper_main/common/widgets/app_style.dart';
import 'package:handy_helper_main/common/widgets/reusable_text.dart';

class UserTypeSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              color: AppConst.kLight, // Left half background color
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
                                UserInfoPage(user_type: "customer")),
                      );
                    },
                  ),
                  ReusableText(
                    text: 'Be Our Customer',
                    style: appStyle(16, AppConst.kBkDark, FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: AppConst.kBkDark, // Right half background color
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.business),
                    color: AppConst.kLight,
                    iconSize: 50,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PartnerTypeSelection()),
                      );
                    },
                  ),
                  ReusableText(
                    text: 'Be Our Partener',
                    style: appStyle(16, AppConst.kLight, FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
