import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:handy_helper_main/auth/repo_and_controller/auth_controller.dart';
import 'package:handy_helper_main/auth/repo_and_controller/auth_repository.dart';
import 'package:handy_helper_main/bookings/repo_and_controller/booking_controller.dart';
import 'package:handy_helper_main/common/modals/booking_model.dart';
import 'package:handy_helper_main/common/modals/user_model.dart';
import 'package:handy_helper_main/common/utils/add_task.dart';
import 'package:handy_helper_main/common/utils/constants.dart';
import 'package:handy_helper_main/common/widgets/app_style.dart';
import 'package:handy_helper_main/common/widgets/custom_otln_button.dart';
import 'package:handy_helper_main/common/widgets/reusable_text.dart';
import 'package:handy_helper_main/common/widgets/task_tile.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DashBoardScreenState();
}

class _DashBoardScreenState extends ConsumerState<DashboardScreen> {
  String time = "";
  String date = "";
  void method1(String val) {
    time = val.substring(11, 16);
    date = val.substring(0, 10);
  }

  @override
  void initState() {
    super.initState();
  }

  Future<String?> getName() async {
    try {
      // Await the result of the Firestore query
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('customer')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();

      UserModel itsme =
          UserModel.fromMap(snapshot.data() as Map<String, dynamic>);
      return itsme.username;

      // Check if the snapshot exists and contains data
      if (snapshot.exists && snapshot.data() != null) {
        // Access the data and return the name (assuming there's a field called 'name')
        // return snapshot.data()!['name'] ??
        // ''; // Return name if it exists, otherwise return an empty string
      } else {
        // Handle case where snapshot doesn't exist or data is null
        // return ''; // Return an empty string
      }
    } catch (error) {
      // Handle errors
      print('Error getting name: $error');
      // return ''; // Return an empty string in case of error
    }
  }

  @override
  Widget build(BuildContext context) {
    // Future<List<BookingModel>> lis =
    //     ref.read(bookingControllerProvider).allbookings();
    // List<BookingModel> dataList = await lis;
    // print(dataList);

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Book a Service',
                  style: appStyle(24, AppConst.kLight, FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    children: [
                      _buildServiceButton(context, 'cook'),
                      _buildServiceButton(context, 'cleaner'),
                      _buildServiceButton(context, 'electrician'),
                      _buildServiceButton(context, 'plumber'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          FutureBuilder<List<BookingModel>>(
            future: ref.read(bookingControllerProvider).allPendingBookings(),
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
                      name: dataList[index].partnername,
                      title: dataList[index].servicetype,
                      description:
                          " ${dataList[index].date} | ${dataList[index].time}",
                      switcher: Switch(
                          value: !(dataList[index].status == '0'),
                          onChanged: (value) {
                            ref.read(bookingControllerProvider).completeTask(
                                  time: dataList[index].time,
                                  date: dataList[index].date,
                                  servicetype: dataList[index].servicetype,
                                  partnerid: dataList[index].partnerid,
                                  customername: dataList[index].customername,
                                  partnername: dataList[index].partnername,
                                  context: context,
                                  mounted: mounted,
                                );
                          }),
                      // end: dataList[index].time,
                    );
                    // return ListTile(
                    //   title: Text(dataList[index].customerid),
                    // );
                  },
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildServiceButton(BuildContext context, String serviceName) {
    String servicetype = serviceName;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          // Show a modal sheet when the button is tapped
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AddTask(method1),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () async {
                        print("*****");
                        print(date);
                        print(time);

                        String? myname = await getName();

                        QuerySnapshot qS = await FirebaseFirestore.instance
                            .collection(serviceName)
                            .orderBy('orders')
                            .get();

                        List<UserModel> usersList = qS.docs
                            .map((doc) => UserModel.fromMap(
                                doc.data() as Map<String, dynamic>))
                            .toList();

                        print("))))");
                        print(usersList[0].username);

                        ref
                            .read(bookingControllerProvider)
                            .saveBookingToFirestore(
                              time: time,
                              date: date,
                              status: "0",
                              servicetype: servicetype,
                              partnerid: usersList[0].uid,
                              customername: myname!,
                              partnername: usersList[0].username,
                              context: context,
                              mounted: mounted,
                            );

                        print(myname);

                        Navigator.pop(context); // Close the modal sheet
                      },
                      child: Text(
                        'Submit',
                        textAlign: TextAlign.center,
                        style: appStyle(16, AppConst.kBkDark, FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppConst.kRadius),
            color: AppConst.kLight,
          ),
          width: double.infinity,
          height: 100,
          child: Center(
            child: ReusableText(
              text: serviceName,
              style: appStyle(24, AppConst.kBkDark, FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
