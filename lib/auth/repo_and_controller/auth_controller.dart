import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:handy_helper_main/common/modals/user_model.dart';
import 'package:handy_helper_main/auth/repo_and_controller/auth_repository.dart';

final authControllerProvider = Provider((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return AuthController(authRepository: authRepository, ref: ref);
});

final userInfoAuthProvider = FutureProvider(
  (ref) {
    final authController = ref.watch(authControllerProvider);
    return authController.getCurrentUserInfo();
  },
);

class AuthController {
  final AuthRepository authRepository;
  final ProviderRef ref;

  AuthController({required this.authRepository, required this.ref});

  Stream<UserModel> getUserPresenceStatus({required String uid}) {
    return authRepository.getUserPresenceStatus(uid: uid);
  }

  void updateUserPresence() {
    authRepository.updateUserPresence();
  }

  Future<UserModel?> getCurrentUserInfo() async {
    UserModel? user = await authRepository.getCurrentUserInfo();
    return user;
  }

  void saveUserInfoToFirestore({
    required String username,
    required String gender,
    required String dob,
    required String city,
    required BuildContext context,
    required bool mounted,
    required String collectionname,
    int? orders,
    String? type,
  }) {
    authRepository.saveUserInfoToFirestore(
        username: username,
        gender: gender,
        dob: dob,
        city: city,
        ref: ref,
        context: context,
        mounted: mounted,
        collectionname: collectionname,
        type: type,
        orders: orders);
  }


  void verifyOtp({
    required BuildContext context,
    required String smsCodeId,
    required String smsCode,
    required bool mounted,
  }) {
    authRepository.verifyOtp(
      context: context,
      smsCodeId: smsCodeId,
      smsCode: smsCode,
      mounted: mounted,
    );
  }

  void sendSmsCode({
    required BuildContext context,
    required String phoneNumber,
  }) {
    authRepository.sendSmsCode(context: context, phoneNumber: phoneNumber);
  }
}
