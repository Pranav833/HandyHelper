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
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart'
    as picker;

class UserInfoPage extends ConsumerStatefulWidget {
  const UserInfoPage({super.key, required this.user_type});

  final String user_type;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UserInfoPageState();
}

class _UserInfoPageState extends ConsumerState<UserInfoPage> {
  final TextEditingController name = TextEditingController();
  final TextEditingController city = TextEditingController();
  final TextEditingController dateofBirth = TextEditingController();
  String dob = "";
  String? gender = "";

  void onGenderSelected(String? gen) {
    gender = gen;
    // print("gender $gender");
  }

  saveinformation() {
    String username = name.text;
    String cityname = city.text;

    if (username.isEmpty) {
      return showAlertDialog(
        context: context,
        message: 'Please provide your name.',
      );
    }

    if (dob.isEmpty) {
      return showAlertDialog(
        context: context,
        message: 'Please provide your date of birth.',
      );
    }

    if (cityname.isEmpty) {
      return showAlertDialog(
        context: context,
        message: 'Please provide your city.',
      );
    }

    if (gender == "") {
      return showAlertDialog(
        context: context,
        message: 'Please enter your gender.',
      );
    }

    ref.read(authControllerProvider).saveUserInfoToFirestore(
          username: username,
          gender: gender!,
          dob: dob,
          city: cityname,
          context: context,
          mounted: mounted,
          type: widget.user_type,
          orders: widget.user_type == 'customer' ? null : 0,
          collectionname: widget.user_type,
        );
  }

  @override
  void initState() {
    dob = "";
    gender = "";
    print("***********8");
    print(widget.user_type);
    super.initState();
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
              // const HeightSpacer(hieght: 20),
              Center(
                child: CustomTextField(
                  controller: name,
                  keyboardType: TextInputType.text,
                  hintText: "Enter name",
                  hintStyle: appStyle(16, AppConst.kBkDark, FontWeight.w600),
                  wydth: AppConst.kWidth * 0.96,
                ),
              ),
              const HeightSpacer(hieght: 20),
              Center(
                child: GestureDetector(
                  onTap: () {
                    picker.DatePicker.showDatePicker(context,
                        showTitleActions: true,
                        minTime: DateTime(1999, 1, 1),
                        maxTime: DateTime(2024, 12, 31),
                        theme: const picker.DatePickerTheme(
                            doneStyle: TextStyle(
                                color: AppConst.kGreen,
                                fontSize: 16)), onConfirm: (date) {
                      setState(() {
                        dob = date.toString().substring(0, 10);
                        print(dob);
                      });
                    },
                        currentTime: DateTime.now(),
                        locale: picker.LocaleType.en);
                  },
                  child: CustomTextField(
                    enabled: false,
                    keyboardType: TextInputType.text,
                    controller: dateofBirth,
                    prefixIcon: Icon(Icons.calendar_month),
                    hintText: dob == "" ? "Birth Date" : dob,
                    hintStyle: appStyle(16, AppConst.kBkDark, FontWeight.w600),
                    wydth: AppConst.kWidth * 0.96,
                  ),
                ),
              ),
              const HeightSpacer(hieght: 20),

              Center(
                child: CustomTextField(
                  controller: city,
                  keyboardType: TextInputType.text,
                  hintText: "Enter City",
                  hintStyle: appStyle(16, AppConst.kBkDark, FontWeight.w600),
                  wydth: AppConst.kWidth * 0.96,
                ),
              ),

              const HeightSpacer(hieght: 20),

              Center(
                child: Container(
                  width: (AppConst.kWidth * 0.9),
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.all(Radius.circular(AppConst.kRadius)),
                      color: AppConst.kLight),
                  child: GenderSelection(
                    onGenderSelected: onGenderSelected,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CustomOtlnBtn(
                  onTap: () {
                    saveinformation();
                  },
                  width: AppConst.kWidth * 0.9,
                  height: AppConst.kHeight * 0.075,
                  color: AppConst.kBkDark,
                  color2: AppConst.kLight,
                  text: "Submit Details",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum Genders { male, female, other }

class GenderSelection extends StatefulWidget {
  const GenderSelection({super.key, required this.onGenderSelected});

  final Function(String?) onGenderSelected;

  @override
  State<GenderSelection> createState() => _GenderSelectionState();
}

class _GenderSelectionState extends State<GenderSelection> {
  Genders? _gender;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        ListTile(
          title: const Text('Male'),
          leading: Radio<Genders>(
            value: Genders.male,
            groupValue: _gender,
            onChanged: (Genders? value) {
              setState(() {
                _gender = value;
                widget.onGenderSelected("male");
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Female'),
          leading: Radio<Genders>(
            value: Genders.female,
            groupValue: _gender,
            onChanged: (Genders? value) {
              setState(() {
                _gender = value;
                widget.onGenderSelected("female");
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Other'),
          leading: Radio<Genders>(
            value: Genders.other,
            groupValue: _gender,
            onChanged: (Genders? value) {
              setState(() {
                _gender = value;
                widget.onGenderSelected("other");
              });
            },
          ),
        )
      ],
    );
  }
}
