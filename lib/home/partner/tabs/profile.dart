import 'package:flutter/material.dart';
import 'package:handy_helper_main/common/utils/constants.dart';
import 'package:handy_helper_main/common/widgets/app_style.dart';
import 'package:handy_helper_main/common/widgets/reusable_text.dart';

class PProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.person, color: AppConst.kLight),
            title: ReusableText(
                text: "Change Profile",
                style: appStyle(16, AppConst.kLight, FontWeight.w700)),
            onTap: () {
              // Navigate to change profile screen
            },
          ),
          ListTile(
            leading: Icon(Icons.settings, color: AppConst.kLight),
            title: ReusableText(
                text: "Settings",
                style: appStyle(16, AppConst.kLight, FontWeight.w700)),
            onTap: () {
              // Navigate to settings screen
            },
          ),
          ListTile(
            leading: Icon(Icons.credit_card, color: AppConst.kLight),
            title: ReusableText(
                text: "Wallet",
                style: appStyle(16, AppConst.kLight, FontWeight.w700)),
            onTap: () {
              // Navigate to wallet screen
            },
          ),
          ListTile(
            leading: Icon(Icons.home, color: AppConst.kLight),
            title: ReusableText(
                text: "Addresses",
                style: appStyle(16, AppConst.kLight, FontWeight.w700)),
            onTap: () {
              // Navigate to addresses screen
            },
          ),
          ListTile(
            leading: Icon(Icons.event, color: AppConst.kLight),
            title: ReusableText(
                text: "Bookings",
                style: appStyle(16, AppConst.kLight, FontWeight.w700)),
            onTap: () {
              // Navigate to bookings screen
            },
          ),
          ListTile(
            leading: Icon(Icons.help, color: AppConst.kLight),
            title: ReusableText(
                text: "Help Center",
                style: appStyle(16, AppConst.kLight, FontWeight.w700)),
            onTap: () {
              // Navigate to help center screen
            },
          ),
        ],
      ),
    );
  }
}
