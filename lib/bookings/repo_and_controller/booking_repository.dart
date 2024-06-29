import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:handy_helper_main/common/helpers/show_loading_dialog.dart';
import 'package:handy_helper_main/common/modals/booking_model.dart';
import 'package:handy_helper_main/common/modals/user_model.dart';
import 'package:handy_helper_main/common/routes/routes.dart';
import 'package:handy_helper_main/common/helpers/show_dialogue.dart';

final bookingRepositoryProvider = Provider((ref) {
  return BookingRepository(
    auth: FirebaseAuth.instance,
    firestore: FirebaseFirestore.instance,
    realtime: FirebaseDatabase.instance,
  );
});

class BookingRepository {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;
  final FirebaseDatabase realtime;

  BookingRepository({
    required this.auth,
    required this.firestore,
    required this.realtime,
  });

  void saveBookingToFirestore({
    required String partnerid,
    required String date,
    required String status,
    required String time,
    required String servicetype,
    required String customername,
    required String partnername,
    required ProviderRef ref,
    required BuildContext context,
    required bool mounted,
    // required bool customer
    // required String collectionname
  }) async {
    try {
      showLoadingDialog(
        context: context,
        message: "Saving user info ... ",
      );
      String uid = auth.currentUser!.uid;

      BookingModel task = BookingModel(
        customerid: uid,
        time: time,
        date: date,
        status: status,
        servicetype: servicetype,
        partnerid: partnerid,
        customername: customername,
        partnername: partnername,
      );

      await firestore
          .collection('bookings')
          .doc(uid + partnerid + date + time + servicetype)
          .set(task.toMap());
      if (!mounted) return;

      Navigator.pushNamedAndRemoveUntil(
        context,
        Routes.u_home,
        (route) => false,
      );
    } catch (e) {
      Navigator.pop(context);
      showAlertDialog(context: context, message: e.toString());
    }
  }

  Future<List<BookingModel>> allPendingBookings() async {
    try {
      print("Fetching all bookings...");

      QuerySnapshot querySnapshot = await firestore
          .collection('bookings')
          .where('customerid', isEqualTo: auth.currentUser!.uid)
          .where('status', isEqualTo: '0')
          .get();

      List<BookingModel> bookingList = querySnapshot.docs
          .map(
              (doc) => BookingModel.fromMap(doc.data() as Map<String, dynamic>))
          .toList();

      return bookingList;

      // final alldata = querySnapshot.docs.map((e) => e.data()).toList();
      // print(bookingList.length);
    } catch (e) {
      print("Error fetching bookings: $e");
      return [];
    }
  }

  Future<List<BookingModel>> allCompletedBookings() async {
    try {
      print("Fetching all bookings...");

      QuerySnapshot querySnapshot = await firestore
          .collection('bookings')
          .where('customerid', isEqualTo: auth.currentUser!.uid)
          .where('status', isEqualTo: '1')
          .get();

      List<BookingModel> bookingList = querySnapshot.docs
          .map(
              (doc) => BookingModel.fromMap(doc.data() as Map<String, dynamic>))
          .toList();

      return bookingList;

      // final alldata = querySnapshot.docs.map((e) => e.data()).toList();
      // print(bookingList.length);
    } catch (e) {
      print("Error fetching bookings: $e");
      return [];
    }
  }

  Future<List<BookingModel>> allCustomersPendingBookings() async {
    try {
      print("Fetching all bookings...");

      QuerySnapshot querySnapshot = await firestore
          .collection('bookings')
          .where('partnerid', isEqualTo: auth.currentUser!.uid)
          .where('status', isEqualTo: '0')
          .get();

      List<BookingModel> bookingList = querySnapshot.docs
          .map(
              (doc) => BookingModel.fromMap(doc.data() as Map<String, dynamic>))
          .toList();

      return bookingList;

      // final alldata = querySnapshot.docs.map((e) => e.data()).toList();
      // print(bookingList.length);
    } catch (e) {
      print("Error fetching bookings: $e");
      return [];
    }
  }

  Future<List<BookingModel>> allCustomersCompletedBookings() async {
    try {
      print("Fetching all bookings...");

      QuerySnapshot querySnapshot = await firestore
          .collection('bookings')
          .where('partnerid', isEqualTo: auth.currentUser!.uid)
          .where('status', isEqualTo: '1')
          .get();

      List<BookingModel> bookingList = querySnapshot.docs
          .map(
              (doc) => BookingModel.fromMap(doc.data() as Map<String, dynamic>))
          .toList();

      return bookingList;

      // final alldata = querySnapshot.docs.map((e) => e.data()).toList();
      // print(bookingList.length);
    } catch (e) {
      print("Error fetching bookings: $e");
      return [];
    }
  }

  void completeTask({
    required String partnerid,
    required String date,
    required String time,
    required String servicetype,
    required String customername,
    required String partnername,
    required ProviderRef ref,
    required BuildContext context,
    required bool mounted,
    // required bool customer
    // required String collectionname
  }) async {
    try {
      // showLoadingDialog(
      //   context: context,
      //   message: "Saving user info ... ",
      // );
      String uid = auth.currentUser!.uid;

      BookingModel task = BookingModel(
        customerid: uid,
        time: time,
        date: date,
        status: '1',
        servicetype: servicetype,
        partnerid: partnerid,
        customername: customername,
        partnername: partnername,
      );

      await firestore
          .collection('bookings')
          .doc(uid + partnerid + date + time + servicetype)
          .set(task.toMap());
      if (!mounted) return;

      Navigator.pushNamedAndRemoveUntil(
        context,
        Routes.u_home,
        (route) => false,
      );
    } catch (e) {
      Navigator.pop(context);
      showAlertDialog(context: context, message: e.toString());
    }
  }
}
