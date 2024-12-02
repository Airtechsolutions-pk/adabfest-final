import '../../../core/app_export.dart';

class AdminLoginModel {
  int eventID;
  int userID;
  String fullName;
  String email;

  AdminLoginModel({
    required this.eventID,
    required this.userID,
    required this.fullName,
    required this.email,
  });
}
