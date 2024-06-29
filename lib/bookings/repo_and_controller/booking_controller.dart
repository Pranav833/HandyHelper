import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:handy_helper_main/bookings/repo_and_controller/booking_repository.dart';
import 'package:handy_helper_main/common/modals/booking_model.dart';
import 'package:handy_helper_main/common/modals/user_model.dart';
import 'package:handy_helper_main/auth/repo_and_controller/auth_repository.dart';

final bookingControllerProvider = Provider((ref) {
  final BookingRepository = ref.watch(bookingRepositoryProvider);
  return BookingController(bookingRepository: BookingRepository, ref: ref);
});

class BookingController {
  final BookingRepository bookingRepository;
  final ProviderRef ref;

  BookingController({required this.bookingRepository, required this.ref});

  void saveBookingToFirestore({
    required String time,
    required String date,
    required String status,
    required String servicetype,
    required String customername,
    required String partnername,
    required String partnerid,
    required BuildContext context,
    required bool mounted,
  }) {
    bookingRepository.saveBookingToFirestore(
      time: time,
      date: date,
      status: status,
      servicetype: servicetype,
      partnerid: partnerid,
      customername: customername,
      partnername: partnername,
      ref: ref,
      context: context,
      mounted: mounted,
    );
  }

  Future<List<BookingModel>> allPendingBookings() {
    return bookingRepository.allPendingBookings();
  }

  Future<List<BookingModel>> allCompletedBookings() {
    return bookingRepository.allCompletedBookings();
  }

  Future<List<BookingModel>> allCustomersCompletedBookings() {
    return bookingRepository.allCustomersCompletedBookings();
  }

  Future<List<BookingModel>> allCustomersPendingBookings() {
    return bookingRepository.allCustomersPendingBookings();
  }

  void completeTask({
    required String time,
    required String date,
    required String servicetype,
    required String partnerid,
    required String customername,
    required String partnername,
    required BuildContext context,
    required bool mounted,
  }) {
    bookingRepository.completeTask(
      time: time,
      date: date,
      servicetype: servicetype,
      partnerid: partnerid,
      customername: customername,
      partnername: partnername,
      ref: ref,
      context: context,
      mounted: mounted,
    );
  }
}
