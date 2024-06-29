class BookingModel {
  final String customerid;
  final String partnerid;
  final String date;
  final String time;
  final String status;
  final String servicetype;
  final String customername;
  final String partnername;

  BookingModel(
      {required this.customerid,
      required this.partnerid,
      required this.date,
      required this.status,
      required this.time,
      required this.servicetype,
      required this.customername,
      required this.partnername});

  Map<String, dynamic> toMap() {
    return {
      'customerid': customerid,
      'partnerid': partnerid,
      'phoneNumber': time,
      'date': date,
      'status': status,
      'servicetype': servicetype,
      'time': time,
      'customername': customername,
      'partnername': partnername,
    };
  }

  factory BookingModel.fromMap(Map<String, dynamic> map) {
    return BookingModel(
      customerid: map['customerid'] ?? '',
      partnerid: map['partnerid'] ?? '',
      time: map['time'] ?? '',
      date: map['date'] ?? '',
      status: map['status'] ?? '',
      servicetype: map['servicetype'] ?? '',
      customername: map['customername'] ?? '',
      partnername: map['partnername'] ?? '',
    );
  }
}
