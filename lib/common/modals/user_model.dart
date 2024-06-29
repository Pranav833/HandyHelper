class UserModel {
  final String username;
  final String uid;
  final String dob;
  final String city;
  final String phoneNumber;
  final String gender;
  final int? orders;
  final String? type;

  UserModel(
      {required this.username,
      required this.uid,
      required this.phoneNumber,
      required this.city,
      required this.dob,
      required this.gender,
      this.orders,
      this.type});

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'uid': uid,
      'phoneNumber': phoneNumber,
      'dob': dob,
      'gender': gender,
      'city': city,
      'orders': orders,
      'type': type,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        username: map['username'] ?? '',
        uid: map['uid'] ?? '',
        city: map['city'] ?? '',
        phoneNumber: map['phoneNumber'] ?? '',
        dob: map['dob'] ?? '',
        gender: map['gender'] ?? '',
        orders: map['orders'],
        type: map['type']);
  }
}
