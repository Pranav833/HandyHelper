import 'package:flutter/material.dart';
import 'package:handy_helper_main/auth/pages/login_page.dart';
import 'package:handy_helper_main/auth/pages/partner_type.dart';
import 'package:handy_helper_main/auth/pages/user_info_page.dart';
import 'package:handy_helper_main/auth/pages/user_type.dart';
import 'package:handy_helper_main/auth/pages/otp_page.dart';
import 'package:handy_helper_main/home/customer/pages/homescreen.dart';
import 'package:handy_helper_main/home/partner/pages/homescreen.dart';
import 'package:handy_helper_main/welcome/pages/welcome.dart';

class Routes {
  static const String welcome = "welcome";
  static const String login = "login";
  static const String otp = "otp";
  static const String u_home = "u_home";
  static const String p_home = "p_home";
  static const String get_user_info = "get_user_info";
  static const String user_type = "user_type";
  static const String partner_type = "partner_type";

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case welcome:
        return MaterialPageRoute(builder: (context) => OnBoarding());

      case login:
        return MaterialPageRoute(builder: (context) => LoginPage());

      case u_home:
        return MaterialPageRoute(builder: (context) => UHomeScreen());

      case p_home:
        return MaterialPageRoute(builder: (context) => PHomeScreen());

      case otp:
        final Map args = settings.arguments as Map;
        return MaterialPageRoute(
          builder: (context) => OtpPage(
            phone: args['phone'],
            smsCodeId: args['smsCodeId'],
          ),
        );

      // return MaterialPageRoute(builder: (context) => Text(otp));

      case get_user_info:
        final Map args = settings.arguments as Map;
        return MaterialPageRoute(
            builder: (context) => UserInfoPage(
                  user_type: args['user_type'],
                ));

      case user_type:
        return MaterialPageRoute(builder: (context) => UserTypeSelection());

      case partner_type:
        return MaterialPageRoute(builder: (context) => PartnerTypeSelection());

      default:
        return MaterialPageRoute(
          builder: (context) => const Text("Nothing Here"),
        );
    }
  }
}
