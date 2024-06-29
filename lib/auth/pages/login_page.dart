import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:handy_helper_main/auth/pages/otp_page.dart';
import 'package:handy_helper_main/auth/repo_and_controller/auth_controller.dart';
import 'package:handy_helper_main/common/utils/constants.dart';
import 'package:handy_helper_main/common/widgets/app_style.dart';
import 'package:handy_helper_main/common/widgets/custom_otln_button.dart';
import 'package:handy_helper_main/common/widgets/custom_text.dart';
import 'package:handy_helper_main/common/widgets/height_spacer.dart';
import 'package:handy_helper_main/common/widgets/reusable_text.dart';
import 'package:handy_helper_main/common/helpers/show_dialogue.dart';
// import 'package:handy_helper_main//auth/repo_and_controller/auth_controller.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginState();
}

class _LoginState extends ConsumerState<LoginPage> {
  final TextEditingController phone = TextEditingController();

  Country country = Country(
    phoneCode: "91",
    countryCode: "IN",
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: "India",
    example: "India",
    displayName: "India",
    displayNameNoCountryCode: "India",
    e164Key: "",
  );

  sendCodeToUser() {
    print(phone.text);
    if (phone.text.isEmpty) {
      return showAlertDialog(
          context: context, message: "Please enter your phone number");
    } else if (phone.text.length < 8) {
      return showAlertDialog(
          context: context, message: "Please enter your phone number");
    } else {
      // Navigator.push(context,MaterialPageRoute(builder: (context) => OtpPage()));
      ref.read(authControllerProvider).sendSmsCode(
          context: context, phoneNumber: "+${country.phoneCode}${phone.text}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                //image
              ),
              const HeightSpacer(hieght: 20),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 16),
                child: ReusableText(
                  text: "Please enter your mobile number",
                  style: appStyle(17, AppConst.kLight, FontWeight.w500),
                ),
              ),
              const HeightSpacer(hieght: 20),
              Center(
                child: CustomTextField(
                  controller: phone,
                  prefixIcon: Container(
                    padding: const EdgeInsets.all(4),
                    child: GestureDetector(
                      onTap: () {
                        showCountryPicker(
                          context: context,
                          countryListTheme: CountryListThemeData(
                            backgroundColor: AppConst.kLight,
                            bottomSheetHeight: AppConst.kHeight * 0.6,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(AppConst.kRadius),
                              topRight: Radius.circular(AppConst.kRadius),
                            ),
                          ),
                          onSelect: (code) {
                            setState(
                              () {
                                country = code;
                              },
                            );
                          },
                        );
                      },
                      child: ReusableText(
                        text: "${country.flagEmoji} + ${country.phoneCode}",
                        style: appStyle(18, AppConst.kBkDark, FontWeight.bold),
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.phone,
                  hintText: "Enter phone number",
                  hintStyle: appStyle(16, AppConst.kBkDark, FontWeight.w600),
                ),
              ),
              const HeightSpacer(hieght: 20),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CustomOtlnBtn(
                  onTap: () {
                    sendCodeToUser();
                  },
                  width: AppConst.kWidth * 0.9,
                  height: AppConst.kHeight * 0.075,
                  color: AppConst.kBkDark,
                  color2: AppConst.kLight,
                  text: "Send Code",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
