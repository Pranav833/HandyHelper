import 'package:flutter/material.dart';
import 'package:handy_helper_main/common/utils/constants.dart';
import 'package:handy_helper_main/common/widgets/app_style.dart';
import 'package:handy_helper_main/common/widgets/reusable_text.dart';

showAlertDialog({
  required BuildContext context,
  required String message,
  String? btnText,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        contentPadding: EdgeInsets.fromLTRB(20, 24, 20, 16), // Adjust padding
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min, // Set to min to allow shrinking
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: ReusableText(
                  text: message,
                  style: appStyle(10, AppConst.kBkDark, FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              btnText ?? "Ok",
              style: appStyle(10, AppConst.kBkDark, FontWeight.w600),
            ),
          ),
        ],
      );
    },
  );
}
