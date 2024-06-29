import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:handy_helper_main/common/utils/constants.dart';
import 'package:handy_helper_main/common/widgets/app_style.dart';
import 'package:handy_helper_main/common/widgets/reusable_text.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      this.keyboardType,
      required this.hintText,
      this.suffixIcon,
      this.prefixIcon,
      this.hintStyle,
      required this.controller,
      this.onChanged,
      this.wydth,
      this.enabled});

  final TextInputType? keyboardType;
  final String hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextStyle? hintStyle;
  final TextEditingController controller;
  final void Function(String)? onChanged;
  final double? wydth;
  final bool? enabled;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: wydth ?? (AppConst.kWidth * 0.9),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(AppConst.kRadius)),
            color: AppConst.kLight),
        child: TextFormField(
          enabled: enabled ?? true,
          keyboardType: keyboardType,
          controller: controller,
          cursorHeight: 25,
          onChanged: onChanged,
          style: appStyle(18, AppConst.kGreyBk, FontWeight.w700),
          decoration: InputDecoration(
              hintText: hintText,
              suffixIcon: suffixIcon,
              prefixIcon: prefixIcon,
              suffixIconColor: AppConst.kBkDark,
              hintStyle: hintStyle,
              errorBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.zero,
                  borderSide: BorderSide(color: AppConst.kRed, width: 0.5)),
              focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.zero,
                  borderSide:
                      BorderSide(color: Colors.transparent, width: 0.5)),
              disabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.zero,
                  borderSide: BorderSide(color: AppConst.kGreyDk, width: 0.5)),
              enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.zero,
                  borderSide: BorderSide(color: AppConst.kBkDark, width: 0.5))),
        ));
  }
}
