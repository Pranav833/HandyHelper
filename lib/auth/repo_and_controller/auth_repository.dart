import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:handy_helper_main/common/helpers/show_loading_dialog.dart';
import 'package:handy_helper_main/common/modals/user_model.dart';
import 'package:handy_helper_main/common/routes/routes.dart';
import 'package:handy_helper_main/common/utils/firebase_storage_repository.dart';
import 'package:handy_helper_main/common/helpers/show_dialogue.dart';

final authRepositoryProvider = Provider((ref) {
  return AuthRepository(
    auth: FirebaseAuth.instance,
    firestore: FirebaseFirestore.instance,
    realtime: FirebaseDatabase.instance,
  );
});

class AuthRepository {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;
  final FirebaseDatabase realtime;

  AuthRepository({
    required this.auth,
    required this.firestore,
    required this.realtime,
  });

  Stream<UserModel> getUserPresenceStatus({required String uid}) {
    return firestore
        .collection('users')
        .doc(uid)
        .snapshots()
        .map((event) => UserModel.fromMap(event.data()!));
  }

  void updateUserPresence() {
    Map<String, dynamic> online = {
      'active': true,
      'lastSeen': DateTime.now().millisecondsSinceEpoch,
    };
    Map<String, dynamic> offline = {
      'active': false,
      'lastSeen': DateTime.now().millisecondsSinceEpoch,
    };

    final connectedRef = realtime.ref('.info/connected');

    connectedRef.onValue.listen((event) async {
      final isConnected = event.snapshot.value as bool? ?? false;
      if (isConnected) {
        await realtime.ref().child(auth.currentUser!.uid).update(online);
      } else {
        realtime
            .ref()
            .child(auth.currentUser!.uid)
            .onDisconnect()
            .update(offline);
      }
    });
  }

  Future<UserModel?> getCurrentUserInfo() async {
    UserModel? user;
    final userInfo =
        await firestore.collection('users').doc(auth.currentUser?.uid).get();

    if (userInfo.data() == null) return user;
    user = UserModel.fromMap(userInfo.data()!);
    return user;
  }

  Future<String> getServiceProvider({required String type}) async {
    print("Fetching all bookings...");
    // Future<UserModel?>
    QuerySnapshot querySnapshot =
        await firestore.collection(type).orderBy('orders').get();

    List<UserModel> list = querySnapshot.docs
        .map((doc) => UserModel.fromMap(doc.data() as Map<String, dynamic>))
        .toList();

    return list.isNotEmpty
        ? list[0].uid
        : ''; // Return the uid if list is not empty, otherwise return an empty string
  }

  void saveUserInfoToFirestore({
    required String username,
    required String gender,
    required String dob,
    required String city,
    required ProviderRef ref,
    required BuildContext context,
    required bool mounted,
    required String collectionname,
    int? orders,
    String? type,
  }) async {
    try {
      showLoadingDialog(
        context: context,
        message: "Saving user info ... ",
      );
      String uid = auth.currentUser!.uid;

      UserModel user = UserModel(
        username: username,
        uid: uid,
        phoneNumber: auth.currentUser!.phoneNumber!,
        city: city,
        dob: dob,
        gender: gender,
        orders: orders,
        type: type,
      );

      await firestore.collection(collectionname).doc(uid).set(user.toMap());
      if (!mounted) return;

      if (collectionname == "customer") {
        Navigator.pushNamedAndRemoveUntil(
          context,
          Routes.u_home,
          (route) => false,
        );
      } else {
        Navigator.pushNamedAndRemoveUntil(
          context,
          Routes.p_home,
          (route) => false,
        );
      }
    } catch (e) {
      Navigator.pop(context);
      showAlertDialog(context: context, message: e.toString());
    }
  }

  void verifyOtp({
    required BuildContext context,
    required String smsCodeId,
    required String smsCode,
    required bool mounted,
  }) async {
    try {
      showLoadingDialog(
        context: context,
        message: 'Verifiying code ... ',
      );
      final credential = PhoneAuthProvider.credential(
        verificationId: smsCodeId,
        smsCode: smsCode,
      );
      await auth.signInWithCredential(credential);
      // UserModel? user = await getCurrentUserInfo();
      if (!mounted) return;
      Navigator.pushNamedAndRemoveUntil(
        context,
        Routes.user_type,
        (route) => false,
      );
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      showAlertDialog(context: context, message: e.toString());
    }
  }

  void sendSmsCode({
    required BuildContext context,
    required String phoneNumber,
  }) async {
    try {
      showLoadingDialog(
        context: context,
        message: "Sending a verification code to $phoneNumber",
      );
      await auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential);
        },
        verificationFailed: (e) {
          Navigator.pop(context);
          showAlertDialog(context: context, message: e.toString());
        },
        codeSent: (smsCodeId, resendSmsCodeId) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            Routes.otp,
            (route) => false,
            arguments: {
              'phone': phoneNumber,
              'smsCodeId': smsCodeId,
            },
          );
        },
        codeAutoRetrievalTimeout: (String smsCodeId) {},
      );
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      showAlertDialog(context: context, message: e.toString());
    }
  }
}
