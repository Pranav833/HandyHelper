import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:handy_helper_main/common/utils/constants.dart';
import 'package:handy_helper_main/common/widgets/custom_otln_button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart'
    as picker;

class AddTask extends ConsumerStatefulWidget {
  const AddTask(this.method1, {super.key});

  final void Function(String) method1;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddTaskState();
}

class _AddTaskState extends ConsumerState<AddTask> {
  String start = "";
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: CustomOtlnBtn(
          height: 52,
          width: AppConst.kWidth,
          color: AppConst.kLight,
          color2: AppConst.kGreyDk,
          // text: start == "" ? "Start Time" : start.substring(10, 16),
          text: start == "" ? "Start Time" : start.substring(0, 16),
          onTap: () {
            picker.DatePicker.showDateTimePicker(context,
                showTitleActions: true,
                minTime: DateTime(2024, 1, 1, 00, 00),
                maxTime: DateTime(2024, 12, 31, 23, 59), onConfirm: (date) {
              setState(() {
                start = date.toString();
                widget.method1(start);
              });
            }, locale: picker.LocaleType.en);
          },
        ),
      ),
    );
  }
}
