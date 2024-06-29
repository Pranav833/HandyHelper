import 'package:flutter/material.dart';
import 'package:handy_helper_main/bookings/repo_and_controller/booking_controller.dart';
import 'package:handy_helper_main/common/modals/booking_model.dart';
import 'package:handy_helper_main/common/utils/constants.dart';
import 'package:handy_helper_main/common/widgets/app_style.dart';
import 'package:handy_helper_main/common/widgets/task_tile.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CPreviousOrdersScreen extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CPreviousOrderScreenState();
}

class _CPreviousOrderScreenState extends ConsumerState<CPreviousOrdersScreen> {
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          const SizedBox(height: 16),
          FutureBuilder<List<BookingModel>>(
            future: ref.read(bookingControllerProvider).allCompletedBookings(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // Display a loading indicator while waiting for data
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                // Display an error message if data loading fails
                return Text('Error: ${snapshot.error}');
              } else {
                // Display the data when available
                List<BookingModel> dataList = snapshot.data!;
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: dataList.length,
                  itemBuilder: (context, index) {
                    return Todotile(
                      color: AppConst.kGreen,
                      name: dataList[index].partnername,
                      title: dataList[index].servicetype,
                      description:
                          " ${dataList[index].date} | ${dataList[index].time}",
                    );
                  },
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
