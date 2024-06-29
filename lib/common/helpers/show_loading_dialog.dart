import 'package:flutter/material.dart';
import 'package:handy_helper_main/common/utils/constants.dart';
import 'package:handy_helper_main/common/widgets/app_style.dart';
import 'package:handy_helper_main/common/widgets/reusable_text.dart';

showLoadingDialog({
  required BuildContext context,
  required String message,
}) async {
  
  return await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                const CircularProgressIndicator(
                  color: AppConst.kBkDark,
                ),
                const SizedBox(width: 20),
                Expanded(
                    child: ReusableText(
                  text: message,
                  style: appStyle(16, AppConst.kBkDark, FontWeight.w700),
                )
                    // Text(
                    //   message,
                    //   style: TextStyle(
                    //     fontSize: 15,
                    //     color: AppConst.kBkDark,
                    //     height: 1.5,
                    //   ),
                    // ),
                    ),
              ],
            ),
          ],
        ),
      );
    },
  );
}
